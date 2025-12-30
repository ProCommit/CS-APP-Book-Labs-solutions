 ► 
0x400e32 <main+146>    call   read_line   ;main call read line to get input                
  
0x400e37 <main+151>    mov    rdi, rax    ;read line return the input in rax, mov the input to rdi to check in phase 1
0x400e3a <main+154>    call   phase_1                    


phase_1:

0x400ee0 <phase_1>       sub    rsp, 8   ; open stack fream          
0x400ee4 <phase_1+4>     mov    esi, 0x402400  ; move pointer to string to esi 
0x400ee9 <phase_1+9>     call   strings_not_equal ; cmper btween the string          
 
0x400eee <phase_1+14>    test   eax, eax    ; if the check fun return 0 they equal and pass phase 1 else the bomb explode
0x400ef0 <phase_1+16>    je     phase_1+23                 
 
0x400ef2 <phase_1+18>    call   explode_bomb               
 
0x400ef7 <phase_1+23>    add    rsp, 8
0x400efb <phase_1+27>    ret    
 
0x400efc <phase_2>       push   rbp
0x400efd <phase_2+1>     push   rbx
0x400efe <phase_2+2>     sub    rsp, 0x28

; the kay in 0x402400 = Border relations with Canada have never been better. 