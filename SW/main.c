#include "state_machine.h"
#include "states.h"
int main(){
    struct machine* default_machine = createMachine(32, 16, 64, 16);
    //Interupts: 0->Keyboard button pressed
    addState(default_machine, idleState);
    addState(default_machine, initState);
    addState(default_machine, checkKeyboard);
    addState(default_machine, measureTempState);
    if(default_machine != NULL){
        printf("Maszyna stworzona\n");
        startMachine(default_machine);
        return 0;
    }
    else{
        return -1;
    }
}