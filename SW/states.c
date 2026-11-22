#include "states.h"
void idleState(struct machine* machina){
    //printf("Dummy state ;)");
}
void initState(struct machine* machina){
    machina -> next_state = 2;
}
void measureTempState(struct machine* machina){
}
void checkKeyboard(struct machine* machina){
    //In należy połączyć z IO klawiatury, 4 starsze bity to wyjścia a 4 młodsze wejścia
    uint8_t In=2;
    const char Map[16] = "*0#A123B456C789D";
    for(int i=0; i<4; i++){
        In ^= (1)<<(i+4);
        for(int j=0; j<4; j++){
            if((In&(1<<j))!=0){
                printf("%c",Map[4*j+i]);
                machina->p_to_memory[machina->num_of_interupts] = Map[4*j+i];
                machina->p_to_memory[0] = 0;
            }
        }
    }
}