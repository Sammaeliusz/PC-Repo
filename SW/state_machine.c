#include "state_machine.h"

struct machine* createMachine(int8_t num_of_states){
    struct machine *maszyna = malloc(sizeof(struct machine));
    maszyna->current_state = 0;
    maszyna->next_state = 0;
    maszyna->p_to_state_array = calloc(num_of_states, sizeof(struct state));
    *maszyna->p_to_state_array = createState();
    return maszyna;
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
        //machine_to_start -> next_state = -1;
        (machine_to_start->p_to_state_array+machine_to_start->current_state)->p_to_state_function();
    }
}