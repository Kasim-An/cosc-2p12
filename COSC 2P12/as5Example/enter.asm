; this adds digits from the keyboard until 0 is entered

         .orig    x3000
         and      r6,r6,#0           ; initialize sum
         ld       r5,negch0          ; set char to int constant
loop
         lea      r0,prompt
         puts
         getc
         out
         add      r0,r0,r5           ; convert to integer
         brz      finish             ; check for zero to end
         add      r6,r6,r0           ; no zero so add
         ld       r0,nl
         out
         br       loop               ; and repeat
finish  
         st       r6,sum             ; place sum in memory
         lea      r0,msg             ; display
         puts                        ; program finished msg
         halt

msg      .stringz "\n\nProgram finished."
prompt   .stringz "Enter digit:"
negch0   .fill    xffd0
nl       .fill    x000a
sum      .blkw    1
         .end

