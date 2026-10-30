#include "state_machine.h"
int main(){
    struct machine* default_machine = createMachine(8, 32, 8);
    if(default_machine != NULL){
        printf("Maszyna stworzona\n");
        startMachine(default_machine);
        return 0;
    }
    else{
        return -1;
    }
}