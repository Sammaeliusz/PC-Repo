#include "state_machine.h"
int main(){
    struct machine* default_machine = createMachine(5);
    printf("Maszyna stworzona\n");
    startMachine(default_machine);
    return 0;
}