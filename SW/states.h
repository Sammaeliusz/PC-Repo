#ifndef STATES_H
#define STATES_H
#include <stdint.h>
#include "state_machine.h"
#include <stdio.h>
void idleState(struct machine* machina);
void initState(struct machine* machina);
void measureTempState(struct machine* machina);
void measureHumState(struct machine* machina);
void measureLightState(struct machine* machina);
void checkKeyboard(struct machine* machina);
void showValue(struct machine* machina);
#endif