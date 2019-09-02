#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>

#ifndef APL_MAJOR
#error Must pass APL_MAJOR to the compiler (eg "10")
#define APL_MAJOR ""
#endif

#define AWS_EXECUTION_ENV "AWS_Lambda_apl" APL_MAJOR "_lambci"
#define MIN_MEM_SIZE 128
#define ARG_BUF_SIZE 32
#define FILENAME_BUF_SIZE 128

#define DYALOG "/opt/mdyalog/17.1/64/unicode/"
#define APL_TEXTINAPLCORE "1"
#define MAXWS "256M"

int main(void) {
  setenv("DYALOG", DYALOG, true);
  char wsppath[FILENAME_BUF_SIZE];
  snprintf(wsppath, FILENAME_BUF_SIZE, "%s/ws",DYALOG);
  setenv("WSPATH", wsppath, true);
  setenv("TRACE_ON_ERROR", "0", true);
  char sessionfile[FILENAME_BUF_SIZE];
  snprintf(sessionfile, FILENAME_BUF_SIZE, "%s/default.dse",DYALOG);
  setenv("SESSION_FILE", sessionfile,true);
  setenv("APL_TEXTINAPLCORE", APL_TEXTINAPLCORE,true);
  setenv("MAXWS", MAXWS, true);
 
  setenv("AWS_EXECUTION_ENV", AWS_EXECUTION_ENV, true);

  const char *mem_size_str = getenv("AWS_LAMBDA_FUNCTION_MEMORY_SIZE");
  int mem_size = mem_size_str != NULL ? atoi(mem_size_str) : MIN_MEM_SIZE;

  char max_semi_space_size[ARG_BUF_SIZE];
  snprintf(max_semi_space_size, ARG_BUF_SIZE, "--max-semi-space-size=%d", mem_size * 5 / 100);

  char max_old_space_size[ARG_BUF_SIZE];
  snprintf(max_old_space_size, ARG_BUF_SIZE, "--max-old-space-size=%d", mem_size * 90 / 100);

  //  char *const parmList[] = {"/bin/ls", "-la", NULL};
  char *const parmList[] = {"+s", "/opt/apllambda/Distribution/apllambda.dws", NULL};
  char dyalogexe[FILENAME_BUF_SIZE];
  snprintf(dyalogexe, FILENAME_BUF_SIZE, "%s/dyalog",DYALOG);
 // printf( "Ready to lunch %s:\n", dyalogexe);
  execv(dyalogexe,  parmList);
  //                            "<$@",
  perror("Could not execv");
  return EXIT_FAILURE;
}
