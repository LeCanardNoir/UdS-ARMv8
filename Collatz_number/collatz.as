.include "/root/SOURCES/ift209/tools/ift209.as"
.global main

main:
        // Read of n
        adr     x0, pntfmt          // message to user
        bl      printf

        adr     x0, fmtInput        // X0 <= address(fmtInput)
        adr     x1, temp            // X1 <= address(temp)
        bl      scanf               // scanf(X0, X1)

        ldr     x19, temp           // x19 <= mem[temp]

        // Calculate time flight
        mov     x21, #0             // x21 <= 0
loop:
        cmp     x19, #1             // x19 - 1
        b.eq    loopEnd             // if( x19 == 1 ) goto end
        add     x21, x21, #1        // else x21++

        // Calculate f(x19)
        tbnz    x19, #0, odd        // if( x19[0] != 0 ) goto odd
even:
        mov     x20, #2             // x20 <= 3
        udiv    x19, x19, x20       // x20 <= x20 * x19
        b       end                 // goto end

odd:
        mov     x20, #3             // x20 <= 3
        mul     x20, x20, x19       // x20 <= x20 * x19
        add     x19, x20, #1        // x19 <= x20 + 1

end:
        b       loop                // goto loop

loopEnd:
        // Output time flight
        adr     x0, msgRes          // x0 <= address(msgRes)
        mov     x1, x21             // x1 <= x21
        bl      printf              // printf(x0,x1)

        mov     x0, #0              // Succeed output
        bl      exit


.section ".bss"
                .align  8
temp:           .skip   8



.section ".rodata"
pntfmt:         .asciz      "Choose a number: "
fmtInput:       .asciz      "%lu"
msgRes:         .asciz      "Result: %lu \n"