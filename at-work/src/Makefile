PRG            = zombie
MCU_TARGET     = atmega48p
PROG_TARGET    = m48p

HEX            = $(PRG).hex

FUSES          = fuses_$(MCU_TARGET)
FUSES_HEX      = $(FUSES).hex

OBJ            = main.o $(FUSES).o

OPTIMIZE       = -Os

DEFS           = -D F_CPU=1000000
LIBS           =

CC             = avr-gcc

override CFLAGS        = -g -Wall $(OPTIMIZE) -mmcu=$(MCU_TARGET) $(DEFS) -I../include
override LDFLAGS       = -Wl,-Map,$(PRG).map

OBJCOPY        = avr-objcopy
OBJDUMP        = avr-objdump

all: $(PRG).elf lst text

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(PRG).elf: $(OBJ)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)

clean:
	rm -rf *.o $(PRG).elf *.bak *.lst *.map *.hex *.bin *.srec

fuses:
	avrdude -p $(PROG_TARGET) -c usbtiny -U efuse:w:`dd if=$(FUSES_HEX) bs=1 count=1 skip=2 | hexdump -e '/1 "0x%02X"'`:m
	avrdude -p $(PROG_TARGET) -c usbtiny -U hfuse:w:`dd if=$(FUSES_HEX) bs=1 count=1 skip=1 | hexdump -e '/1 "0x%02X"'`:m
	avrdude -p $(PROG_TARGET) -c usbtiny -U lfuse:w:`dd if=$(FUSES_HEX) bs=1 count=1 skip=0 | hexdump -e '/1 "0x%02X"'`:m

upload:
	avrdude -p $(PROG_TARGET) -c usbtiny -U flash:w:$(HEX)

lst:  $(PRG).lst

%.lst: %.elf
	$(OBJDUMP) -h -S $< > $@

# Rules for building the .text rom images

text: hex bin srec $(FUSES_HEX)

hex:  $(PRG).hex
bin:  $(PRG).bin
srec: $(PRG).srec

%.hex: %.elf
	$(OBJCOPY) -j .text -j .data -O ihex $< $@

%.srec: %.elf
	$(OBJCOPY) -j .text -j .data -O srec $< $@

%.bin: %.elf
	$(OBJCOPY) -j .text -j .data -O binary $< $@

$(FUSES_HEX): $(PRG).elf
	$(OBJCOPY) -j .fuse -O binary $< $@
