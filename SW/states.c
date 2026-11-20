#include "states.h"
void idleState(struct machine* machina){
    //printf("Dummy state ;)");
}
void initState(struct machine* machina){
    machina -> next_state = 2;
}
void measureTempState(struct machine* machina){
}