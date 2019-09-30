; this program reads a string
; it uses space for the string defined 
; by an address in r6

        .orig   x3000
        ld      r6,saddr  ; get string space address
        lea     r0,ina
        puts
        jsr     gets
        puts
        lea     r0,nl
        puts
        lea     r0,echoms
        puts
        jsr     gets
        puts
        lea     r0,nl
        puts
        lea     r0,progovr
        puts
        halt

nl      .stringz "\n"
ina     .stringz "Enter a string: "
echoms  .stringz "The string was "
progovr .stringz "Program finished.\n"
saddr   .fill    x4000

; ------------------------------------------------------
; gets - uses r6 for string space
; ------------------------------------------------------
gets
        st      r2,saveR2
        st      r6,saveR6
        st      r7,saveR7
rloop
        getc
        out
        ld      r2,eol
        add     r2,r2,r0
        brz     getexit
        str     r0,r6,0
        add     r6,r6,1
        br      rloop

getexit
        and     r0,r0,0
        str     r0,r6,0
        add     r6,r6,1
        ld      r2,saveR2
        ld      r0,saveR6  ; where string started
        ld      r7,saveR7
        ret

saveR2  .blkw   1
saveR6  .blkw   1
saveR7  .blkw   1
eol     .fill   xfff3     ; or xfff6 (cr versus nl)

        .end


