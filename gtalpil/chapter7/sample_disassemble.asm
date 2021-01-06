
sample.exe:     file format elf32-i386


Disassembly of section .text:

08049000 <_start>:
 8049000:	51                   	push   ecx
 8049001:	b9 00 a0 04 08       	mov    ecx,0x804a000
 8049006:	e8 dc 00 00 00       	call   80490e7 <proc_PutStr>
 804900b:	59                   	pop    ecx
 804900c:	56                   	push   esi
 804900d:	57                   	push   edi
 804900e:	bf 54 a1 04 08       	mov    edi,0x804a154
 8049013:	be 10 00 00 00       	mov    esi,0x10
 8049018:	e8 e8 00 00 00       	call   8049105 <proc_GetStr>
 804901d:	5f                   	pop    edi
 804901e:	5e                   	pop    esi

0804901f <ask_count>:
 804901f:	51                   	push   ecx
 8049020:	b9 19 a0 04 08       	mov    ecx,0x804a019
 8049025:	e8 bd 00 00 00       	call   80490e7 <proc_PutStr>
 804902a:	59                   	pop    ecx
 804902b:	66 50                	push   ax
 804902d:	e8 8f 01 00 00       	call   80491c1 <proc_GetInt>
 8049032:	66 89 c1             	mov    cx,ax
 8049035:	66 58                	pop    ax
 8049037:	51                   	push   ecx
 8049038:	b9 44 a0 04 08       	mov    ecx,0x804a044
 804903d:	e8 a5 00 00 00       	call   80490e7 <proc_PutStr>
 8049042:	59                   	pop    ecx
 8049043:	66 50                	push   ax
 8049045:	66 89 c8             	mov    ax,cx
 8049048:	e8 1e 01 00 00       	call   804916b <proc_PutInt>
 804904d:	66 58                	pop    ax
 804904f:	51                   	push   ecx
 8049050:	b9 5c a0 04 08       	mov    ecx,0x804a05c
 8049055:	e8 8d 00 00 00       	call   80490e7 <proc_PutStr>
 804905a:	59                   	pop    ecx
 804905b:	66 56                	push   si
 804905d:	66 31 f6             	xor    si,si
 8049060:	66 50                	push   ax
 8049062:	e8 d2 00 00 00       	call   8049139 <proc_GetCh>
 8049067:	a2 64 a1 04 08       	mov    ds:0x804a164,al
 804906c:	66 58                	pop    ax
 804906e:	66 5e                	pop    si
 8049070:	80 3d 64 a1 04 08 79 	cmp    BYTE PTR ds:0x804a164,0x79
 8049077:	75 a6                	jne    804901f <ask_count>

08049079 <display_msg>:
 8049079:	51                   	push   ecx
 804907a:	b9 6b a0 04 08       	mov    ecx,0x804a06b
 804907f:	e8 63 00 00 00       	call   80490e7 <proc_PutStr>
 8049084:	59                   	pop    ecx
 8049085:	51                   	push   ecx
 8049086:	b9 54 a1 04 08       	mov    ecx,0x804a154
 804908b:	e8 57 00 00 00       	call   80490e7 <proc_PutStr>
 8049090:	59                   	pop    ecx
 8049091:	e8 1a 00 00 00       	call   80490b0 <proc_nwln>
 8049096:	e2 e1                	loop   8049079 <display_msg>
 8049098:	b8 01 00 00 00       	mov    eax,0x1
 804909d:	31 db                	xor    ebx,ebx
 804909f:	cd 80                	int    0x80
 80490a1:	66 90                	xchg   ax,ax
 80490a3:	66 90                	xchg   ax,ax
 80490a5:	66 90                	xchg   ax,ax
 80490a7:	66 90                	xchg   ax,ax
 80490a9:	66 90                	xchg   ax,ax
 80490ab:	66 90                	xchg   ax,ax
 80490ad:	66 90                	xchg   ax,ax
 80490af:	90                   	nop

080490b0 <proc_nwln>:
 80490b0:	60                   	pusha  
 80490b1:	b8 04 00 00 00       	mov    eax,0x4
 80490b6:	bb 01 00 00 00       	mov    ebx,0x1
 80490bb:	b9 98 a0 04 08       	mov    ecx,0x804a098
 80490c0:	ba 01 00 00 00       	mov    edx,0x1
 80490c5:	cd 80                	int    0x80
 80490c7:	61                   	popa   
 80490c8:	c3                   	ret    

080490c9 <proc_PutCh>:
 80490c9:	60                   	pusha  
 80490ca:	a2 68 a1 04 08       	mov    ds:0x804a168,al
 80490cf:	b8 04 00 00 00       	mov    eax,0x4
 80490d4:	bb 01 00 00 00       	mov    ebx,0x1
 80490d9:	b9 68 a1 04 08       	mov    ecx,0x804a168
 80490de:	ba 01 00 00 00       	mov    edx,0x1
 80490e3:	cd 80                	int    0x80
 80490e5:	61                   	popa   
 80490e6:	c3                   	ret    

080490e7 <proc_PutStr>:
 80490e7:	60                   	pusha  
 80490e8:	9c                   	pushf  
 80490e9:	bb 01 00 00 00       	mov    ebx,0x1
 80490ee:	ba 01 00 00 00       	mov    edx,0x1

080490f3 <proc_PutStr.rpt_putstr>:
 80490f3:	b8 04 00 00 00       	mov    eax,0x4
 80490f8:	80 39 00             	cmp    BYTE PTR [ecx],0x0
 80490fb:	74 05                	je     8049102 <proc_PutStr.skip_putstr>
 80490fd:	cd 80                	int    0x80
 80490ff:	41                   	inc    ecx
 8049100:	eb f1                	jmp    80490f3 <proc_PutStr.rpt_putstr>

08049102 <proc_PutStr.skip_putstr>:
 8049102:	9d                   	popf   
 8049103:	61                   	popa   
 8049104:	c3                   	ret    

08049105 <proc_GetStr>:
 8049105:	60                   	pusha  
 8049106:	9c                   	pushf  
 8049107:	b8 03 00 00 00       	mov    eax,0x3
 804910c:	bb 00 00 00 00       	mov    ebx,0x0
 8049111:	b9 69 a1 04 08       	mov    ecx,0x804a169
 8049116:	ba 00 01 00 00       	mov    edx,0x100
 804911b:	cd 80                	int    0x80
 804911d:	89 f1                	mov    ecx,esi
 804911f:	49                   	dec    ecx
 8049120:	89 fb                	mov    ebx,edi
 8049122:	be 69 a1 04 08       	mov    esi,0x804a169

08049127 <proc_GetStr.loop_getstr>:
 8049127:	8a 06                	mov    al,BYTE PTR [esi]
 8049129:	3c 0a                	cmp    al,0xa
 804912b:	74 06                	je     8049133 <proc_GetStr.done_getstr>
 804912d:	88 03                	mov    BYTE PTR [ebx],al
 804912f:	43                   	inc    ebx
 8049130:	46                   	inc    esi
 8049131:	e2 f4                	loop   8049127 <proc_GetStr.loop_getstr>

08049133 <proc_GetStr.done_getstr>:
 8049133:	c6 03 00             	mov    BYTE PTR [ebx],0x0
 8049136:	9d                   	popf   
 8049137:	61                   	popa   
 8049138:	c3                   	ret    

08049139 <proc_GetCh>:
 8049139:	9c                   	pushf  
 804913a:	60                   	pusha  
 804913b:	b8 03 00 00 00       	mov    eax,0x3
 8049140:	bb 00 00 00 00       	mov    ebx,0x0
 8049145:	b9 68 a1 04 08       	mov    ecx,0x804a168
 804914a:	ba 00 01 00 00       	mov    edx,0x100
 804914f:	cd 80                	int    0x80
 8049151:	61                   	popa   
 8049152:	66 81 fe 01 00       	cmp    si,0x1
 8049157:	75 0b                	jne    8049164 <proc_GetCh.skip_getch>
 8049159:	8a 25 68 a1 04 08    	mov    ah,BYTE PTR ds:0x804a168
 804915f:	e9 05 00 00 00       	jmp    8049169 <proc_GetCh.done_getch>

08049164 <proc_GetCh.skip_getch>:
 8049164:	a0 68 a1 04 08       	mov    al,ds:0x804a168

08049169 <proc_GetCh.done_getch>:
 8049169:	9d                   	popf   
 804916a:	c3                   	ret    

0804916b <proc_PutInt>:
 804916b:	60                   	pusha  
 804916c:	be 69 a2 04 08       	mov    esi,0x804a269
 8049171:	c6 06 20             	mov    BYTE PTR [esi],0x20
 8049174:	66 3d 00 00          	cmp    ax,0x0
 8049178:	7d 06                	jge    8049180 <proc_PutInt.pi_positive>
 804917a:	c6 06 2d             	mov    BYTE PTR [esi],0x2d
 804917d:	66 f7 d8             	neg    ax

08049180 <proc_PutInt.pi_positive>:
 8049180:	66 bb 0a 00          	mov    bx,0xa
 8049184:	81 c6 06 00 00 00    	add    esi,0x6
 804918a:	c6 06 00             	mov    BYTE PTR [esi],0x0
 804918d:	4e                   	dec    esi
 804918e:	66 b9 05 00          	mov    cx,0x5

08049192 <proc_PutInt.putint_repeat>:
 8049192:	66 ba 00 00          	mov    dx,0x0
 8049196:	66 f7 f3             	div    bx
 8049199:	80 c2 30             	add    dl,0x30
 804919c:	88 16                	mov    BYTE PTR [esi],dl
 804919e:	4e                   	dec    esi
 804919f:	66 49                	dec    cx
 80491a1:	66 3d 00 00          	cmp    ax,0x0
 80491a5:	75 eb                	jne    8049192 <proc_PutInt.putint_repeat>
 80491a7:	67 e3 0e             	jcxz   80491b8 <proc_PutInt.pi_write_number>
 80491aa:	8a 1d 69 a2 04 08    	mov    bl,BYTE PTR ds:0x804a269
 80491b0:	88 1e                	mov    BYTE PTR [esi],bl
 80491b2:	80 fb 20             	cmp    bl,0x20
 80491b5:	75 01                	jne    80491b8 <proc_PutInt.pi_write_number>
 80491b7:	46                   	inc    esi

080491b8 <proc_PutInt.pi_write_number>:
 80491b8:	89 f1                	mov    ecx,esi
 80491ba:	e8 28 ff ff ff       	call   80490e7 <proc_PutStr>
 80491bf:	61                   	popa   
 80491c0:	c3                   	ret    

080491c1 <proc_GetInt>:
 80491c1:	53                   	push   ebx
 80491c2:	51                   	push   ecx
 80491c3:	52                   	push   edx
 80491c4:	56                   	push   esi
 80491c5:	57                   	push   edi
 80491c6:	9c                   	pushf  

080491c7 <proc_GetInt.read_input>:
 80491c7:	be 00 01 00 00       	mov    esi,0x100
 80491cc:	bf 69 a2 04 08       	mov    edi,0x804a269
 80491d1:	e8 2f ff ff ff       	call   8049105 <proc_GetStr>
 80491d6:	be 69 a2 04 08       	mov    esi,0x804a269
 80491db:	4e                   	dec    esi

080491dc <proc_GetInt.skip_blanks>:
 80491dc:	46                   	inc    esi
 80491dd:	80 3e 20             	cmp    BYTE PTR [esi],0x20
 80491e0:	74 fa                	je     80491dc <proc_GetInt.skip_blanks>
 80491e2:	89 f7                	mov    edi,esi

080491e4 <proc_GetInt.non_blanks>:
 80491e4:	b9 07 00 00 00       	mov    ecx,0x7
 80491e9:	8a 06                	mov    al,BYTE PTR [esi]
 80491eb:	3c 2b                	cmp    al,0x2b
 80491ed:	74 0c                	je     80491fb <proc_GetInt.valid_char>
 80491ef:	3c 2d                	cmp    al,0x2d
 80491f1:	74 08                	je     80491fb <proc_GetInt.valid_char>

080491f3 <proc_GetInt.test_next_char>:
 80491f3:	3c 30                	cmp    al,0x30
 80491f5:	72 29                	jb     8049220 <proc_GetInt.invalid_char>
 80491f7:	3c 39                	cmp    al,0x39
 80491f9:	77 25                	ja     8049220 <proc_GetInt.invalid_char>

080491fb <proc_GetInt.valid_char>:
 80491fb:	46                   	inc    esi
 80491fc:	49                   	dec    ecx
 80491fd:	67 e3 04             	jcxz   8049204 <proc_GetInt.out_of_range>
 8049200:	8a 06                	mov    al,BYTE PTR [esi]
 8049202:	eb ef                	jmp    80491f3 <proc_GetInt.test_next_char>

08049204 <proc_GetInt.out_of_range>:
 8049204:	51                   	push   ecx
 8049205:	b9 99 a0 04 08       	mov    ecx,0x804a099
 804920a:	e8 d8 fe ff ff       	call   80490e7 <proc_PutStr>
 804920f:	59                   	pop    ecx
 8049210:	eb b5                	jmp    80491c7 <proc_GetInt.read_input>

08049212 <proc_GetInt.no_input>:
 8049212:	51                   	push   ecx
 8049213:	b9 da a0 04 08       	mov    ecx,0x804a0da
 8049218:	e8 ca fe ff ff       	call   80490e7 <proc_PutStr>
 804921d:	59                   	pop    ecx
 804921e:	eb a7                	jmp    80491c7 <proc_GetInt.read_input>

08049220 <proc_GetInt.invalid_char>:
 8049220:	c6 06 00             	mov    BYTE PTR [esi],0x0
 8049223:	81 f9 07 00 00 00    	cmp    ecx,0x7
 8049229:	74 e7                	je     8049212 <proc_GetInt.no_input>
 804922b:	89 fe                	mov    esi,edi
 804922d:	31 c0                	xor    eax,eax
 804922f:	31 c9                	xor    ecx,ecx
 8049231:	66 bb 0a 00          	mov    bx,0xa
 8049235:	8a 0e                	mov    cl,BYTE PTR [esi]
 8049237:	80 f9 2d             	cmp    cl,0x2d
 804923a:	74 05                	je     8049241 <proc_GetInt.incSI>
 804923c:	80 f9 2b             	cmp    cl,0x2b
 804923f:	75 01                	jne    8049242 <proc_GetInt.convert_loop>

08049241 <proc_GetInt.incSI>:
 8049241:	46                   	inc    esi

08049242 <proc_GetInt.convert_loop>:
 8049242:	8a 0e                	mov    cl,BYTE PTR [esi]
 8049244:	80 f9 00             	cmp    cl,0x0
 8049247:	74 16                	je     804925f <proc_GetInt.conv_done>
 8049249:	80 e9 30             	sub    cl,0x30
 804924c:	66 f7 e3             	mul    bx
 804924f:	72 b3                	jb     8049204 <proc_GetInt.out_of_range>
 8049251:	66 01 c8             	add    ax,cx
 8049254:	72 ae                	jb     8049204 <proc_GetInt.out_of_range>
 8049256:	66 3d 00 80          	cmp    ax,0x8000
 804925a:	77 a8                	ja     8049204 <proc_GetInt.out_of_range>
 804925c:	46                   	inc    esi
 804925d:	eb e3                	jmp    8049242 <proc_GetInt.convert_loop>

0804925f <proc_GetInt.conv_done>:
 804925f:	89 fe                	mov    esi,edi
 8049261:	8a 0e                	mov    cl,BYTE PTR [esi]
 8049263:	66 81 fa 00 00       	cmp    dx,0x0
 8049268:	75 9a                	jne    8049204 <proc_GetInt.out_of_range>
 804926a:	66 3d 00 80          	cmp    ax,0x8000
 804926e:	72 05                	jb     8049275 <proc_GetInt.number_OK>
 8049270:	80 f9 2d             	cmp    cl,0x2d
 8049273:	75 8f                	jne    8049204 <proc_GetInt.out_of_range>

08049275 <proc_GetInt.number_OK>:
 8049275:	80 f9 2d             	cmp    cl,0x2d
 8049278:	75 03                	jne    804927d <proc_GetInt.num_done>
 804927a:	66 f7 d8             	neg    ax

0804927d <proc_GetInt.num_done>:
 804927d:	9d                   	popf   
 804927e:	5f                   	pop    edi
 804927f:	5e                   	pop    esi
 8049280:	5a                   	pop    edx
 8049281:	59                   	pop    ecx
 8049282:	5b                   	pop    ebx
 8049283:	c3                   	ret    

08049284 <proc_PutLInt>:
 8049284:	60                   	pusha  
 8049285:	be 69 a2 04 08       	mov    esi,0x804a269
 804928a:	c6 06 20             	mov    BYTE PTR [esi],0x20
 804928d:	3d 00 00 00 00       	cmp    eax,0x0
 8049292:	7d 05                	jge    8049299 <proc_PutLInt.pli_positive>
 8049294:	c6 06 2d             	mov    BYTE PTR [esi],0x2d
 8049297:	f7 d8                	neg    eax

08049299 <proc_PutLInt.pli_positive>:
 8049299:	bb 0a 00 00 00       	mov    ebx,0xa
 804929e:	81 c6 0b 00 00 00    	add    esi,0xb
 80492a4:	c6 06 00             	mov    BYTE PTR [esi],0x0
 80492a7:	4e                   	dec    esi
 80492a8:	b9 0a 00 00 00       	mov    ecx,0xa

080492ad <proc_PutLInt.putLint_repeat>:
 80492ad:	ba 00 00 00 00       	mov    edx,0x0
 80492b2:	f7 f3                	div    ebx
 80492b4:	80 c2 30             	add    dl,0x30
 80492b7:	88 16                	mov    BYTE PTR [esi],dl
 80492b9:	4e                   	dec    esi
 80492ba:	49                   	dec    ecx
 80492bb:	3d 00 00 00 00       	cmp    eax,0x0
 80492c0:	75 eb                	jne    80492ad <proc_PutLInt.putLint_repeat>
 80492c2:	67 e3 0e             	jcxz   80492d3 <proc_PutLInt.pli_write_number>
 80492c5:	8a 1d 69 a2 04 08    	mov    bl,BYTE PTR ds:0x804a269
 80492cb:	88 1e                	mov    BYTE PTR [esi],bl
 80492cd:	80 fb 20             	cmp    bl,0x20
 80492d0:	75 01                	jne    80492d3 <proc_PutLInt.pli_write_number>
 80492d2:	46                   	inc    esi

080492d3 <proc_PutLInt.pli_write_number>:
 80492d3:	89 f1                	mov    ecx,esi
 80492d5:	e8 0d fe ff ff       	call   80490e7 <proc_PutStr>
 80492da:	61                   	popa   
 80492db:	c3                   	ret    

080492dc <proc_GetLInt>:
 80492dc:	53                   	push   ebx
 80492dd:	51                   	push   ecx
 80492de:	52                   	push   edx
 80492df:	56                   	push   esi
 80492e0:	57                   	push   edi
 80492e1:	9c                   	pushf  

080492e2 <proc_GetLInt.read_L_input>:
 80492e2:	be 00 01 00 00       	mov    esi,0x100
 80492e7:	bf 69 a2 04 08       	mov    edi,0x804a269
 80492ec:	e8 14 fe ff ff       	call   8049105 <proc_GetStr>
 80492f1:	be 69 a2 04 08       	mov    esi,0x804a269
 80492f6:	4e                   	dec    esi

080492f7 <proc_GetLInt.skip_L_blanks>:
 80492f7:	46                   	inc    esi
 80492f8:	80 3e 20             	cmp    BYTE PTR [esi],0x20
 80492fb:	74 fa                	je     80492f7 <proc_GetLInt.skip_L_blanks>
 80492fd:	89 f7                	mov    edi,esi

080492ff <proc_GetLInt.non_L_blanks>:
 80492ff:	b9 0c 00 00 00       	mov    ecx,0xc
 8049304:	8a 06                	mov    al,BYTE PTR [esi]
 8049306:	3c 2b                	cmp    al,0x2b
 8049308:	74 0c                	je     8049316 <proc_GetLInt.valid_L_char>
 804930a:	3c 2d                	cmp    al,0x2d
 804930c:	74 08                	je     8049316 <proc_GetLInt.valid_L_char>

0804930e <proc_GetLInt.test_next_L_char>:
 804930e:	3c 30                	cmp    al,0x30
 8049310:	72 2b                	jb     804933d <proc_GetLInt.invalid_L_char>
 8049312:	3c 39                	cmp    al,0x39
 8049314:	77 27                	ja     804933d <proc_GetLInt.invalid_L_char>

08049316 <proc_GetLInt.valid_L_char>:
 8049316:	66 46                	inc    si
 8049318:	66 49                	dec    cx
 804931a:	67 e3 04             	jcxz   8049321 <proc_GetLInt.out_of_L_range>
 804931d:	8a 06                	mov    al,BYTE PTR [esi]
 804931f:	eb ed                	jmp    804930e <proc_GetLInt.test_next_L_char>

08049321 <proc_GetLInt.out_of_L_range>:
 8049321:	51                   	push   ecx
 8049322:	b9 05 a1 04 08       	mov    ecx,0x804a105
 8049327:	e8 bb fd ff ff       	call   80490e7 <proc_PutStr>
 804932c:	59                   	pop    ecx
 804932d:	eb b3                	jmp    80492e2 <proc_GetLInt.read_L_input>

0804932f <proc_GetLInt.no_L_input>:
 804932f:	51                   	push   ecx
 8049330:	b9 da a0 04 08       	mov    ecx,0x804a0da
 8049335:	e8 ad fd ff ff       	call   80490e7 <proc_PutStr>
 804933a:	59                   	pop    ecx
 804933b:	eb a5                	jmp    80492e2 <proc_GetLInt.read_L_input>

0804933d <proc_GetLInt.invalid_L_char>:
 804933d:	c6 06 00             	mov    BYTE PTR [esi],0x0
 8049340:	81 f9 0c 00 00 00    	cmp    ecx,0xc
 8049346:	74 e7                	je     804932f <proc_GetLInt.no_L_input>
 8049348:	89 fe                	mov    esi,edi
 804934a:	31 c0                	xor    eax,eax
 804934c:	31 c9                	xor    ecx,ecx
 804934e:	bb 0a 00 00 00       	mov    ebx,0xa
 8049353:	8a 0e                	mov    cl,BYTE PTR [esi]
 8049355:	80 f9 2d             	cmp    cl,0x2d
 8049358:	74 05                	je     804935f <proc_GetLInt.L_incSI>
 804935a:	80 f9 2b             	cmp    cl,0x2b
 804935d:	75 01                	jne    8049360 <proc_GetLInt.L_convert_loop>

0804935f <proc_GetLInt.L_incSI>:
 804935f:	46                   	inc    esi

08049360 <proc_GetLInt.L_convert_loop>:
 8049360:	8a 0e                	mov    cl,BYTE PTR [esi]
 8049362:	80 f9 00             	cmp    cl,0x0
 8049365:	74 15                	je     804937c <proc_GetLInt.L_conv_done>
 8049367:	80 e9 30             	sub    cl,0x30
 804936a:	f7 e3                	mul    ebx
 804936c:	72 b3                	jb     8049321 <proc_GetLInt.out_of_L_range>
 804936e:	01 c8                	add    eax,ecx
 8049370:	72 af                	jb     8049321 <proc_GetLInt.out_of_L_range>
 8049372:	3d 00 00 00 80       	cmp    eax,0x80000000
 8049377:	77 a8                	ja     8049321 <proc_GetLInt.out_of_L_range>
 8049379:	46                   	inc    esi
 804937a:	eb e4                	jmp    8049360 <proc_GetLInt.L_convert_loop>

0804937c <proc_GetLInt.L_conv_done>:
 804937c:	89 fe                	mov    esi,edi
 804937e:	8a 0e                	mov    cl,BYTE PTR [esi]
 8049380:	81 fa 00 00 00 00    	cmp    edx,0x0
 8049386:	75 99                	jne    8049321 <proc_GetLInt.out_of_L_range>
 8049388:	3d 00 00 00 80       	cmp    eax,0x80000000
 804938d:	72 05                	jb     8049394 <proc_GetLInt.L_number_OK>
 804938f:	80 f9 2d             	cmp    cl,0x2d
 8049392:	75 8d                	jne    8049321 <proc_GetLInt.out_of_L_range>

08049394 <proc_GetLInt.L_number_OK>:
 8049394:	80 f9 2d             	cmp    cl,0x2d
 8049397:	75 02                	jne    804939b <proc_GetLInt.L_num_done>
 8049399:	f7 d8                	neg    eax

0804939b <proc_GetLInt.L_num_done>:
 804939b:	9d                   	popf   
 804939c:	5f                   	pop    edi
 804939d:	5e                   	pop    esi
 804939e:	5a                   	pop    edx
 804939f:	59                   	pop    ecx
 80493a0:	5b                   	pop    ebx
 80493a1:	c3                   	ret    

Disassembly of section .data:

0804a000 <name_msg>:
 804a000:	50                   	push   eax
 804a001:	6c                   	ins    BYTE PTR es:[edi],dx
 804a002:	65 61                	gs popa 
 804a004:	73 65                	jae    804a06b <welcome_msg>
 804a006:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 804a009:	74 65                	je     804a070 <welcome_msg+0x5>
 804a00b:	72 20                	jb     804a02d <query_msg+0x14>
 804a00d:	79 6f                	jns    804a07e <welcome_msg+0x13>
 804a00f:	75 72                	jne    804a083 <welcome_msg+0x18>
 804a011:	20 6e 61             	and    BYTE PTR [esi+0x61],ch
 804a014:	6d                   	ins    DWORD PTR es:[edi],dx
 804a015:	65 3a 20             	cmp    ah,BYTE PTR gs:[eax]
	...

0804a019 <query_msg>:
 804a019:	48                   	dec    eax
 804a01a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 804a01b:	77 20                	ja     804a03d <query_msg+0x24>
 804a01d:	6d                   	ins    DWORD PTR es:[edi],dx
 804a01e:	61                   	popa   
 804a01f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 804a020:	79 20                	jns    804a042 <query_msg+0x29>
 804a022:	74 69                	je     804a08d <welcome_msg+0x22>
 804a024:	6d                   	ins    DWORD PTR es:[edi],dx
 804a025:	65 73 20             	gs jae 804a048 <confirm_msg1+0x4>
 804a028:	74 6f                	je     804a099 <?range_msg>
 804a02a:	20 72 65             	and    BYTE PTR [edx+0x65],dh
 804a02d:	70 65                	jo     804a094 <welcome_msg+0x29>
 804a02f:	61                   	popa   
 804a030:	74 20                	je     804a052 <confirm_msg1+0xe>
 804a032:	77 65                	ja     804a099 <?range_msg>
 804a034:	6c                   	ins    BYTE PTR es:[edi],dx
 804a035:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 804a038:	65 20 6d 65          	and    BYTE PTR gs:[ebp+0x65],ch
 804a03c:	73 73                	jae    804a0b1 <?range_msg+0x18>
 804a03e:	61                   	popa   
 804a03f:	67 65 3f             	addr16 gs aas 
 804a042:	20 00                	and    BYTE PTR [eax],al

0804a044 <confirm_msg1>:
 804a044:	52                   	push   edx
 804a045:	65 70 65             	gs jo  804a0ad <?range_msg+0x14>
 804a048:	61                   	popa   
 804a049:	74 20                	je     804a06b <welcome_msg>
 804a04b:	77 65                	ja     804a0b2 <?range_msg+0x19>
 804a04d:	6c                   	ins    BYTE PTR es:[edi],dx
 804a04e:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 804a051:	65 20 6d 65          	and    BYTE PTR gs:[ebp+0x65],ch
 804a055:	73 73                	jae    804a0ca <?range_msg+0x31>
 804a057:	61                   	popa   
 804a058:	67 65 20 00          	and    BYTE PTR gs:[bx+si],al

0804a05c <confirm_msg2>:
 804a05c:	20 74 69 6d          	and    BYTE PTR [ecx+ebp*2+0x6d],dh
 804a060:	65 73 3f             	gs jae 804a0a2 <?range_msg+0x9>
 804a063:	20 28                	and    BYTE PTR [eax],ch
 804a065:	79 2f                	jns    804a096 <welcome_msg+0x2b>
 804a067:	6e                   	outs   dx,BYTE PTR ds:[esi]
 804a068:	29 20                	sub    DWORD PTR [eax],esp
	...

0804a06b <welcome_msg>:
 804a06b:	57                   	push   edi
 804a06c:	65 6c                	gs ins BYTE PTR es:[edi],dx
 804a06e:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 804a071:	65 20 74 6f 20       	and    BYTE PTR gs:[edi+ebp*2+0x20],dh
 804a076:	41                   	inc    ecx
 804a077:	73 73                	jae    804a0ec <?no_input_msg+0x12>
 804a079:	65 6d                	gs ins DWORD PTR es:[edi],dx
 804a07b:	62 6c 79 20          	bound  ebp,QWORD PTR [ecx+edi*2+0x20]
 804a07f:	4c                   	dec    esp
 804a080:	61                   	popa   
 804a081:	6e                   	outs   dx,BYTE PTR ds:[esi]
 804a082:	67 75 61             	addr16 jne 804a0e6 <?no_input_msg+0xc>
 804a085:	67 65 20 50 72       	and    BYTE PTR gs:[bx+si+0x72],dl
 804a08a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 804a08b:	67 72 61             	addr16 jb 804a0ef <?no_input_msg+0x15>
 804a08e:	6d                   	ins    DWORD PTR es:[edi],dx
 804a08f:	6d                   	ins    DWORD PTR es:[edi],dx
 804a090:	69 6e 67 20 00 00 00 	imul   ebp,DWORD PTR [esi+0x67],0x20
	...

0804a098 <new_line>:
 804a098:	0a         	or     cl,BYTE PTR ds:0x6d754e0a

0804a099 <?range_msg>:
 804a099:	0d 0a 4e 75 6d       	or     eax,0x6d754e0a
 804a09e:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 804a0a1:	20 6f 75             	and    BYTE PTR [edi+0x75],ch
 804a0a4:	74 20                	je     804a0c6 <?range_msg+0x2d>
 804a0a6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 804a0a7:	66 20 72 61          	data16 and BYTE PTR [edx+0x61],dh
 804a0ab:	6e                   	outs   dx,BYTE PTR ds:[esi]
 804a0ac:	67 65 20 28          	and    BYTE PTR gs:[bx+si],ch
 804a0b0:	2d 33 32 2c 37       	sub    eax,0x372c3233
 804a0b5:	36 38 20             	cmp    BYTE PTR ss:[eax],ah
 804a0b8:	74 6f                	je     804a129 <?long_range_msg+0x24>
 804a0ba:	20 2b                	and    BYTE PTR [ebx],ch
 804a0bc:	33 32                	xor    esi,DWORD PTR [edx]
 804a0be:	2e 37                	cs aaa 
 804a0c0:	36 37                	ss aaa 
 804a0c2:	29 2e                	sub    DWORD PTR [esi],ebp
 804a0c4:	0d 0a 50 6c 65       	or     eax,0x656c500a
 804a0c9:	61                   	popa   
 804a0ca:	73 65                	jae    804a131 <?long_range_msg+0x2c>
 804a0cc:	20 74 72 79          	and    BYTE PTR [edx+esi*2+0x79],dh
 804a0d0:	20 61 67             	and    BYTE PTR [ecx+0x67],ah
 804a0d3:	61                   	popa   
 804a0d4:	69 6e 3a 09 20 00  	imul   ebp,DWORD PTR [esi+0x3a],0xd002009

0804a0da <?no_input_msg>:
 804a0da:	0d 0a 4e 6f 20       	or     eax,0x206f4e0a
 804a0df:	6e                   	outs   dx,BYTE PTR ds:[esi]
 804a0e0:	75 6d                	jne    804a14f <?long_range_msg+0x4a>
 804a0e2:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 804a0e5:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 804a0e8:	74 65                	je     804a14f <?long_range_msg+0x4a>
 804a0ea:	72 65                	jb     804a151 <?long_range_msg+0x4c>
 804a0ec:	64 2e 20 0d 0a 50 6c 	fs and BYTE PTR cs:0x656c500a,cl
 804a0f3:	65 
 804a0f4:	61                   	popa   
 804a0f5:	73 65                	jae    804a15c <user_name+0x8>
 804a0f7:	20 74 72 79          	and    BYTE PTR [edx+esi*2+0x79],dh
 804a0fb:	20 61 67             	and    BYTE PTR [ecx+0x67],ah
 804a0fe:	61                   	popa   
 804a0ff:	69 6e 3a 09 20 00  	imul   ebp,DWORD PTR [esi+0x3a],0xd002009

0804a105 <?long_range_msg>:
 804a105:	0d 0a 4e 75 6d       	or     eax,0x6d754e0a
 804a10a:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 804a10d:	20 6f 75             	and    BYTE PTR [edi+0x75],ch
 804a110:	74 20                	je     804a132 <?long_range_msg+0x2d>
 804a112:	6f                   	outs   dx,DWORD PTR ds:[esi]
 804a113:	66 20 72 61          	data16 and BYTE PTR [edx+0x61],dh
 804a117:	6e                   	outs   dx,BYTE PTR ds:[esi]
 804a118:	67 65 20 28          	and    BYTE PTR gs:[bx+si],ch
 804a11c:	2d 32 2c 31 34       	sub    eax,0x34312c32
 804a121:	37                   	aaa    
 804a122:	2c 34                	sub    al,0x34
 804a124:	38 33                	cmp    BYTE PTR [ebx],dh
 804a126:	2c 36                	sub    al,0x36
 804a128:	34 38                	xor    al,0x38
 804a12a:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
 804a12e:	2b 32                	sub    esi,DWORD PTR [edx]
 804a130:	2c 31                	sub    al,0x31
 804a132:	34 37                	xor    al,0x37
 804a134:	2c 34                	sub    al,0x34
 804a136:	38 33                	cmp    BYTE PTR [ebx],dh
 804a138:	2c 36                	sub    al,0x36
 804a13a:	34 37                	xor    al,0x37
 804a13c:	29 2e                	sub    DWORD PTR [esi],ebp
 804a13e:	0d 0a 50 6c 65       	or     eax,0x656c500a
 804a143:	61                   	popa   
 804a144:	73 65                	jae    804a1ab <temp_str+0x42>
 804a146:	20 74 72 79          	and    BYTE PTR [edx+esi*2+0x79],dh
 804a14a:	20 61 67             	and    BYTE PTR [ecx+0x67],ah
 804a14d:	61                   	popa   
 804a14e:	69                   	.byte 0x69
 804a14f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 804a150:	3a 20                	cmp    ah,BYTE PTR [eax]
	...

Disassembly of section .bss:

0804a154 <user_name>:
	...

0804a164 <response>:
 804a164:	00 00                	add    BYTE PTR [eax],al
	...

0804a168 <temp_char>:
	...

0804a169 <temp_str>:
	...

0804a269 <buffer>:
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	00 54 68 65          	add    BYTE PTR [eax+ebp*2+0x65],dl
   4:	20 4e 65             	and    BYTE PTR [esi+0x65],cl
   7:	74 77                	je     80 <CR+0x73>
   9:	69 64 65 20 41 73 73 	imul   esp,DWORD PTR [ebp+eiz*2+0x20],0x65737341
  10:	65 
  11:	6d                   	ins    DWORD PTR es:[edi],dx
  12:	62 6c 65 72          	bound  ebp,QWORD PTR [ebp+eiz*2+0x72]
  16:	20 30                	and    BYTE PTR [eax],dh
  18:	2e 39 38             	cmp    DWORD PTR cs:[eax],edi
  1b:	2e                   	cs
  1c:	33                   	.byte 0x33
  1d:	35                   	.byte 0x35
	...
