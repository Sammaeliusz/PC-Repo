#ifndef STATEMACHINE_H
#define STATEMACHINE_H
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
struct machine;
typedef void (*state)(struct machine* maszyna);
struct machine{
    state* p_to_state_array;
    int16_t num_of_states;
    int16_t max_num_of_states;
    int16_t current_state;
    int16_t next_state;
    int16_t num_of_interupts;
    /*context*/
    int16_t *p_to_memory;
    double *p_to_fp_memory;
    void *p_to_pointer_memory;
};

struct machine* createMachine(int16_t num_of_states, int16_t num_of_interupts, int16_t num_of_registers, int16_t num_of_vpointers);
void startMachine(struct machine* machine_to_start);
void interruptHandler(struct machine* machina);
void addState(struct machine* machina, state stan);
#endif