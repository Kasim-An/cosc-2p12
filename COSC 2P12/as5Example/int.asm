; This program prints an integer

          .orig     x3000
          ld        r7,nbr              ; get the integer to print
          lea       r6,buffer           ; get the address of o/p area
          add       r6,r6,7             ; compute address of end of o/p
          ld        r5,char0            ; get '0' to add to int digits
loop1:
          and       r0,r0,0             ; init quotient for each divide
loop2:
          add       r7,r7,-10           ; add -10
          brn       remdr               ; until negative
          add       r0,r0,1             ; incr to compute quotient
          br        loop2               ; repeat
remdr:
          add       r7,r7,10            ; add 10 to get remdr
          add       r7,r7,r5            ; convert to ascii
          str       r7,r6,0             ; place ascii in o/p
          add       r7,r0,0             ; move quot for next divide
          brz       printit             ; if done then print
          add       r6,r6,-1            ; move to prev o/p position
          br        loop1               ; repeat
printit:
          lea       r0,msg
          puts
          add       r0,r6,0             ; move address of 1st char 
          puts                          ; into r0 and print
          halt                          ; end execution

msg:      .stringz  "The integer is:"            
nbr:      .fill     634                 ; test number to print
buffer:   .blkw     8
null:     .fill     0                   ; null to end o/p area
char0:    .fill     x30
          .end

