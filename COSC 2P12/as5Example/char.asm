; this is the charcount program from the textbook

        .orig    x3000
        and      r2,r2,0
        lea      r3,file
        ldr      r1,r3,0
loop
        add      r4,r1,-4
        brz      enddata
        not      r1,r1
        add      r1,r1,1
        add      r1,r1,r0
        brnp     next
        add      r2,r2,1
next
        add      r3,r3,1
        ldr      r1,r3,0
        br       loop
enddata
        ld       r0,char
        add      r0,r0,r2
        out
        halt

char    .fill    x0030
x       .blkw    1
file    .stringz "abcxdefabef"
eot     .fill    x0004
	    .end
