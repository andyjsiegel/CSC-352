
exMymake:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <.init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fd9]        # 3fe8 <__ctype_b_loc@plt+0x2db8>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <__cxa_finalize@plt-0x11a>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 22 2f 00 00    	push   QWORD PTR [rip+0x2f22]        # 3f48 <__ctype_b_loc@plt+0x2d18>
    1026:	f2 ff 25 23 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f23]        # 3f50 <__ctype_b_loc@plt+0x2d20>
    102d:	0f 1f 00             	nop    DWORD PTR [rax]
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	push   0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	push   0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	push   0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	push   0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 06 00 00 00       	push   0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    109f:	90                   	nop
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	68 07 00 00 00       	push   0x7
    10a9:	f2 e9 71 ff ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    10af:	90                   	nop
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	68 08 00 00 00       	push   0x8
    10b9:	f2 e9 61 ff ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    10bf:	90                   	nop
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	68 09 00 00 00       	push   0x9
    10c9:	f2 e9 51 ff ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    10cf:	90                   	nop
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	68 0a 00 00 00       	push   0xa
    10d9:	f2 e9 41 ff ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    10df:	90                   	nop
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	68 0b 00 00 00       	push   0xb
    10e9:	f2 e9 31 ff ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    10ef:	90                   	nop
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	68 0c 00 00 00       	push   0xc
    10f9:	f2 e9 21 ff ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    10ff:	90                   	nop
    1100:	f3 0f 1e fa          	endbr64 
    1104:	68 0d 00 00 00       	push   0xd
    1109:	f2 e9 11 ff ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    110f:	90                   	nop
    1110:	f3 0f 1e fa          	endbr64 
    1114:	68 0e 00 00 00       	push   0xe
    1119:	f2 e9 01 ff ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    111f:	90                   	nop
    1120:	f3 0f 1e fa          	endbr64 
    1124:	68 0f 00 00 00       	push   0xf
    1129:	f2 e9 f1 fe ff ff    	bnd jmp 1020 <__cxa_finalize@plt-0x110>
    112f:	90                   	nop

Disassembly of section .plt.got:

0000000000001130 <__cxa_finalize@plt>:
    1130:	f3 0f 1e fa          	endbr64 
    1134:	f2 ff 25 bd 2e 00 00 	bnd jmp QWORD PTR [rip+0x2ebd]        # 3ff8 <__ctype_b_loc@plt+0x2dc8>
    113b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

0000000000001140 <free@plt>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	f2 ff 25 0d 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e0d]        # 3f58 <__ctype_b_loc@plt+0x2d28>
    114b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001150 <puts@plt>:
    1150:	f3 0f 1e fa          	endbr64 
    1154:	f2 ff 25 05 2e 00 00 	bnd jmp QWORD PTR [rip+0x2e05]        # 3f60 <__ctype_b_loc@plt+0x2d30>
    115b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001160 <fclose@plt>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	f2 ff 25 fd 2d 00 00 	bnd jmp QWORD PTR [rip+0x2dfd]        # 3f68 <__ctype_b_loc@plt+0x2d38>
    116b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001170 <__stack_chk_fail@plt>:
    1170:	f3 0f 1e fa          	endbr64 
    1174:	f2 ff 25 f5 2d 00 00 	bnd jmp QWORD PTR [rip+0x2df5]        # 3f70 <__ctype_b_loc@plt+0x2d40>
    117b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001180 <printf@plt>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	f2 ff 25 ed 2d 00 00 	bnd jmp QWORD PTR [rip+0x2ded]        # 3f78 <__ctype_b_loc@plt+0x2d48>
    118b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001190 <strcmp@plt>:
    1190:	f3 0f 1e fa          	endbr64 
    1194:	f2 ff 25 e5 2d 00 00 	bnd jmp QWORD PTR [rip+0x2de5]        # 3f80 <__ctype_b_loc@plt+0x2d50>
    119b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000011a0 <fprintf@plt>:
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	f2 ff 25 dd 2d 00 00 	bnd jmp QWORD PTR [rip+0x2ddd]        # 3f88 <__ctype_b_loc@plt+0x2d58>
    11ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000011b0 <malloc@plt>:
    11b0:	f3 0f 1e fa          	endbr64 
    11b4:	f2 ff 25 d5 2d 00 00 	bnd jmp QWORD PTR [rip+0x2dd5]        # 3f90 <__ctype_b_loc@plt+0x2d60>
    11bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000011c0 <__isoc99_sscanf@plt>:
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	f2 ff 25 cd 2d 00 00 	bnd jmp QWORD PTR [rip+0x2dcd]        # 3f98 <__ctype_b_loc@plt+0x2d68>
    11cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000011d0 <fopen@plt>:
    11d0:	f3 0f 1e fa          	endbr64 
    11d4:	f2 ff 25 c5 2d 00 00 	bnd jmp QWORD PTR [rip+0x2dc5]        # 3fa0 <__ctype_b_loc@plt+0x2d70>
    11db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000011e0 <perror@plt>:
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	f2 ff 25 bd 2d 00 00 	bnd jmp QWORD PTR [rip+0x2dbd]        # 3fa8 <__ctype_b_loc@plt+0x2d78>
    11eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000011f0 <__cxa_atexit@plt>:
    11f0:	f3 0f 1e fa          	endbr64 
    11f4:	f2 ff 25 b5 2d 00 00 	bnd jmp QWORD PTR [rip+0x2db5]        # 3fb0 <__ctype_b_loc@plt+0x2d80>
    11fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001200 <getline@plt>:
    1200:	f3 0f 1e fa          	endbr64 
    1204:	f2 ff 25 ad 2d 00 00 	bnd jmp QWORD PTR [rip+0x2dad]        # 3fb8 <__ctype_b_loc@plt+0x2d88>
    120b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001210 <exit@plt>:
    1210:	f3 0f 1e fa          	endbr64 
    1214:	f2 ff 25 a5 2d 00 00 	bnd jmp QWORD PTR [rip+0x2da5]        # 3fc0 <__ctype_b_loc@plt+0x2d90>
    121b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001220 <strdup@plt>:
    1220:	f3 0f 1e fa          	endbr64 
    1224:	f2 ff 25 9d 2d 00 00 	bnd jmp QWORD PTR [rip+0x2d9d]        # 3fc8 <__ctype_b_loc@plt+0x2d98>
    122b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001230 <__ctype_b_loc@plt>:
    1230:	f3 0f 1e fa          	endbr64 
    1234:	f2 ff 25 95 2d 00 00 	bnd jmp QWORD PTR [rip+0x2d95]        # 3fd0 <__ctype_b_loc@plt+0x2da0>
    123b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

0000000000001240 <.text>:
    1240:	f3 0f 1e fa          	endbr64 
    1244:	31 ed                	xor    ebp,ebp
    1246:	49 89 d1             	mov    r9,rdx
    1249:	5e                   	pop    rsi
    124a:	48 89 e2             	mov    rdx,rsp
    124d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    1251:	50                   	push   rax
    1252:	54                   	push   rsp
    1253:	4c 8d 05 46 0a 00 00 	lea    r8,[rip+0xa46]        # 1ca0 <__ctype_b_loc@plt+0xa70>
    125a:	48 8d 0d cf 09 00 00 	lea    rcx,[rip+0x9cf]        # 1c30 <__ctype_b_loc@plt+0xa00>
    1261:	48 8d 3d 56 04 00 00 	lea    rdi,[rip+0x456]        # 16be <__ctype_b_loc@plt+0x48e>
    1268:	ff 15 72 2d 00 00    	call   QWORD PTR [rip+0x2d72]        # 3fe0 <__ctype_b_loc@plt+0x2db0>
    126e:	f4                   	hlt    
    126f:	90                   	nop
    1270:	48 8d 3d 99 2d 00 00 	lea    rdi,[rip+0x2d99]        # 4010 <__ctype_b_loc@plt+0x2de0>
    1277:	48 8d 05 92 2d 00 00 	lea    rax,[rip+0x2d92]        # 4010 <__ctype_b_loc@plt+0x2de0>
    127e:	48 39 f8             	cmp    rax,rdi
    1281:	74 15                	je     1298 <__ctype_b_loc@plt+0x68>
    1283:	48 8b 05 4e 2d 00 00 	mov    rax,QWORD PTR [rip+0x2d4e]        # 3fd8 <__ctype_b_loc@plt+0x2da8>
    128a:	48 85 c0             	test   rax,rax
    128d:	74 09                	je     1298 <__ctype_b_loc@plt+0x68>
    128f:	ff e0                	jmp    rax
    1291:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1298:	c3                   	ret    
    1299:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    12a0:	48 8d 3d 69 2d 00 00 	lea    rdi,[rip+0x2d69]        # 4010 <__ctype_b_loc@plt+0x2de0>
    12a7:	48 8d 35 62 2d 00 00 	lea    rsi,[rip+0x2d62]        # 4010 <__ctype_b_loc@plt+0x2de0>
    12ae:	48 29 fe             	sub    rsi,rdi
    12b1:	48 89 f0             	mov    rax,rsi
    12b4:	48 c1 ee 3f          	shr    rsi,0x3f
    12b8:	48 c1 f8 03          	sar    rax,0x3
    12bc:	48 01 c6             	add    rsi,rax
    12bf:	48 d1 fe             	sar    rsi,1
    12c2:	74 14                	je     12d8 <__ctype_b_loc@plt+0xa8>
    12c4:	48 8b 05 25 2d 00 00 	mov    rax,QWORD PTR [rip+0x2d25]        # 3ff0 <__ctype_b_loc@plt+0x2dc0>
    12cb:	48 85 c0             	test   rax,rax
    12ce:	74 08                	je     12d8 <__ctype_b_loc@plt+0xa8>
    12d0:	ff e0                	jmp    rax
    12d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    12d8:	c3                   	ret    
    12d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    12e0:	f3 0f 1e fa          	endbr64 
    12e4:	80 3d 3d 2d 00 00 00 	cmp    BYTE PTR [rip+0x2d3d],0x0        # 4028 <stderr@@GLIBC_2.2.5+0x8>
    12eb:	75 2b                	jne    1318 <__ctype_b_loc@plt+0xe8>
    12ed:	55                   	push   rbp
    12ee:	48 83 3d 02 2d 00 00 	cmp    QWORD PTR [rip+0x2d02],0x0        # 3ff8 <__ctype_b_loc@plt+0x2dc8>
    12f5:	00 
    12f6:	48 89 e5             	mov    rbp,rsp
    12f9:	74 0c                	je     1307 <__ctype_b_loc@plt+0xd7>
    12fb:	48 8b 3d 06 2d 00 00 	mov    rdi,QWORD PTR [rip+0x2d06]        # 4008 <__ctype_b_loc@plt+0x2dd8>
    1302:	e8 29 fe ff ff       	call   1130 <__cxa_finalize@plt>
    1307:	e8 64 ff ff ff       	call   1270 <__ctype_b_loc@plt+0x40>
    130c:	c6 05 15 2d 00 00 01 	mov    BYTE PTR [rip+0x2d15],0x1        # 4028 <stderr@@GLIBC_2.2.5+0x8>
    1313:	5d                   	pop    rbp
    1314:	c3                   	ret    
    1315:	0f 1f 00             	nop    DWORD PTR [rax]
    1318:	c3                   	ret    
    1319:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1320:	f3 0f 1e fa          	endbr64 
    1324:	e9 77 ff ff ff       	jmp    12a0 <__ctype_b_loc@plt+0x70>
    1329:	f3 0f 1e fa          	endbr64 
    132d:	55                   	push   rbp
    132e:	48 89 e5             	mov    rbp,rsp
    1331:	48 83 ec 20          	sub    rsp,0x20
    1335:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    1339:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    133d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1341:	eb 05                	jmp    1348 <__ctype_b_loc@plt+0x118>
    1343:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    1348:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    134c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    134f:	84 c0                	test   al,al
    1351:	75 f0                	jne    1343 <__ctype_b_loc@plt+0x113>
    1353:	eb 07                	jmp    135c <__ctype_b_loc@plt+0x12c>
    1355:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1359:	c6 00 00             	mov    BYTE PTR [rax],0x0
    135c:	e8 cf fe ff ff       	call   1230 <__ctype_b_loc@plt>
    1361:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    1364:	48 83 6d f8 01       	sub    QWORD PTR [rbp-0x8],0x1
    1369:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    136d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    1370:	48 0f be c0          	movsx  rax,al
    1374:	48 01 c0             	add    rax,rax
    1377:	48 01 d0             	add    rax,rdx
    137a:	0f b7 00             	movzx  eax,WORD PTR [rax]
    137d:	0f b7 c0             	movzx  eax,ax
    1380:	25 00 20 00 00       	and    eax,0x2000
    1385:	85 c0                	test   eax,eax
    1387:	75 cc                	jne    1355 <__ctype_b_loc@plt+0x125>
    1389:	eb 05                	jmp    1390 <__ctype_b_loc@plt+0x160>
    138b:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
    1390:	e8 9b fe ff ff       	call   1230 <__ctype_b_loc@plt>
    1395:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    1398:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    139c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    139f:	48 0f be c0          	movsx  rax,al
    13a3:	48 01 c0             	add    rax,rax
    13a6:	48 01 d0             	add    rax,rdx
    13a9:	0f b7 00             	movzx  eax,WORD PTR [rax]
    13ac:	0f b7 c0             	movzx  eax,ax
    13af:	25 00 20 00 00       	and    eax,0x2000
    13b4:	85 c0                	test   eax,eax
    13b6:	75 d3                	jne    138b <__ctype_b_loc@plt+0x15b>
    13b8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    13bc:	c9                   	leave  
    13bd:	c3                   	ret    
    13be:	f3 0f 1e fa          	endbr64 
    13c2:	55                   	push   rbp
    13c3:	48 89 e5             	mov    rbp,rsp
    13c6:	48 83 ec 20          	sub    rsp,0x20
    13ca:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    13ce:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    13d2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    13d6:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    13dd:	00 
    13de:	eb 05                	jmp    13e5 <__ctype_b_loc@plt+0x1b5>
    13e0:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
    13e5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    13e9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    13ec:	84 c0                	test   al,al
    13ee:	74 0b                	je     13fb <__ctype_b_loc@plt+0x1cb>
    13f0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    13f4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    13f7:	3c 3a                	cmp    al,0x3a
    13f9:	75 e5                	jne    13e0 <__ctype_b_loc@plt+0x1b0>
    13fb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    13ff:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    1402:	3c 3a                	cmp    al,0x3a
    1404:	75 6a                	jne    1470 <__ctype_b_loc@plt+0x240>
    1406:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    140a:	48 8d 50 01          	lea    rdx,[rax+0x1]
    140e:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    1412:	c6 00 00             	mov    BYTE PTR [rax],0x0
    1415:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1419:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    141d:	eb 44                	jmp    1463 <__ctype_b_loc@plt+0x233>
    141f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1423:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    1426:	3c 3a                	cmp    al,0x3a
    1428:	75 34                	jne    145e <__ctype_b_loc@plt+0x22e>
    142a:	48 8b 05 ef 2b 00 00 	mov    rax,QWORD PTR [rip+0x2bef]        # 4020 <stderr@@GLIBC_2.2.5>
    1431:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    1435:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1439:	48 8d 35 c8 0b 00 00 	lea    rsi,[rip+0xbc8]        # 2008 <__ctype_b_loc@plt+0xdd8>
    1440:	48 89 c7             	mov    rdi,rax
    1443:	b8 00 00 00 00       	mov    eax,0x0
    1448:	e8 53 fd ff ff       	call   11a0 <fprintf@plt>
    144d:	c7 05 d9 2b 00 00 01 	mov    DWORD PTR [rip+0x2bd9],0x1        # 4030 <stderr@@GLIBC_2.2.5+0x10>
    1454:	00 00 00 
    1457:	b8 00 00 00 00       	mov    eax,0x0
    145c:	eb 3f                	jmp    149d <__ctype_b_loc@plt+0x26d>
    145e:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
    1463:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1467:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    146a:	84 c0                	test   al,al
    146c:	75 b1                	jne    141f <__ctype_b_loc@plt+0x1ef>
    146e:	eb 29                	jmp    1499 <__ctype_b_loc@plt+0x269>
    1470:	48 8b 05 a9 2b 00 00 	mov    rax,QWORD PTR [rip+0x2ba9]        # 4020 <stderr@@GLIBC_2.2.5>
    1477:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    147b:	48 8d 35 ad 0b 00 00 	lea    rsi,[rip+0xbad]        # 202f <__ctype_b_loc@plt+0xdff>
    1482:	48 89 c7             	mov    rdi,rax
    1485:	b8 00 00 00 00       	mov    eax,0x0
    148a:	e8 11 fd ff ff       	call   11a0 <fprintf@plt>
    148f:	c7 05 97 2b 00 00 01 	mov    DWORD PTR [rip+0x2b97],0x1        # 4030 <stderr@@GLIBC_2.2.5+0x10>
    1496:	00 00 00 
    1499:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    149d:	c9                   	leave  
    149e:	c3                   	ret    
    149f:	f3 0f 1e fa          	endbr64 
    14a3:	55                   	push   rbp
    14a4:	48 89 e5             	mov    rbp,rsp
    14a7:	48 81 ec 90 00 00 00 	sub    rsp,0x90
    14ae:	48 89 bd 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdi
    14b5:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    14bc:	00 00 
    14be:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    14c2:	31 c0                	xor    eax,eax
    14c4:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
    14cb:	00 
    14cc:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
    14d3:	00 
    14d4:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    14db:	00 
    14dc:	e9 94 01 00 00       	jmp    1675 <__ctype_b_loc@plt+0x445>
    14e1:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    14e5:	48 8d 55 ae          	lea    rdx,[rbp-0x52]
    14e9:	48 8d 35 5d 0b 00 00 	lea    rsi,[rip+0xb5d]        # 204d <__ctype_b_loc@plt+0xe1d>
    14f0:	48 89 c7             	mov    rdi,rax
    14f3:	b8 00 00 00 00       	mov    eax,0x0
    14f8:	e8 c3 fc ff ff       	call   11c0 <__isoc99_sscanf@plt>
    14fd:	85 c0                	test   eax,eax
    14ff:	7f 05                	jg     1506 <__ctype_b_loc@plt+0x2d6>
    1501:	e9 6f 01 00 00       	jmp    1675 <__ctype_b_loc@plt+0x445>
    1506:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    150a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    150d:	3c 09                	cmp    al,0x9
    150f:	75 63                	jne    1574 <__ctype_b_loc@plt+0x344>
    1511:	48 83 7d a0 00       	cmp    QWORD PTR [rbp-0x60],0x0
    1516:	75 39                	jne    1551 <__ctype_b_loc@plt+0x321>
    1518:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    151c:	48 89 c7             	mov    rdi,rax
    151f:	e8 05 fe ff ff       	call   1329 <__ctype_b_loc@plt+0xf9>
    1524:	48 89 c2             	mov    rdx,rax
    1527:	48 8b 05 f2 2a 00 00 	mov    rax,QWORD PTR [rip+0x2af2]        # 4020 <stderr@@GLIBC_2.2.5>
    152e:	48 8d 35 1c 0b 00 00 	lea    rsi,[rip+0xb1c]        # 2051 <__ctype_b_loc@plt+0xe21>
    1535:	48 89 c7             	mov    rdi,rax
    1538:	b8 00 00 00 00       	mov    eax,0x0
    153d:	e8 5e fc ff ff       	call   11a0 <fprintf@plt>
    1542:	c7 05 e4 2a 00 00 01 	mov    DWORD PTR [rip+0x2ae4],0x1        # 4030 <stderr@@GLIBC_2.2.5+0x10>
    1549:	00 00 00 
    154c:	e9 4a 01 00 00       	jmp    169b <__ctype_b_loc@plt+0x46b>
    1551:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    1555:	48 89 c7             	mov    rdi,rax
    1558:	e8 cc fd ff ff       	call   1329 <__ctype_b_loc@plt+0xf9>
    155d:	48 89 c2             	mov    rdx,rax
    1560:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    1564:	48 89 d6             	mov    rsi,rdx
    1567:	48 89 c7             	mov    rdi,rax
    156a:	e8 5b 03 00 00       	call   18ca <__ctype_b_loc@plt+0x69a>
    156f:	e9 01 01 00 00       	jmp    1675 <__ctype_b_loc@plt+0x445>
    1574:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    1578:	48 89 c7             	mov    rdi,rax
    157b:	e8 3e fe ff ff       	call   13be <__ctype_b_loc@plt+0x18e>
    1580:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    1584:	48 83 7d 98 00       	cmp    QWORD PTR [rbp-0x68],0x0
    1589:	0f 84 0b 01 00 00    	je     169a <__ctype_b_loc@plt+0x46a>
    158f:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    1593:	48 8d 4d ae          	lea    rcx,[rbp-0x52]
    1597:	48 8d 55 b0          	lea    rdx,[rbp-0x50]
    159b:	48 8d 35 cd 0a 00 00 	lea    rsi,[rip+0xacd]        # 206f <__ctype_b_loc@plt+0xe3f>
    15a2:	48 89 c7             	mov    rdi,rax
    15a5:	b8 00 00 00 00       	mov    eax,0x0
    15aa:	e8 11 fc ff ff       	call   11c0 <__isoc99_sscanf@plt>
    15af:	83 f8 01             	cmp    eax,0x1
    15b2:	74 2e                	je     15e2 <__ctype_b_loc@plt+0x3b2>
    15b4:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
    15b8:	48 8b 05 61 2a 00 00 	mov    rax,QWORD PTR [rip+0x2a61]        # 4020 <stderr@@GLIBC_2.2.5>
    15bf:	48 8d 35 b1 0a 00 00 	lea    rsi,[rip+0xab1]        # 2077 <__ctype_b_loc@plt+0xe47>
    15c6:	48 89 c7             	mov    rdi,rax
    15c9:	b8 00 00 00 00       	mov    eax,0x0
    15ce:	e8 cd fb ff ff       	call   11a0 <fprintf@plt>
    15d3:	c7 05 53 2a 00 00 01 	mov    DWORD PTR [rip+0x2a53],0x1        # 4030 <stderr@@GLIBC_2.2.5+0x10>
    15da:	00 00 00 
    15dd:	e9 b9 00 00 00       	jmp    169b <__ctype_b_loc@plt+0x46b>
    15e2:	48 8d 45 b0          	lea    rax,[rbp-0x50]
    15e6:	48 89 c7             	mov    rdi,rax
    15e9:	e8 39 05 00 00       	call   1b27 <__ctype_b_loc@plt+0x8f7>
    15ee:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
    15f2:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    15f6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
    15f9:	85 c0                	test   eax,eax
    15fb:	74 2b                	je     1628 <__ctype_b_loc@plt+0x3f8>
    15fd:	48 8b 05 1c 2a 00 00 	mov    rax,QWORD PTR [rip+0x2a1c]        # 4020 <stderr@@GLIBC_2.2.5>
    1604:	48 8d 55 b0          	lea    rdx,[rbp-0x50]
    1608:	48 8d 35 81 0a 00 00 	lea    rsi,[rip+0xa81]        # 2090 <__ctype_b_loc@plt+0xe60>
    160f:	48 89 c7             	mov    rdi,rax
    1612:	b8 00 00 00 00       	mov    eax,0x0
    1617:	e8 84 fb ff ff       	call   11a0 <fprintf@plt>
    161c:	c7 05 0a 2a 00 00 01 	mov    DWORD PTR [rip+0x2a0a],0x1        # 4030 <stderr@@GLIBC_2.2.5+0x10>
    1623:	00 00 00 
    1626:	eb 73                	jmp    169b <__ctype_b_loc@plt+0x46b>
    1628:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    162c:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1
    1633:	eb 1c                	jmp    1651 <__ctype_b_loc@plt+0x421>
    1635:	48 8d 55 b0          	lea    rdx,[rbp-0x50]
    1639:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    163d:	48 89 d6             	mov    rsi,rdx
    1640:	48 89 c7             	mov    rdi,rax
    1643:	e8 cb 01 00 00       	call   1813 <__ctype_b_loc@plt+0x5e3>
    1648:	8b 45 84             	mov    eax,DWORD PTR [rbp-0x7c]
    164b:	48 98                	cdqe   
    164d:	48 01 45 98          	add    QWORD PTR [rbp-0x68],rax
    1651:	48 8d 4d 84          	lea    rcx,[rbp-0x7c]
    1655:	48 8d 55 b0          	lea    rdx,[rbp-0x50]
    1659:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
    165d:	48 8d 35 51 0a 00 00 	lea    rsi,[rip+0xa51]        # 20b5 <__ctype_b_loc@plt+0xe85>
    1664:	48 89 c7             	mov    rdi,rax
    1667:	b8 00 00 00 00       	mov    eax,0x0
    166c:	e8 4f fb ff ff       	call   11c0 <__isoc99_sscanf@plt>
    1671:	85 c0                	test   eax,eax
    1673:	7f c0                	jg     1635 <__ctype_b_loc@plt+0x405>
    1675:	48 8b 95 78 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x88]
    167c:	48 8d 4d 90          	lea    rcx,[rbp-0x70]
    1680:	48 8d 45 88          	lea    rax,[rbp-0x78]
    1684:	48 89 ce             	mov    rsi,rcx
    1687:	48 89 c7             	mov    rdi,rax
    168a:	e8 71 fb ff ff       	call   1200 <getline@plt>
    168f:	48 85 c0             	test   rax,rax
    1692:	0f 8f 49 fe ff ff    	jg     14e1 <__ctype_b_loc@plt+0x2b1>
    1698:	eb 01                	jmp    169b <__ctype_b_loc@plt+0x46b>
    169a:	90                   	nop
    169b:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    169f:	48 89 c7             	mov    rdi,rax
    16a2:	e8 99 fa ff ff       	call   1140 <free@plt>
    16a7:	90                   	nop
    16a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    16ac:	64 48 33 04 25 28 00 	xor    rax,QWORD PTR fs:0x28
    16b3:	00 00 
    16b5:	74 05                	je     16bc <__ctype_b_loc@plt+0x48c>
    16b7:	e8 b4 fa ff ff       	call   1170 <__stack_chk_fail@plt>
    16bc:	c9                   	leave  
    16bd:	c3                   	ret    
    16be:	f3 0f 1e fa          	endbr64 
    16c2:	55                   	push   rbp
    16c3:	48 89 e5             	mov    rbp,rsp
    16c6:	48 83 ec 20          	sub    rsp,0x20
    16ca:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    16cd:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    16d1:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
    16d5:	74 2c                	je     1703 <__ctype_b_loc@plt+0x4d3>
    16d7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    16db:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    16de:	48 8b 05 3b 29 00 00 	mov    rax,QWORD PTR [rip+0x293b]        # 4020 <stderr@@GLIBC_2.2.5>
    16e5:	48 8d 35 d0 09 00 00 	lea    rsi,[rip+0x9d0]        # 20bc <__ctype_b_loc@plt+0xe8c>
    16ec:	48 89 c7             	mov    rdi,rax
    16ef:	b8 00 00 00 00       	mov    eax,0x0
    16f4:	e8 a7 fa ff ff       	call   11a0 <fprintf@plt>
    16f9:	b8 01 00 00 00       	mov    eax,0x1
    16fe:	e9 0e 01 00 00       	jmp    1811 <__ctype_b_loc@plt+0x5e1>
    1703:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1707:	48 83 c0 08          	add    rax,0x8
    170b:	48 8b 00             	mov    rax,QWORD PTR [rax]
    170e:	48 8d 35 c2 09 00 00 	lea    rsi,[rip+0x9c2]        # 20d7 <__ctype_b_loc@plt+0xea7>
    1715:	48 89 c7             	mov    rdi,rax
    1718:	e8 b3 fa ff ff       	call   11d0 <fopen@plt>
    171d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1721:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
    1726:	75 1d                	jne    1745 <__ctype_b_loc@plt+0x515>
    1728:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    172c:	48 83 c0 08          	add    rax,0x8
    1730:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1733:	48 89 c7             	mov    rdi,rax
    1736:	e8 a5 fa ff ff       	call   11e0 <perror@plt>
    173b:	b8 01 00 00 00       	mov    eax,0x1
    1740:	e9 cc 00 00 00       	jmp    1811 <__ctype_b_loc@plt+0x5e1>
    1745:	48 8d 05 fc 02 00 00 	lea    rax,[rip+0x2fc]        # 1a48 <__ctype_b_loc@plt+0x818>
    174c:	48 89 c7             	mov    rdi,rax
    174f:	e8 5c 05 00 00       	call   1cb0 <__ctype_b_loc@plt+0xa80>
    1754:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1758:	48 89 c7             	mov    rdi,rax
    175b:	e8 3f fd ff ff       	call   149f <__ctype_b_loc@plt+0x26f>
    1760:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1764:	48 89 c7             	mov    rdi,rax
    1767:	e8 f4 f9 ff ff       	call   1160 <fclose@plt>
    176c:	8b 05 be 28 00 00    	mov    eax,DWORD PTR [rip+0x28be]        # 4030 <stderr@@GLIBC_2.2.5+0x10>
    1772:	85 c0                	test   eax,eax
    1774:	0f 85 91 00 00 00    	jne    180b <__ctype_b_loc@plt+0x5db>
    177a:	48 8b 05 b7 28 00 00 	mov    rax,QWORD PTR [rip+0x28b7]        # 4038 <stderr@@GLIBC_2.2.5+0x18>
    1781:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    1785:	eb 0c                	jmp    1793 <__ctype_b_loc@plt+0x563>
    1787:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    178b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    178f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    1793:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
    1798:	74 21                	je     17bb <__ctype_b_loc@plt+0x58b>
    179a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    179e:	48 83 c0 10          	add    rax,0x10
    17a2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    17a5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    17a9:	48 8b 00             	mov    rax,QWORD PTR [rax]
    17ac:	48 89 d6             	mov    rsi,rdx
    17af:	48 89 c7             	mov    rdi,rax
    17b2:	e8 d9 f9 ff ff       	call   1190 <strcmp@plt>
    17b7:	85 c0                	test   eax,eax
    17b9:	75 cc                	jne    1787 <__ctype_b_loc@plt+0x557>
    17bb:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
    17c0:	74 0b                	je     17cd <__ctype_b_loc@plt+0x59d>
    17c2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    17c6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
    17c9:	85 c0                	test   eax,eax
    17cb:	75 32                	jne    17ff <__ctype_b_loc@plt+0x5cf>
    17cd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    17d1:	48 83 c0 10          	add    rax,0x10
    17d5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    17d8:	48 8b 05 41 28 00 00 	mov    rax,QWORD PTR [rip+0x2841]        # 4020 <stderr@@GLIBC_2.2.5>
    17df:	48 8d 35 f3 08 00 00 	lea    rsi,[rip+0x8f3]        # 20d9 <__ctype_b_loc@plt+0xea9>
    17e6:	48 89 c7             	mov    rdi,rax
    17e9:	b8 00 00 00 00       	mov    eax,0x0
    17ee:	e8 ad f9 ff ff       	call   11a0 <fprintf@plt>
    17f3:	c7 05 33 28 00 00 01 	mov    DWORD PTR [rip+0x2833],0x1        # 4030 <stderr@@GLIBC_2.2.5+0x10>
    17fa:	00 00 00 
    17fd:	eb 0c                	jmp    180b <__ctype_b_loc@plt+0x5db>
    17ff:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1803:	48 89 c7             	mov    rdi,rax
    1806:	e8 93 01 00 00       	call   199e <__ctype_b_loc@plt+0x76e>
    180b:	8b 05 1f 28 00 00    	mov    eax,DWORD PTR [rip+0x281f]        # 4030 <stderr@@GLIBC_2.2.5+0x10>
    1811:	c9                   	leave  
    1812:	c3                   	ret    
    1813:	f3 0f 1e fa          	endbr64 
    1817:	55                   	push   rbp
    1818:	48 89 e5             	mov    rbp,rsp
    181b:	48 83 ec 30          	sub    rsp,0x30
    181f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    1823:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    1827:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    182b:	48 89 c7             	mov    rdi,rax
    182e:	e8 f4 02 00 00       	call   1b27 <__ctype_b_loc@plt+0x8f7>
    1833:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    1837:	bf 10 00 00 00       	mov    edi,0x10
    183c:	e8 6f f9 ff ff       	call   11b0 <malloc@plt>
    1841:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1845:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
    184a:	75 16                	jne    1862 <__ctype_b_loc@plt+0x632>
    184c:	48 8d 3d a2 08 00 00 	lea    rdi,[rip+0x8a2]        # 20f5 <__ctype_b_loc@plt+0xec5>
    1853:	e8 88 f9 ff ff       	call   11e0 <perror@plt>
    1858:	bf 01 00 00 00       	mov    edi,0x1
    185d:	e8 ae f9 ff ff       	call   1210 <exit@plt>
    1862:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1866:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
    186a:	48 89 10             	mov    QWORD PTR [rax],rdx
    186d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1871:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
    1878:	00 
    1879:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    187d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
    1881:	48 85 c0             	test   rax,rax
    1884:	75 0e                	jne    1894 <__ctype_b_loc@plt+0x664>
    1886:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    188a:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    188e:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    1892:	eb 33                	jmp    18c7 <__ctype_b_loc@plt+0x697>
    1894:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1898:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
    189c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    18a0:	eb 0c                	jmp    18ae <__ctype_b_loc@plt+0x67e>
    18a2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    18a6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    18aa:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    18ae:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    18b2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    18b6:	48 85 c0             	test   rax,rax
    18b9:	75 e7                	jne    18a2 <__ctype_b_loc@plt+0x672>
    18bb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    18bf:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    18c3:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    18c7:	90                   	nop
    18c8:	c9                   	leave  
    18c9:	c3                   	ret    
    18ca:	f3 0f 1e fa          	endbr64 
    18ce:	55                   	push   rbp
    18cf:	48 89 e5             	mov    rbp,rsp
    18d2:	48 83 ec 20          	sub    rsp,0x20
    18d6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    18da:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    18de:	bf 10 00 00 00       	mov    edi,0x10
    18e3:	e8 c8 f8 ff ff       	call   11b0 <malloc@plt>
    18e8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    18ec:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
    18f1:	75 16                	jne    1909 <__ctype_b_loc@plt+0x6d9>
    18f3:	48 8d 3d fb 07 00 00 	lea    rdi,[rip+0x7fb]        # 20f5 <__ctype_b_loc@plt+0xec5>
    18fa:	e8 e1 f8 ff ff       	call   11e0 <perror@plt>
    18ff:	bf 01 00 00 00       	mov    edi,0x1
    1904:	e8 07 f9 ff ff       	call   1210 <exit@plt>
    1909:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    190d:	48 89 c7             	mov    rdi,rax
    1910:	e8 0b f9 ff ff       	call   1220 <strdup@plt>
    1915:	48 89 c2             	mov    rdx,rax
    1918:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    191c:	48 89 10             	mov    QWORD PTR [rax],rdx
    191f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1923:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1926:	48 85 c0             	test   rax,rax
    1929:	75 16                	jne    1941 <__ctype_b_loc@plt+0x711>
    192b:	48 8d 3d c3 07 00 00 	lea    rdi,[rip+0x7c3]        # 20f5 <__ctype_b_loc@plt+0xec5>
    1932:	e8 a9 f8 ff ff       	call   11e0 <perror@plt>
    1937:	bf 01 00 00 00       	mov    edi,0x1
    193c:	e8 cf f8 ff ff       	call   1210 <exit@plt>
    1941:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1945:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
    194c:	00 
    194d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1951:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1955:	48 85 c0             	test   rax,rax
    1958:	74 35                	je     198f <__ctype_b_loc@plt+0x75f>
    195a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    195e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1962:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    1966:	eb 0c                	jmp    1974 <__ctype_b_loc@plt+0x744>
    1968:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    196c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1970:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    1974:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1978:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    197c:	48 85 c0             	test   rax,rax
    197f:	75 e7                	jne    1968 <__ctype_b_loc@plt+0x738>
    1981:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1985:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    1989:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    198d:	eb 0c                	jmp    199b <__ctype_b_loc@plt+0x76b>
    198f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1993:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    1997:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    199b:	90                   	nop
    199c:	c9                   	leave  
    199d:	c3                   	ret    
    199e:	f3 0f 1e fa          	endbr64 
    19a2:	55                   	push   rbp
    19a3:	48 89 e5             	mov    rbp,rsp
    19a6:	48 83 ec 20          	sub    rsp,0x20
    19aa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    19ae:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    19b2:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
    19b5:	85 c0                	test   eax,eax
    19b7:	0f 85 88 00 00 00    	jne    1a45 <__ctype_b_loc@plt+0x815>
    19bd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    19c1:	c7 40 0c 01 00 00 00 	mov    DWORD PTR [rax+0xc],0x1
    19c8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    19cc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
    19d0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    19d4:	eb 1b                	jmp    19f1 <__ctype_b_loc@plt+0x7c1>
    19d6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    19da:	48 8b 00             	mov    rax,QWORD PTR [rax]
    19dd:	48 89 c7             	mov    rdi,rax
    19e0:	e8 b9 ff ff ff       	call   199e <__ctype_b_loc@plt+0x76e>
    19e5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    19e9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    19ed:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    19f1:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
    19f6:	75 de                	jne    19d6 <__ctype_b_loc@plt+0x7a6>
    19f8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    19fc:	48 8b 00             	mov    rax,QWORD PTR [rax]
    19ff:	48 89 c7             	mov    rdi,rax
    1a02:	e8 49 f7 ff ff       	call   1150 <puts@plt>
    1a07:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1a0b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1a0f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    1a13:	eb 27                	jmp    1a3c <__ctype_b_loc@plt+0x80c>
    1a15:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1a19:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1a1c:	48 89 c6             	mov    rsi,rax
    1a1f:	48 8d 3d d6 06 00 00 	lea    rdi,[rip+0x6d6]        # 20fc <__ctype_b_loc@plt+0xecc>
    1a26:	b8 00 00 00 00       	mov    eax,0x0
    1a2b:	e8 50 f7 ff ff       	call   1180 <printf@plt>
    1a30:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1a34:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1a38:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    1a3c:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
    1a41:	75 d2                	jne    1a15 <__ctype_b_loc@plt+0x7e5>
    1a43:	eb 01                	jmp    1a46 <__ctype_b_loc@plt+0x816>
    1a45:	90                   	nop
    1a46:	c9                   	leave  
    1a47:	c3                   	ret    
    1a48:	f3 0f 1e fa          	endbr64 
    1a4c:	55                   	push   rbp
    1a4d:	48 89 e5             	mov    rbp,rsp
    1a50:	48 83 ec 30          	sub    rsp,0x30
    1a54:	e9 ba 00 00 00       	jmp    1b13 <__ctype_b_loc@plt+0x8e3>
    1a59:	48 8b 05 d8 25 00 00 	mov    rax,QWORD PTR [rip+0x25d8]        # 4038 <stderr@@GLIBC_2.2.5+0x18>
    1a60:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    1a64:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    1a68:	48 8b 05 c9 25 00 00 	mov    rax,QWORD PTR [rip+0x25c9]        # 4038 <stderr@@GLIBC_2.2.5+0x18>
    1a6f:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
    1a73:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    1a77:	eb 20                	jmp    1a99 <__ctype_b_loc@plt+0x869>
    1a79:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1a7d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1a81:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1a85:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1a89:	48 89 c7             	mov    rdi,rax
    1a8c:	e8 af f6 ff ff       	call   1140 <free@plt>
    1a91:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1a95:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    1a99:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    1a9e:	75 d9                	jne    1a79 <__ctype_b_loc@plt+0x849>
    1aa0:	48 8b 05 91 25 00 00 	mov    rax,QWORD PTR [rip+0x2591]        # 4038 <stderr@@GLIBC_2.2.5+0x18>
    1aa7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1aab:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    1aaf:	eb 2f                	jmp    1ae0 <__ctype_b_loc@plt+0x8b0>
    1ab1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1ab5:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1ab9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    1abd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1ac1:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1ac4:	48 89 c7             	mov    rdi,rax
    1ac7:	e8 74 f6 ff ff       	call   1140 <free@plt>
    1acc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1ad0:	48 89 c7             	mov    rdi,rax
    1ad3:	e8 68 f6 ff ff       	call   1140 <free@plt>
    1ad8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1adc:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    1ae0:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
    1ae5:	75 ca                	jne    1ab1 <__ctype_b_loc@plt+0x881>
    1ae7:	48 8b 05 4a 25 00 00 	mov    rax,QWORD PTR [rip+0x254a]        # 4038 <stderr@@GLIBC_2.2.5+0x18>
    1aee:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1af1:	48 89 c7             	mov    rdi,rax
    1af4:	e8 47 f6 ff ff       	call   1140 <free@plt>
    1af9:	48 8b 05 38 25 00 00 	mov    rax,QWORD PTR [rip+0x2538]        # 4038 <stderr@@GLIBC_2.2.5+0x18>
    1b00:	48 89 c7             	mov    rdi,rax
    1b03:	e8 38 f6 ff ff       	call   1140 <free@plt>
    1b08:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1b0c:	48 89 05 25 25 00 00 	mov    QWORD PTR [rip+0x2525],rax        # 4038 <stderr@@GLIBC_2.2.5+0x18>
    1b13:	48 8b 05 1e 25 00 00 	mov    rax,QWORD PTR [rip+0x251e]        # 4038 <stderr@@GLIBC_2.2.5+0x18>
    1b1a:	48 85 c0             	test   rax,rax
    1b1d:	0f 85 36 ff ff ff    	jne    1a59 <__ctype_b_loc@plt+0x829>
    1b23:	90                   	nop
    1b24:	90                   	nop
    1b25:	c9                   	leave  
    1b26:	c3                   	ret    
    1b27:	f3 0f 1e fa          	endbr64 
    1b2b:	55                   	push   rbp
    1b2c:	48 89 e5             	mov    rbp,rsp
    1b2f:	48 83 ec 20          	sub    rsp,0x20
    1b33:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    1b37:	48 8b 05 fa 24 00 00 	mov    rax,QWORD PTR [rip+0x24fa]        # 4038 <stderr@@GLIBC_2.2.5+0x18>
    1b3e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1b42:	eb 0c                	jmp    1b50 <__ctype_b_loc@plt+0x920>
    1b44:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1b48:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    1b4c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1b50:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
    1b55:	74 1a                	je     1b71 <__ctype_b_loc@plt+0x941>
    1b57:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1b5b:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1b5e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1b62:	48 89 d6             	mov    rsi,rdx
    1b65:	48 89 c7             	mov    rdi,rax
    1b68:	e8 23 f6 ff ff       	call   1190 <strcmp@plt>
    1b6d:	85 c0                	test   eax,eax
    1b6f:	75 d3                	jne    1b44 <__ctype_b_loc@plt+0x914>
    1b71:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
    1b76:	0f 85 ab 00 00 00    	jne    1c27 <__ctype_b_loc@plt+0x9f7>
    1b7c:	bf 28 00 00 00       	mov    edi,0x28
    1b81:	e8 2a f6 ff ff       	call   11b0 <malloc@plt>
    1b86:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1b8a:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
    1b8f:	75 16                	jne    1ba7 <__ctype_b_loc@plt+0x977>
    1b91:	48 8d 3d 5d 05 00 00 	lea    rdi,[rip+0x55d]        # 20f5 <__ctype_b_loc@plt+0xec5>
    1b98:	e8 43 f6 ff ff       	call   11e0 <perror@plt>
    1b9d:	bf 01 00 00 00       	mov    edi,0x1
    1ba2:	e8 69 f6 ff ff       	call   1210 <exit@plt>
    1ba7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1bab:	48 89 c7             	mov    rdi,rax
    1bae:	e8 6d f6 ff ff       	call   1220 <strdup@plt>
    1bb3:	48 89 c2             	mov    rdx,rax
    1bb6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1bba:	48 89 10             	mov    QWORD PTR [rax],rdx
    1bbd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1bc1:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1bc4:	48 85 c0             	test   rax,rax
    1bc7:	75 16                	jne    1bdf <__ctype_b_loc@plt+0x9af>
    1bc9:	48 8d 3d 25 05 00 00 	lea    rdi,[rip+0x525]        # 20f5 <__ctype_b_loc@plt+0xec5>
    1bd0:	e8 0b f6 ff ff       	call   11e0 <perror@plt>
    1bd5:	bf 01 00 00 00       	mov    edi,0x1
    1bda:	e8 31 f6 ff ff       	call   1210 <exit@plt>
    1bdf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1be3:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
    1bea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1bee:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
    1bf5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1bf9:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
    1c00:	00 
    1c01:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c05:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
    1c0c:	00 
    1c0d:	48 8b 15 24 24 00 00 	mov    rdx,QWORD PTR [rip+0x2424]        # 4038 <stderr@@GLIBC_2.2.5+0x18>
    1c14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c18:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    1c1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c20:	48 89 05 11 24 00 00 	mov    QWORD PTR [rip+0x2411],rax        # 4038 <stderr@@GLIBC_2.2.5+0x18>
    1c27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c2b:	c9                   	leave  
    1c2c:	c3                   	ret    
    1c2d:	0f 1f 00             	nop    DWORD PTR [rax]
    1c30:	f3 0f 1e fa          	endbr64 
    1c34:	41 57                	push   r15
    1c36:	4c 8d 3d 03 21 00 00 	lea    r15,[rip+0x2103]        # 3d40 <__ctype_b_loc@plt+0x2b10>
    1c3d:	41 56                	push   r14
    1c3f:	49 89 d6             	mov    r14,rdx
    1c42:	41 55                	push   r13
    1c44:	49 89 f5             	mov    r13,rsi
    1c47:	41 54                	push   r12
    1c49:	41 89 fc             	mov    r12d,edi
    1c4c:	55                   	push   rbp
    1c4d:	48 8d 2d f4 20 00 00 	lea    rbp,[rip+0x20f4]        # 3d48 <__ctype_b_loc@plt+0x2b18>
    1c54:	53                   	push   rbx
    1c55:	4c 29 fd             	sub    rbp,r15
    1c58:	48 83 ec 08          	sub    rsp,0x8
    1c5c:	e8 9f f3 ff ff       	call   1000 <__cxa_finalize@plt-0x130>
    1c61:	48 c1 fd 03          	sar    rbp,0x3
    1c65:	74 1f                	je     1c86 <__ctype_b_loc@plt+0xa56>
    1c67:	31 db                	xor    ebx,ebx
    1c69:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1c70:	4c 89 f2             	mov    rdx,r14
    1c73:	4c 89 ee             	mov    rsi,r13
    1c76:	44 89 e7             	mov    edi,r12d
    1c79:	41 ff 14 df          	call   QWORD PTR [r15+rbx*8]
    1c7d:	48 83 c3 01          	add    rbx,0x1
    1c81:	48 39 dd             	cmp    rbp,rbx
    1c84:	75 ea                	jne    1c70 <__ctype_b_loc@plt+0xa40>
    1c86:	48 83 c4 08          	add    rsp,0x8
    1c8a:	5b                   	pop    rbx
    1c8b:	5d                   	pop    rbp
    1c8c:	41 5c                	pop    r12
    1c8e:	41 5d                	pop    r13
    1c90:	41 5e                	pop    r14
    1c92:	41 5f                	pop    r15
    1c94:	c3                   	ret    
    1c95:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    1c9c:	00 00 00 00 
    1ca0:	f3 0f 1e fa          	endbr64 
    1ca4:	c3                   	ret    
    1ca5:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    1cac:	00 00 00 
    1caf:	90                   	nop
    1cb0:	f3 0f 1e fa          	endbr64 
    1cb4:	48 8b 15 4d 23 00 00 	mov    rdx,QWORD PTR [rip+0x234d]        # 4008 <__ctype_b_loc@plt+0x2dd8>
    1cbb:	31 f6                	xor    esi,esi
    1cbd:	e9 2e f5 ff ff       	jmp    11f0 <__cxa_atexit@plt>

Disassembly of section .fini:

0000000000001cc4 <.fini>:
    1cc4:	f3 0f 1e fa          	endbr64 
    1cc8:	48 83 ec 08          	sub    rsp,0x8
    1ccc:	48 83 c4 08          	add    rsp,0x8
    1cd0:	c3                   	ret    
