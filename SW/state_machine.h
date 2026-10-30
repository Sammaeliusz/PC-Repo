#ifndef STATEMACHINE_H
#define STATEMACHINE_H
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

struct machine;

struct state
{
    void (*p_to_state_function)(struct state self, struct machine* maszyna);
    /*State context*/
    int16_t inter_int[16];
    double inter_double[16];
};
 
struct machine{
    struct state* p_to_state_array;
    int16_t current_state;
    int16_t next_state;
    /*context*/
    int16_t *p_to_memory;
    double *p_to_fp_memory;
    void *p_to_pointer_memory;
};

struct machine* createMachine(int16_t num_of_states, int16_t num_of_registers, int16_t num_of_vpointers);
struct state createState();
void startMachine(struct machine* machine_to_start);
void interruptHandler(struct machine* machina);
#endif