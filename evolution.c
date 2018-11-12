/* TODO:
 * - Make number of individuals per round variable
 * - Make initial str random
 * - Make length of string variable
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>


#define LEN 30 // including null-byte
#define INDIVIDUALS 10

const char goal[LEN] = "ME THINKS IT IS LIKE A WEASEL";
char str[LEN]        = "KJFSA SDEFNWJANFL ASDFJQW FSP";
const char* alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ ";


unsigned int
alphabet_index(char letter) {
  return strchr(alphabet, letter) - alphabet;
}


char
mutate(char letter) {

  // find index in alphabet
  int alphabet_i = alphabet_index(letter);

  // increment or decrement
  if(random() % 2) {
    alphabet_i++;
  }else{
    alphabet_i--;
  }

  // handle overflow/underflow
  size_t alphabet_length = strlen(alphabet);
  alphabet_i %= alphabet_length;
  if(alphabet_i < 0) {
    alphabet_i += alphabet_length;
  }

  return alphabet[alphabet_i];
}


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

    // mutate
    unsigned int mutation_i =
      random() % (LEN - 1); // LEN includes the terminating null-byte
    individuals[i][mutation_i] = mutate(individuals[i][mutation_i]);
  }
  
  return individuals;
}


unsigned int
string_distance(const char* s1, const char* s2){

  unsigned int distance=0;
  for(unsigned int i=0; s1[i] != '\0' && s2[i] != '\0'; i++) {

    int i1 = alphabet_index(s1[i]);
    int i2 = alphabet_index(s2[i]);
    distance += abs( i1-i2 % strlen(alphabet));
  }

  return distance;
}


unsigned int*
get_errors(const char* ideal, const char** individuals,
	   unsigned int population_size) {
  
  unsigned int* error_rates =
    malloc(sizeof(unsigned int) * population_size);

  for(unsigned int i=0; i<population_size; i++) {
    unsigned int distance = string_distance(individuals[i], ideal);
    error_rates[i] = distance * distance;
  }

  return error_rates;
}


// zero-indexed
unsigned int
best_i(const unsigned int* error_rates, unsigned int amount) {

  unsigned int min_i=0, min=error_rates[min_i];
  for(unsigned int i=1; i<amount; i++) {

    if(error_rates[i] < min) {
      min_i = i;
      min = error_rates[i];
    }
  }

  return min_i;
}


int
main() {

  unsigned int generation = 1;
  while(strncmp(str, goal, LEN)){

    // reproduction
    const char** individuals =
      (const char**)make_individiuals(str, INDIVIDUALS);

    // determine error_rates
    const unsigned int* error_rates =
      get_errors(goal, individuals, INDIVIDUALS);
    
    // selection
    unsigned int index_of_best = best_i(error_rates, INDIVIDUALS);
    strncpy(str, individuals[index_of_best], LEN);

    // show winner of this round
    printf("%d: \"%s\"\n", generation, str);
    generation++;
  }
}
