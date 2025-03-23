#ifndef VULN_H
#define VULN_H

// Function prototypes
void print(char* ptr, int length);
void proof();

// Global variables declarations
extern char msg1[];  // Changed from char* to char[] to match implementation
extern int len1;
extern char msg2[];  // Changed from char* to char[] to match implementation
extern int len2;
extern char msg3[];  // Changed from char* to char[] to match implementation
extern int len3;

#endif /* VULN_H */