#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include "vuln.h"

// Global string variables instead of structs
// Using char arrays to match the original behavior more closely
char msg1[] = "Welcome! Please enter a name:\n";
int len1 = 30;
char msg2[] = "Good luck, ";
int len2 = 11;
char msg3[] = "The secret phrase is \"squeamish ossifrage\"\n";
int len3 = 43;

int main() {  // Changed return type from void to int
    char *bufferSpace = malloc(256);
    if (bufferSpace == NULL) {
        // Handle allocation failure
        return 1;
    }
    
    print(msg1, len1);

    // Read user input into buffer
    // The comment about 128 bytes seems inconsistent with the code
    // which allocates and reads 256 bytes
    int size = read(0, (void*)bufferSpace, 256);
    if (size < 0) {
        // Handle read error
        free(bufferSpace);
        return 1;
    }
    
    print(msg2, len2);

    // Write user input back to stdout
    write(1, bufferSpace, size);
    
    // Free allocated memory
    free(bufferSpace);
    
    return 0;  // Added proper return value
}

void print(char* ptr, int length) {
    write(1, ptr, length);
    return;
}

// Not called by anything in the program (assuming we are targeting to run this in future for hacking)
void proof() {
    print(msg3, len3);
    return;
}