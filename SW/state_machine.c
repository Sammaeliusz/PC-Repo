#include "state_machine.h"
#include "states.h"
struct machine* createMachine(int16_t num_of_states, int16_t num_of_registers, int16_t num_of_vpointers){
    if(!(num_of_states < 16 || num_of_registers < 32)){
        struct machine *maszyna = malloc(sizeof(struct machine));
        maszyna->current_state = 0;
        maszyna->next_state = 0;
        maszyna->p_to_state_array = calloc(num_of_states, sizeof(struct state));
        *maszyna->p_to_state_array = createState();
        maszyna->p_to_memory = calloc(num_of_registers, sizeof(int16_t));
        maszyna->p_to_fp_memory = calloc(num_of_registers, sizeof(double));
        maszyna->p_to_pointer_memory = calloc(num_of_vpointers, sizeof(void*));
        return maszyna;
    }else{
        printf("Machine have unsuportet parametrs\n");
        return NULL;
    }
}
struct state createState(){
    struct state stan;
    stan.p_to_state_function = dummyState;
    return stan;
}
void startMachine(struct machine* machine_to_start){
    while(machine_to_start->next_state != -1){
        //printf("Maszyna dziala\n");
        machine_to_start->current_state = machine_to_start -> next_state;
        machine_to_start -> next_state = 0;
        struct state curr_state = *(machine_to_start->p_to_state_array+machine_to_start->current_state);
        curr_state.p_to_state_function(curr_state, machine_to_start);
    }
}