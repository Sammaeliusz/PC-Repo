#include "state_machine.h"
#include "states.h"
#include <stdbool.h>
struct machine* createMachine(int16_t num_of_states, int16_t num_of_registers, int16_t num_of_vpointers){
    if(!(num_of_states < 16 || num_of_registers < 32)){
        struct machine *maszyna = malloc(sizeof(struct machine));
        maszyna->num_of_states = 0;
        maszyna->max_num_of_states = num_of_states;
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
void addState(struct machine* machina, struct state stan){
    if(machina->num_of_states+1>machina->max_num_of_states){
        printf("Reached max number of states");
    }else{
        machina->num_of_states++;
        machina->p_to_state_array[machina->num_of_states] = stan;
        printf("Poprawnie dodano stan");
    }
}
void interruptHandler(struct machine* machina){
    bool interupted = false;
    for(int i = 1; i<=machina->num_of_states; i++){
        if(machina->p_to_memory[i]==0){
            machina->current_state = i;
            interupted = true;
        }
    }
    if(!interupted){
        machina->current_state = machina -> next_state;
        machina -> next_state = 0;
    }
}
void startMachine(struct machine* machine_to_start){
    while(machine_to_start->next_state != -1){
        //printf("Maszyna dziala\n");
        interruptHandler(machine_to_start);
        struct state curr_state = *(machine_to_start->p_to_state_array+machine_to_start->current_state);
        curr_state.p_to_state_function(curr_state, machine_to_start);
    }
}