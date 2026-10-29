#ifndef STATEMACHINE_H
#define STATEMACHINE_H
#include <stdint.h>
#include "states.h"
#include <stdlib.h>
struct state
{
    void (*p_to_state_function)(void);
    /*State context*/
};
 
struct machine{
    struct state* p_to_state_array;
    int8_t current_state;
    int8_t next_state;
    /*context*/
};

struct machine* createMachine(int8_t num_of_states);
struct state createState();
void startMachine(struct machine* machine_to_start);
#endif