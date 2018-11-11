/* TODO:
 * - Use alphabet for all operations (like distance calculation)
 * - Use stack pointers instead of heap pointers where possible
 * - Make number of individuals per round variable
 * - Make initial str random
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>


#define LEN 30 // including null-byte
#define INDIVIDUALS 10

const char goal[LEN] = "ME THINKS IT IS LIKE A WEASEL";
const char alphabet[LEN] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ ";
char str[LEN] = "KJFSA SDEFNWJANFL ASDFJQW FSP";


char**
make_individiuals(const char* parent, unsigned int amount) {

  // allocate list of individuals
  char** individuals = malloc(INDIVIDUALS * sizeof(char*));

  // populate individuals
  for(unsigned int i=0; i<amount; i++) {

    // allocate space for individual
    // The +1 is for the terminating null-byte
    individuals[i] = malloc(sizeof(char) * (LEN + 1));

    // copy parent
    strncpy(individuals[i], str, LEN);
    individuals[i][LEN] = '\0';

    // TODO mutate
    individuals[i][0] = "abcdefghijklmnopqrstuvwxyz_0123456789"[i]; // temp
  }
  
  return individuals;
}


unsigned int*
get_errors(const char* ideal, const char** individuals,
	   unsigned int population_size) {
  
  unsigned int* error_rates
    = malloc(sizeof(unsigned int) * population_size);
  
  for(unsigned int i=0; i<population_size; i++) {
    error_rates[i] = 0;

    // TODO
  }

  return error_rates;
}


unsigned int
string_distance(const char* s1, const char* s2){
  // TODO
  return 0; // temp
}


// zero-indexed
unsigned int
best(const unsigned int* error_rates, unsigned int amount) {
  // TODO
  return 0; // temp
}


int
main() {

  unsigned int generation = 1;
  while(strncmp(str, goal, LEN)){

    // reproduction
    const char** individuals =
      (const char**)make_individiuals(str, INDIVIDUALS);

    // determine error_rates
    // TODO can we do that on the stack and use strcpy instead of =?
    const unsigned int* error_rates =
      get_errors(goal, individuals, INDIVIDUALS);
    
    // selection
    unsigned int index_of_best = best(error_rates, INDIVIDUALS);
    strncpy(str, individuals[index_of_best], LEN);

    // show winner of this round
    printf("%s\n", str);
    generation++;

    // TODO
    strncpy(str, goal, LEN); // temp: End loop prematurely
  }
}
