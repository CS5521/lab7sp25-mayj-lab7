#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{
  if (argc <= 3) {
    printf(1, "usage: schedtest loops tickets1 [ tickets2 ... ticketsN ]\n");
    printf(1, "      loops must be greater than 0\n");
    printf(1, "      tickets must be greater than or equal to 10\n");
    printf(1, "      up to 7 tickets can be provided\n");
    exit();
  }

  int loops = atoi(argv[1]);
  if (loops <= 0) {
    printf(1, "loops must be greater than 0\n");
    exit();
  }

  if (argc > 9) {
    printf(1, "up to 7 tickets can be provided\n");
    exit();
  }
  
  int i; // This is needed for C89 mode compile
  int numProcess = 0;
  int tickets[7], pids[7];

  // Loop through arguments to get tickets
  for (i = 2; i < argc; i++) {
    int t = atoi(argv[i]);
    if (t < 10) {
      printf(1, "tickets must be greater than or equal to 10\n");
      exit();
    }
    tickets[numProcess] = t;
    numProcess++;
  }

  // Child processes
  for (i = 0; i < numProcess; i++) {
    int pid = fork();
    if (pid == 0) {
      // Make a system call to settickets with its tickets value 
      settickets(tickets[i]);
      // Call a function that infinitely loops
      while(1);
    }
    // Store the pid for later kill process
    pids[i] = pid;
  }

  // Parent process executes {loops} time
  for (i = 0; i < loops; i++) {
    // Call ps in a loop
    ps();
    // Call the sleep with a param of 3
    sleep(3);
  }

  // Call kill on each process
  for (i = 0; i < numProcess; i++) {
    kill(pids[i]); 
  }


  // Call wait to reap each child
  for (i = 0; i < numProcess; i++) {
    wait();
  } 
  
  // Exit the program  
  exit();
}
