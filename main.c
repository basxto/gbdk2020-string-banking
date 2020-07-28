#include <gb/gb.h>
#include <stdio.h>
#include "bank1.h"
#include "bank2.h"

const char print0[] = " 0 prints from ";

void main() {
    printf(" \n Welcome to bank0\n\n");
    SWITCH_ROM_MBC1(1);
    printf("%s%s\n", print0, bank1);
    SWITCH_ROM_MBC1(2);
    printf("%s%s\n", print0, bank2);
    SWITCH_ROM_MBC1(1);
    printf("%s%s\n", print0, bank1);

    printf(" \n Missed bank switch:");
    printf("%s%s\n", print0, bank2);
}