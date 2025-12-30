00000000004010f4 <phase_6>:
  4010f4:	41 56                	push   r14
  4010f6:	41 55                	push   r13
  4010f8:	41 54                	push   r12
  4010fa:	55                   	push   rbp
  4010fb:	53                   	push   rbx

  4010fc:	48 83 ec 50          	sub    rsp,0x50
  401100:	49 89 e5             	mov    r13,rsp        ; hold addr of input ints
  401103:	48 89 e6             	mov    rsi,rsp        ; hold addr of input ints
  401106:	e8 51 03 00 00       	call   40145c <read_six_numbers>
  
  40110b:	49 89 e6             	mov    r14,rsp      -> ?
  40110e:	41 bc 00 00 00 00    	mov    r12d,0x0     -> ?   maybe counter

  ;first loop ; the goal of this loop is check there is no nuber duplecat number and all the number between 1-6 include
  401114:	4c 89 ed             	mov    rbp,r13     ; rbp -> hold addr of input ints 

  401117:	41 8b 45 00          	mov    eax,DWORD PTR [r13+0x0] ;hold addr of first input ints  
  40111b:	83 e8 01             	sub    eax,0x1                 ; first input - 1
  40111e:	83 f8 05             	cmp    eax,0x5                 ; check input - 5
  401121:	76 05                	jbe    401128 <phase_6+0x34>   ; if input =< 5  boob
  ; becuse first sub from input range can be 1 - 6
  401123:	e8 12 03 00 00       	call   40143a <explode_bomb>    
  401128:	41 83 c4 01          	add    r12d,0x1                 ;set counter for 1
  40112c:	41 83 fc 06          	cmp    r12d,0x6                 ; cmp to 6
  401130:	74 21                	je     401153 <phase_6+0x5f>

  401132:	44 89 e3             	mov    ebx,r12d                 ; mov counter to ebx
  ;inner loop 1 ; the loop check for each number in the input if its eql to the first number if eql boom
  401135:	48 63 c3             	movsxd rax,ebx                  ; mov counter to eax
  401138:	8b 04 84             	mov    eax,DWORD PTR [rsp+rax*4]; mov input[1]
  40113b:	39 45 00             	cmp    DWORD PTR [rbp+0x0],eax  ;cmp input[0] - input[rax]
  40113e:	75 05                	jne    401145 <phase_6+0x51>
  401140:	e8 f5 02 00 00       	call   40143a <explode_bomb>
  401145:	83 c3 01             	add    ebx,0x1                   ; ebx ineer counter 
  401148:	83 fb 05             	cmp    ebx,0x5                   ; check till 5
  40114b:	7e e8                	jle    401135 <phase_6+0x41>
  ;inner loop 1

  40114d:	49 83 c5 04          	add    r13,0x4
  401151:	eb c1                	jmp    401114 <phase_6+0x20>
  ;first loop

  ; input = 1 2 3 4 5 6       after loop =  6 5 4 3 2 1 
  ;this loop run on the array till tha adrss of the last ithem,  arry[i] = 7 - arry[i]
  401153:	48 8d 74 24 18       	lea    rsi,[rsp+0x18]   ;calc the adrss of the stack above the int  arry
  401158:	4c 89 f0             	mov    rax,r14          ;rax = arry[0]
  40115b:	b9 07 00 00 00       	mov    ecx,0x7          
  401160:	89 ca                	mov    edx,ecx
  401162:	2b 10                	sub    edx,DWORD PTR [rax]
  401164:	89 10                	mov    DWORD PTR [rax],edx
  401166:	48 83 c0 04          	add    rax,0x4
  40116a:	48 39 f0             	cmp    rax,rsi
  40116d:	75 f1                	jne    401160 <phase_6+0x6c>
  ; end loop



  ; this loop cacl bease on input user node address and inter to to the stack those adress 
  ; base to the cmp the loop him  to enter only 4 node adrss
  ;large loop   
  ;rsi = 0 
  ;ecx = contin the array[rsi]
  40116f:	be 00 00 00 00       	mov    esi,0x0  ; counter for arry index, arrry[esi]
  401174:	eb 21                	jmp    401197 <phase_6+0xa3>    ; line 75


  401176:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8] ;mov node+8 to rdx
  40117a:	83 c0 01             	add    eax,0x1                 ; 
  40117d:	39 c8                	cmp    eax,ecx
  40117f:	75 f5                	jne    401176 <phase_6+0x82>
  401181:	eb 05                	jmp    401188 <phase_6+0x94>
  ;;;;;
  401183:	ba d0 32 60 00       	mov    edx,0x6032d0
  401188:	48 89 54 74 20       	mov    QWORD PTR [rsp+rsi*2+0x20],rdx
  40118d:	48 83 c6 04          	add    rsi,0x4          ;inc rsi by 4 to move the next array index
  401191:	48 83 fe 18          	cmp    rsi,0x18         ;cmp if the rsi is thr least index
  401195:	74 14                	je     4011ab <phase_6+0xb7>  ;out from the large loop
  
  401197:	8b 0c 34             	mov    ecx,DWORD PTR [rsp+rsi*1]   ;mov arry[rsi] ecx
  40119a:	83 f9 01             	cmp    ecx,0x1                     ;cmp arry[rsi] =< 1
  40119d:	7e e4                	jle    401183 <phase_6+0x8f>       ;if = 1 jmp line 71

  40119f:	b8 01 00 00 00       	mov    eax,0x1                  ;
  4011a4:	ba d0 32 60 00       	mov    edx,0x6032d0
  4011a9:	eb cb                	jmp    401176 <phase_6+0x82>
  ;;;;;

  ; prep fo loop that cmper node values
  4011ab:	48 8b 5c 24 20       	mov    rbx,QWORD PTR [rsp+0x20]   ;
  4011b0:	48 8d 44 24 28       	lea    rax,[rsp+0x28]
  4011b5:	48 8d 74 24 50       	lea    rsi,[rsp+0x50]
  4011ba:	48 89 d9             	mov    rcx,rbx

  ; this loop vary wierd its run till all the node adress on the stack but dont do somting that effect on them 
  4011bd:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  4011c0:	48 89 51 08          	mov    QWORD PTR [rcx+0x8],rdx
  4011c4:	48 83 c0 08          	add    rax,0x8
  4011c8:	48 39 f0             	cmp    rax,rsi
  4011cb:	74 05                	je     4011d2 <phase_6+0xde>

  4011cd:	48 89 d1             	mov    rcx,rdx
  4011d0:	eb eb                	jmp    4011bd <phase_6+0xc9>


  4011d2:	48 c7 42 08 00 00 00 	mov    QWORD PTR [rdx+0x8],0x0
  4011d9:	00 
  4011da:	bd 05 00 00 00       	mov    ebp,0x5
  ;base on the stack order node adrss this loop cmpr is node value > than next one
  4011df:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]   ;
  4011e3:	8b 00                	mov    eax,DWORD PTR [rax]
  4011e5:	39 03                	cmp    DWORD PTR [rbx],eax
  4011e7:	7d 05                	jge    4011ee <phase_6+0xfa>
  4011e9:	e8 4c 02 00 00       	call   40143a <explode_bomb>
  4011ee:	48 8b 5b 08          	mov    rbx,QWORD PTR [rbx+0x8]
  4011f2:	83 ed 01             	sub    ebp,0x1
  4011f5:	75 e8                	jne    4011df <phase_6+0xeb>

  4011f7:	48 83 c4 50          	add    rsp,0x50
  4011fb:	5b                   	pop    rbx
  4011fc:	5d                   	pop    rbp
  4011fd:	41 5c                	pop    r12
  4011ff:	41 5d                	pop    r13
  401201:	41 5e                	pop    r14
  401203:	c3                   	ret

  ; if we put all together first loops check that there is no duplicat number in the input and there is number bigger
  ; than 6 and samller than 1
  ; next loop and do input[i] = 7 - input[i] mean if input 1 2 3 4 5 6 after this loop input = 6 5 4 3 2 1
  ; next the loop do base on the 4 first input number enter to the stack 4 node adrss
  ; next loop cmper each node on the stcak bigger than the next node on the stack
  ; mean the key =  4 3 2 1 6 5
  