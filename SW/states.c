#include "states.h"
void dummyState(struct machine* machina){
    printf("From the dummy state");
    machina->next_state = 0;
}