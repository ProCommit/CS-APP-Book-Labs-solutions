0000000000401062 <phase_5>:
  401062:	53                   	push   rbx
  401063:	48 83 ec 20          	sub    rsp,0x20
  401067:	48 89 fb             	mov    rbx,rdi
  40106a:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  401071:	00 00 
  401073:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  401078:	31 c0                	xor    eax,eax
  ;for this phase user need enter string without spases 
  40107a:	e8 9c 02 00 00       	call   40131b <string_length> ;
  40107f:	83 f8 06             	cmp    eax,0x6                ; check if the user inter string with 6 chars
  401082:	74 4e                	je     4010d2 <phase_5+0x70>  ; if not user bomd the boom
  401084:	e8 b1 03 00 00       	call   40143a <explode_bomb>  ;
  401089:	eb 47                	jmp    4010d2 <phase_5+0x70>    ;
;so this part was really confuse for me, basicly what it dose its take the string that the user enter and loop 
;on every index, every index calc index from some "Dictionary" a array that each index contain char
;and take the char from the "Dictionary" and enter it to arry that check the mach after the loop finish
;the point is to enter input that mach to some "code" and the input need be the indexs of that word in the Dictionary
;becase this fun use as string all the ascii allow to calc the indexs

  40108b:	0f b6 0c 03          	movzx  ecx,BYTE PTR [rbx+rax*1] ;thake thr first cahr from input
  40108f:	88 0c 24             	mov    BYTE PTR [rsp],cl        ;mov the char to rsp
  401092:	48 8b 14 24          	mov    rdx,QWORD PTR [rsp]      ;mov rsp to rdx
  401096:	83 e2 0f             	and    edx,0xf                  ;do AND on this and calc number of index
  401099:	0f b6 92 b0 24 40 00 	movzx  edx,BYTE PTR [rdx+0x4024b0]  ; 0x4024b0 this is the adress of Dictionary so its mov to
  ;edx the Dictionary[index] 
  4010a0:	88 54 04 10          	mov    BYTE PTR [rsp+rax*1+0x10],dl ;mov the char to the arry 
  4010a4:	48 83 c0 01          	add    rax,0x1                      ;inc i
  4010a8:	48 83 f8 06          	cmp    rax,0x6                      ;check if its i = 6
  4010ac:	75 dd                	jne    40108b <phase_5+0x29>


  4010ae:	c6 44 24 16 00       	mov    BYTE PTR [rsp+0x16],0x0          ;add \0 to the arry 
  4010b3:	be 5e 24 40 00       	mov    esi,0x40245e                     ;0x40245e this adrss of the word that we need to find indexs in Dictionary
  4010b8:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]                   ;calc the adss of arry 
  4010bd:	e8 76 02 00 00       	call   401338 <strings_not_equal>       ;sent the word and the owrd we calc base on Dictionary indexs
  4010c2:	85 c0                	test   eax,eax                          ;if not mach boomb
  4010c4:	74 13                	je     4010d9 <phase_5+0x77>            ;
  4010c6:	e8 6f 03 00 00       	call   40143a <explode_bomb>            ;

  4010cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]        ;
  4010d0:	eb 07                	jmp    4010d9 <phase_5+0x77>            ;
  4010d2:	b8 00 00 00 00       	mov    eax,0x0                          ;
  4010d7:	eb b2                	jmp    40108b <phase_5+0x29>            ;
  4010d9:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]         ;
  4010de:	64 48 33 04 25 28 00 	xor    rax,QWORD PTR fs:0x28            ;
  4010e5:	00 00 
  4010e7:	74 05                	je     4010ee <phase_5+0x8c>
  4010e9:	e8 42 fa ff ff       	call   400b30 <__stack_chk_fail@plt>
  4010ee:	48 83 c4 20          	add    rsp,0x20
  4010f2:	5b                   	pop    rbx
  4010f3:	c3

; the word that ew need to calc is = flyers in ascii 66 6C 79 65 72 73
; the key is = 9ON567 , to find the exsect chars in the Dictionary
