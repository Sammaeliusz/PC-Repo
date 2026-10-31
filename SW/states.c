#include "states.h"
void dummyState(struct state kontekst, struct machine* machina){
    *(machina->p_to_memory)++;
    if(*(machina->p_to_memory)>machina->num_of_states){
        *(machina->p_to_memory) =1;
    }
    machina->next_state = *(machina->p_to_memory);
}