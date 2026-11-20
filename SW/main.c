#include "state_machine.h"
#include "states.h"
int main(){
    struct machine* default_machine = createMachine(16, 32, 8);
    addState(default_machine, idleState);
    addState(default_machine, initState);
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