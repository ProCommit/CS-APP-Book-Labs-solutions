000000000040100c <phase_4>:
  40100c:	48 83 ec 18          	sub    rsp,0x18
  401010:	48 8d 4c 24 0c       	lea    rcx,[rsp+0xc]
  401015:	48 8d 54 24 08       	lea    rdx,[rsp+0x8]
  40101a:	be cf 25 40 00       	mov    esi,0x4025cf
  40101f:	b8 00 00 00 00       	mov    eax,0x0
  401024:	e8 c7 fb ff ff       	call   400bf0 <__isoc99_sscanf@plt>

  401029:	83 f8 02             	cmp    eax,0x2                 ; check if have least 2 number in input
  40102c:	75 07                	jne    401035 <phase_4+0x29>   ;


  40102e:	83 7c 24 08 0e       	cmp    DWORD PTR [rsp+0x8],0xe ; first check in the first number <= 14
  401033:	76 05                	jbe    40103a <phase_4+0x2e>
  401035:	e8 00 04 00 00       	call   40143a <explode_bomb>

  40103a:	ba 0e 00 00 00       	mov    edx,0xe                  ; 
  40103f:	be 00 00 00 00       	mov    esi,0x0                  ; 
  401044:	8b 7c 24 08          	mov    edi,DWORD PTR [rsp+0x8]  ;func 4 acsapt (first input, 0,14)
  401048:	e8 81 ff ff ff       	call   400fce <func4>           ;
  40104d:	85 c0                	test   eax,eax
  40104f:	75 07                	jne    401058 <phase_4+0x4c>

  401051:	83 7c 24 0c 00       	cmp    DWORD PTR [rsp+0xc],0x0  ; check if input 2 = 0
  401056:	74 05                	je     40105d <phase_4+0x51>
  401058:	e8 dd 03 00 00       	call   40143a <explode_bomb>
  40105d:	48 83 c4 18          	add    rsp,0x18
  401061:	c3                   	ret

; mean the key is 7 0


  0000000000400fce <func4>:
  400fce:	48 83 ec 08          	sub    rsp,0x8          ;
  400fd2:	89 d0                	mov    eax,edx          ; this part is take 14 mov it to eax 
  400fd4:	29 f0                	sub    eax,esi          ; sub 14 - 0
  400fd6:	89 c1                	mov    ecx,eax          ; mov 14 to ecx
  400fd8:	c1 e9 1f             	shr    ecx,0x1f         ; 14 >> 31 mean ecx = 0
  400fdb:	01 c8                	add    eax,ecx          ; eax = 14 + 0 (becuase in eax have 14)

  400fdd:	d1 f8                	sar    eax,1            ; 14 >> 1 mean(14 / 2)
  400fdf:	8d 0c 30             	lea    ecx,[rax+rsi*1]  ; rcx = 7 + (0 * 1) = 7
  400fe2:	39 f9                	cmp    ecx,edi          ; check if first input of the usr >= 7
  400fe4:	7e 0c                	jle    400ff2 <func4+0x24> ; if the input small than 7 boom

  400fe6:	8d 51 ff             	lea    edx,[rcx-0x1]    ;
  400fe9:	e8 e0 ff ff ff       	call   400fce <func4>   ;
  400fee:	01 c0                	add    eax,eax          ;
  400ff0:	eb 15                	jmp    401007 <func4+0x39> ;
  400ff2:	b8 00 00 00 00       	mov    eax,0x0          ;

  400ff7:	39 f9                	cmp    ecx,edi          ;  check if first input of the usr >= 7
  400ff9:	7d 0c                	jge    401007 <func4+0x39> ; if the input bigger than 7 boom

  400ffb:	8d 71 01             	lea    esi,[rcx+0x1]       ;
  400ffe:	e8 cb ff ff ff       	call   400fce <func4>      ;
  401003:	8d 44 00 01          	lea    eax,[rax+rax*1+0x1] ;
  401007:	48 83 c4 08          	add    rsp,0x8             ;
  40100b:	c3                   	ret
