; phase_2 read 6 numbers from the user input with scanf mean that need to have space btween each number

0000000000400efc <phase_2>:
  400efc:	55                   	push   rbp
  400efd:	53                   	push   rbx
  400efe:	48 83 ec 28          	sub    rsp,0x28
  400f02:	48 89 e6             	mov    rsi,rsp
  400f05:	e8 52 05 00 00       	call   40145c <read_six_numbers>

  400f0a:	83 3c 24 01          	cmp    DWORD PTR [rsp],0x1  ; check if the first number is 1
  400f0e:	74 20                	je     400f30 <phase_2+0x34>
  400f10:	e8 25 05 00 00       	call   40143a <explode_bomb>

  400f15:	eb 19                	jmp    400f30 <phase_2+0x34>
  400f17:	8b 43 fc             	mov    eax,DWORD PTR [rbx-0x4] 
  400f1a:	01 c0                	add    eax,eax
  400f1c:	39 03                	cmp    DWORD PTR [rbx],eax
  400f1e:	74 05                	je     400f25 <phase_2+0x29>
  400f20:	e8 15 05 00 00       	call   40143a <explode_bomb>
  400f25:	48 83 c3 04          	add    rbx,0x4
  400f29:	48 39 eb             	cmp    rbx,rbp
  400f2c:	75 e9                	jne    400f17 <phase_2+0x1b>
  400f2e:	eb 0c                	jmp    400f3c <phase_2+0x40>
  400f30:	48 8d 5c 24 04       	lea    rbx,[rsp+0x4]
  400f35:	48 8d 6c 24 18       	lea    rbp,[rsp+0x18]
  400f3a:	eb db                	jmp    400f17 <phase_2+0x1b>
  400f3c:	48 83 c4 28          	add    rsp,0x28
  400f40:	5b                   	pop    rbx
  400f41:	5d                   	pop    rbp
  400f42:	c3                   	ret

; the func after the check of the first number move to the next nummber and check is the number is the resuluts
; of number behind * 2 
; mean the key is = 1 2 4 8 18 36