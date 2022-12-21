#include <avr/interrupt.h>
#include <avr/io.h>
#include <avr/sleep.h>
#include <stdlib.h>
#include <util/delay.h>

/**********************************************************
 * Functions that operate with specific ports and pins.
 */

static inline void head_coil_off()
{
    // Turn off the head coil.
    cli();
    PORTC &= ~0x31;
    PORTD &= ~0x31;
    sei();
}

static inline void head_coil_forward()
{
    // Apply forward voltage to the head coil.
    cli();
    PORTC |= 0x31;
    PORTD &= ~0x31;
    sei();
}

static inline void head_coil_reverse()
{
    // Apply reverse voltage to the head coil.
    cli();
    PORTC &= ~0x31;
    PORTD |= 0x31;
    sei();
}

static inline void motor_off()
{
    // Turn all outputs off.
    // Pull N gates down and P gates up.
    PORTB |= _BV(PB1);
    PORTB &= ~(_BV(PB0) | _BV(PB2));
    PORTD |= _BV(PD5) | _BV(PD7);
    PORTD &= ~_BV(PD6);
}

static inline void motor_step1()
{
    // U- V+ W~
    PORTD |= _BV(PD6);  // U-
    PORTD &= ~_BV(PD7); // V+
}

static inline void motor_step2()
{
    // U- V~ W+
    PORTD |= _BV(PD6);  // U-
    PORTB &= ~_BV(PB1); // W+
}

static inline void motor_step3()
{
    // U~ V- W+
    PORTB |= _BV(PB0);  // V-
    PORTB &= ~_BV(PB1); // W+
}

static inline void motor_step4()
{
    // U+ V- W~
    PORTD &= ~_BV(PD5); // U+
    PORTB |= _BV(PB0);  // V-
}

static inline void motor_step5()
{
    // U+ V~ W-
    PORTD &= ~_BV(PD5); // U+
    PORTB |= _BV(PB2);  // W-
}

static inline void motor_step6()
{
    // U~ V+ W-
    PORTD &= ~_BV(PD7); // V+
    PORTB |= _BV(PB2);  // W-
}

/**********************************************************
 * Head movement functions.
 */

/* Empirically found values */
#define MAX_HEAD_MOVEMENT_DISTANCE 300
#define HEAD_FORWARD_PULSE_DURATION_uS 500
#define HEAD_REVERSE_PULSE_DURATION_uS 100  // moving head backward is much easier

static int move_head_forward(int distance)
{
    // Move head to the center of disk.
    // Return duration of the movement in ms.
    if(distance < 0) {
        return 0;
    }
    if(distance > MAX_HEAD_MOVEMENT_DISTANCE) {
        distance = MAX_HEAD_MOVEMENT_DISTANCE;
    }
    for(int i = 0; i < distance; i++ ) {
        _delay_us(HEAD_FORWARD_PULSE_DURATION_uS / 2);
        head_coil_forward();
        _delay_us(HEAD_FORWARD_PULSE_DURATION_uS / 2);
        head_coil_off();
    }
    return distance / (1000 / HEAD_FORWARD_PULSE_DURATION_uS);
}

static int move_head_back(int distance)
{
    // Move head back to the edge of disk.
    // Return duration of the movement in ms.
    if(distance < 0) {
        return 0;
    }
    if(distance > MAX_HEAD_MOVEMENT_DISTANCE) {
        distance = MAX_HEAD_MOVEMENT_DISTANCE;
    }
    for(int i = 0; i < distance; i++ ) {
        _delay_us(HEAD_REVERSE_PULSE_DURATION_uS / 2);
        head_coil_reverse();
        _delay_us(HEAD_REVERSE_PULSE_DURATION_uS / 2);
        head_coil_off();
    }
    return distance / (1000 / HEAD_REVERSE_PULSE_DURATION_uS);
}

static int simulate_head_work(int duration, int delay_between_movements)
{
    // Move head randomly. Return head position.
    // Position is very approximate.
    int distance;
    int current_position = 0;
    int next_position = 0;

    delay_between_movements >>= 1;  // divide by 2 for use in calculations below

    while(duration > 0) {
        next_position = rand() % MAX_HEAD_MOVEMENT_DISTANCE;
        distance = next_position - current_position;
        if(distance < 0) {
            duration -= move_head_back(-distance);
        } else {
            duration -= move_head_forward(distance);
        }
        current_position = next_position;

        for(int i = delay_between_movements + rand() % delay_between_movements; i > 0; i--) {
            _delay_ms(1);
            duration -= 1;
        }
    }
    return current_position;
}

/**********************************************************
 * Spindle rotating.
 */

/**********************************************************
 * Main function.
 */

int main()
{
    /* Init ports. */

    // While pins are inputs yet, turn on pullup resistors for P-MOSFET gates
    // to smoothly change port direction.
    PORTB |= _BV(PB0) | _BV(PB2);
    PORTD |= _BV(PD6);

    // Make all pins outputs.
    DDRB = 0xFF;
    DDRC = 0xFF;
    DDRD = 0xFF;

    /* init timers */

    /* 8-bit timer 0 */
    /*
    TCCR0A |= _BV(WGM01) | _BV(WGM00)    // Fast PWM mode, TOP=0xFF
            | _BV(COM0A1) | _BV(COM0A0); // Set OC0A on Compare Match, clear OC0A at BOTTOM (inverting mode)
    OCR0A = 200;
    TCCR0B |= _BV(CS00); // start timer, no prescaler
    */

/* pulse parameters define coil drive strength */
#define MOTOR_COIL_PULSE_uS 300
#define MOTOR_COIL_PAUSE_uS 300

    int phase_step = 0;
    int period = 35; // 1 rotation per second / 6 steps, ms == 167
    for(;;) {
        int duration = period;
        int duration_us = 0;
        while(duration > 0) {
            switch(phase_step) {
                case 0:
                    motor_step1();
                    break;
                case 1:
                    motor_step2();
                    break;
                case 2:
                    motor_step3();
                    break;
                case 3:
                    motor_step4();
                    break;
                case 4:
                    motor_step5();
                    break;
                default:
                    motor_step6();
                    break;
            }
            _delay_us(MOTOR_COIL_PULSE_uS);
            duration_us += MOTOR_COIL_PULSE_uS;
            motor_off();
            _delay_us(MOTOR_COIL_PAUSE_uS);
            duration_us += MOTOR_COIL_PAUSE_uS;
            while(duration_us > 1000) {
                duration -= 1;
                duration_us -= 1000;
            }
        }
        if(++phase_step > 5) {
            phase_step = 0;
        }
    }

    for(;;) {
        int head_position;

        head_position = simulate_head_work(2000, 40);
        _delay_ms(3000);
        move_head_back(head_position); // park heads
        _delay_ms(3000);

        head_position = simulate_head_work(3000, 300);
        _delay_ms(3000);
        move_head_back(head_position); // park heads
        _delay_ms(3000);
    }

    /* do nothing */
    sei();
    set_sleep_mode(SLEEP_MODE_IDLE);
    for(;;) {
        sleep_enable();
        sleep_cpu();
    }
    return 0;
}
