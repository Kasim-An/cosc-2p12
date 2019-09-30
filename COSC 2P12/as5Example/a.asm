; This program reads an integer

        .orig   x3000
        and     r1,r1,0
        lea     r0,prompt  ; 
        puts
loop:
        getc
        out
        ld      r7,nlcomp  ; check for 
        add     r7,r7,r0   ; end of line
        brz     eol        ; 
        ld      r7,chr0    ; convert char 
        add     r7,r7,r0   ; to integer
        add     r2,r1,r1   ; 2*curr int
        add     r3,r2,r2   ; 4*currint
        add     r4,r3,r3   ; 8*curr int
        add     r4,r4,r2   ; 10*curr int
        add     r1,r4,r7   ; add digit
        br      loop
eol:
        st      r1,value
        halt

value:  .blkw   1            
prompt: .stringz "Enter #:" 
chr0:   .fill   xffd0
nlcomp  .fill   xfff3     ; or xfff6 (cr versus nl)
        .end

