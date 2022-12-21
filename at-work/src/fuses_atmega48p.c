#include <avr/io.h>

FUSES = {
    .low = (
        // CKDIV8: 0 (on)
        FUSE_CKDIV8 &
        // CKOUT: 1 (off)
        // SUT (startup time): 10 (14CK + 65ms)
        FUSE_SUT0 &
        // CKSEL: 0010 (internal RC oscillator @ 8MHz)
        FUSE_CKSEL3 &
        FUSE_CKSEL2 &
        FUSE_CKSEL0
    ),
    .high = (
        // RSTDISBL: 1 (off)
        // DWEN: 1 (off)
        // SPIEN: 0 (on)
        FUSE_SPIEN
        // WDTON: 1 (off)
        // EESAVE: 1 (off)
        // BODLEVEL: 111 (disabled)
    ),
    .extended = (
        // SELFPRGEN: 1 (default)
        0xFF
    )
};
