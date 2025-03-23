.pos 0x1000
start:
  ld $stacktop, r5          # initialize the stack
  gpc $6, r6                # update return address 
  j main                    # gotto to main 
  halt

main:
  deca r5                   # allocate space for stack frame (return Address)
  st r6, (r5)               # store the return addres on stack
  ld $-128, r0              # r0 = -128 (32 elements)
  add r0, r5                # allocate 128 bytes of space in stack
  deca r5                   # allocate space for function parameter
  ld $str1, r0              # r0 = &str1
  st r0, (r5)               # store &str1 on stack
  gpc $6, r6                # update return address
  j print                   # gotto print 
  inca r5                   # deallocate space for function parameter
  ld $0, r0                 # r0 = 0
  mov r5, r1                # r1 = & of current stack pointer
  ld $256, r2               # r2 = 256 (64 elements)
  sys $0                    # sys $0 reads data from the file specefied (r0 = file directory(terminal Unix) r1 = buffer, r2 = size )
  mov r0, r4                # r4 =  0
  deca r5                   # allocate space for function parameter
  ld $str2, r0              # r0 = & str2
  st r0, (r5)               # placing the function parameter on stack
  gpc $6, r6                # copying the return address
  j print                   # gotto print function
  inca r5                   # deallocate space for the function parameter
  ld $1, r0                 # r0 = 1
  mov r5, r1                # r1 = & of current stack pointer
  mov r4, r2                # r2 = 0
  sys $1                    # sys $1 writes data to the file specefied (r0 = (1) file directory r1 = buffer (& of stack), r2 = size (0))
  ld $128, r0               # r0 = 128
  add r0, r5                # deallocate 128 bytes of space in stack
  ld (r5), r6               # retrieving the return address in stack onto r6
  inca r5                   # deallocate space for stack frame (return address)
  j (r6)                    # gotto where the function was initially called

print:
  ld (r5), r0               #r0 = &str*      function parameter for print &a = probably a pointer to an array
  ld 4(r0), r1              #r1 = str[1]     retrieving the first element of that array 
  ld (r0), r2               #r2 = str[0]     retrieving the element at index 0 of the array
  ld $1, r0                 #r0 = 1
  sys $1                    #system call to write data to file (r0: destination, r1: buffer r2: what size needs to be written )
  j (r6)                    #jump into the return address from where left

.pos 0x1800
proof:
  deca r5                   # allocate memory for stack frame
  ld $str3, r0              # r0 = &str3
  st r0, (r5)               # storing the &str onto the stack
  gpc $6, r6                # update the return address on r6
  j print                   # gotto print
  halt                      # halt

.pos 0x2000
str1:
  .long 30
  .long _str1
_str1:
  .long 0x57656c63
  .long 0x6f6d6521
  .long 0x20506c65
  .long 0x61736520
  .long 0x656e7465
  .long 0x72206120
  .long 0x6e616d65
  .long 0x3a0a0000

str2:
  .long 11
  .long _str2
_str2:
  .long 0x476f6f64
  .long 0x206c7563
  .long 0x6b2c2000

str3:
  .long 43
  .long _str3
_str3:
  .long 0x54686520
  .long 0x73656372
  .long 0x65742070
  .long 0x68726173
  .long 0x65206973
  .long 0x20227371
  .long 0x7565616d
  .long 0x69736820
  .long 0x6f737369
  .long 0x66726167
  .long 0x65220a00

.pos 0x4000
stack:
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
  .long 0
stacktop:
  .long 0
