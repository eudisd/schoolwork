00000000  4D                dec bp
00000001  5A                pop dx
00000002  90                nop
00000003  0003              add [bp+di],al
00000005  0000              add [bx+si],al
00000007  0004              add [si],al
00000009  0000              add [bx+si],al
0000000B  00FF              add bh,bh
0000000D  FF00              inc word [bx+si]
0000000F  00B80000          add [bx+si+0x0],bh
00000013  0000              add [bx+si],al
00000015  0000              add [bx+si],al
00000017  004000            add [bx+si+0x0],al
0000001A  0000              add [bx+si],al
0000001C  0000              add [bx+si],al
0000001E  0000              add [bx+si],al
00000020  0000              add [bx+si],al
00000022  0000              add [bx+si],al
00000024  0000              add [bx+si],al
00000026  0000              add [bx+si],al
00000028  0000              add [bx+si],al
0000002A  0000              add [bx+si],al
0000002C  0000              add [bx+si],al
0000002E  0000              add [bx+si],al
00000030  0000              add [bx+si],al
00000032  0000              add [bx+si],al
00000034  0000              add [bx+si],al
00000036  0000              add [bx+si],al
00000038  0000              add [bx+si],al
0000003A  0000              add [bx+si],al
0000003C  E000              loopne 0x3e
0000003E  0000              add [bx+si],al
00000040  0E                push cs
00000041  1F                pop ds
00000042  BA0E00            mov dx,0xe
00000045  B409              mov ah,0x9
00000047  CD21              int 0x21
00000049  B8014C            mov ax,0x4c01
0000004C  CD21              int 0x21
0000004E  54                push sp
0000004F  686973            push word 0x7369
00000052  207072            and [bx+si+0x72],dh
00000055  6F                outsw
00000056  677261            jc 0xba
00000059  6D                insw
0000005A  206361            and [bp+di+0x61],ah
0000005D  6E                outsb
0000005E  6E                outsb
0000005F  6F                outsw
00000060  7420              jz 0x82
00000062  626520            bound sp,[di+0x20]
00000065  7275              jc 0xdc
00000067  6E                outsb
00000068  20696E            and [bx+di+0x6e],ch
0000006B  20444F            and [si+0x4f],al
0000006E  53                push bx
0000006F  206D6F            and [di+0x6f],ch
00000072  64652E0D0D0A      cs or ax,0xa0d
00000078  2400              and al,0x0
0000007A  0000              add [bx+si],al
0000007C  0000              add [bx+si],al
0000007E  0000              add [bx+si],al
00000080  3B4430            cmp ax,[si+0x30]
00000083  2C7F              sub al,0x7f
00000085  255E7F            and ax,0x7f5e
00000088  7F25              jg 0xaf
0000008A  5E                pop si
0000008B  7F7F              jg 0x10c
0000008D  255E7F            and ax,0x7f5e
00000090  64B8C27F          fs mov ax,0x7fc2
00000094  7C25              jl 0xbb
00000096  5E                pop si
00000097  7F64              jg 0xfd
00000099  B8C07F            mov ax,0x7fc0
0000009C  7E25              jng 0xc3
0000009E  5E                pop si
0000009F  7F64              jg 0x105
000000A1  B8F47F            mov ax,0x7ff4
000000A4  6C                insb
000000A5  255E7F            and ax,0x7f5e
000000A8  64B8F57F          fs mov ax,0x7ff5
000000AC  7D25              jnl 0xd3
000000AE  5E                pop si
000000AF  7F76              jg 0x127
000000B1  5D                pop bp
000000B2  CD7F              int 0x7f
000000B4  7D25              jnl 0xdb
000000B6  5E                pop si
000000B7  7F7F              jg 0x138
000000B9  255F7F            and ax,0x7f5f
000000BC  58                pop ax
000000BD  255E7F            and ax,0x7f5e
000000C0  64B8F07F          fs mov ax,0x7ff0
000000C4  7E25              jng 0xeb
000000C6  5E                pop si
000000C7  7F64              jg 0x12d
000000C9  B8C37F            mov ax,0x7fc3
000000CC  7E25              jng 0xf3
000000CE  5E                pop si
000000CF  7F52              jg 0x123
000000D1  6963687F25        imul sp,[bp+di+0x68],word 0x257f
000000D6  5E                pop si
000000D7  7F00              jg 0xd9
000000D9  0000              add [bx+si],al
000000DB  0000              add [bx+si],al
000000DD  0000              add [bx+si],al
000000DF  005045            add [bx+si+0x45],dl
000000E2  0000              add [bx+si],al
000000E4  4C                dec sp
000000E5  0105              add [di],ax
000000E7  00F1              add cl,dh
000000E9  9D                popfw
000000EA  844E00            test [bp+0x0],cl
000000ED  0000              add [bx+si],al
000000EF  0000              add [bx+si],al
000000F1  0000              add [bx+si],al
000000F3  00E0              add al,ah
000000F5  0002              add [bp+si],al
000000F7  010B              add [bp+di],cx
000000F9  010A              add [bp+si],cx
000000FB  0000              add [bx+si],al
000000FD  0800              or [bx+si],al
000000FF  0000              add [bx+si],al
00000101  0C00              or al,0x0
00000103  0000              add [bx+si],al
00000105  0000              add [bx+si],al
00000107  00A01200          add [bx+si+0x12],ah
0000010B  0000              add [bx+si],al
0000010D  1000              adc [bx+si],al
0000010F  0000              add [bx+si],al
00000111  2000              and [bx+si],al
00000113  0000              add [bx+si],al
00000115  004000            add [bx+si+0x0],al
00000118  0010              add [bx+si],dl
0000011A  0000              add [bx+si],al
0000011C  0002              add [bp+si],al
0000011E  0000              add [bx+si],al
00000120  050001            add ax,0x100
00000123  0000              add [bx+si],al
00000125  0000              add [bx+si],al
00000127  0005              add [di],al
00000129  0001              add [bx+di],al
0000012B  0000              add [bx+si],al
0000012D  0000              add [bx+si],al
0000012F  0000              add [bx+si],al
00000131  60                pushaw
00000132  0000              add [bx+si],al
00000134  0004              add [si],al
00000136  0000              add [bx+si],al
00000138  88AB0000          mov [bp+di+0x0],ch
0000013C  0300              add ax,[bx+si]
0000013E  40                inc ax
0000013F  81000010          add word [bx+si],0x1000
00000143  0000              add [bx+si],al
00000145  1000              adc [bx+si],al
00000147  0000              add [bx+si],al
00000149  0010              add [bx+si],dl
0000014B  0000              add [bx+si],al
0000014D  1000              adc [bx+si],al
0000014F  0000              add [bx+si],al
00000151  0000              add [bx+si],al
00000153  0010              add [bx+si],dl
00000155  0000              add [bx+si],al
00000157  0000              add [bx+si],al
00000159  0000              add [bx+si],al
0000015B  0000              add [bx+si],al
0000015D  0000              add [bx+si],al
0000015F  0024              add [si],ah
00000161  2200              and al,[bx+si]
00000163  003C              add [si],bh
00000165  0000              add [bx+si],al
00000167  0000              add [bx+si],al
00000169  40                inc ax
0000016A  0000              add [bx+si],al
0000016C  B401              mov ah,0x1
0000016E  0000              add [bx+si],al
00000170  0000              add [bx+si],al
00000172  0000              add [bx+si],al
00000174  0000              add [bx+si],al
00000176  0000              add [bx+si],al
00000178  0000              add [bx+si],al
0000017A  0000              add [bx+si],al
0000017C  0000              add [bx+si],al
0000017E  0000              add [bx+si],al
00000180  005000            add [bx+si+0x0],dl
00000183  004401            add [si+0x1],al
00000186  0000              add [bx+si],al
00000188  C02000            shl byte [bx+si],0x0
0000018B  001C              add [si],bl
0000018D  0000              add [bx+si],al
0000018F  0000              add [bx+si],al
00000191  0000              add [bx+si],al
00000193  0000              add [bx+si],al
00000195  0000              add [bx+si],al
00000197  0000              add [bx+si],al
00000199  0000              add [bx+si],al
0000019B  0000              add [bx+si],al
0000019D  0000              add [bx+si],al
0000019F  0000              add [bx+si],al
000001A1  0000              add [bx+si],al
000001A3  0000              add [bx+si],al
000001A5  0000              add [bx+si],al
000001A7  00E8              add al,ch
000001A9  2000              and [bx+si],al
000001AB  004000            add [bx+si+0x0],al
000001AE  0000              add [bx+si],al
000001B0  0000              add [bx+si],al
000001B2  0000              add [bx+si],al
000001B4  0000              add [bx+si],al
000001B6  0000              add [bx+si],al
000001B8  0020              add [bx+si],ah
000001BA  0000              add [bx+si],al
000001BC  A4                movsb
000001BD  0000              add [bx+si],al
000001BF  0000              add [bx+si],al
000001C1  0000              add [bx+si],al
000001C3  0000              add [bx+si],al
000001C5  0000              add [bx+si],al
000001C7  0000              add [bx+si],al
000001C9  0000              add [bx+si],al
000001CB  0000              add [bx+si],al
000001CD  0000              add [bx+si],al
000001CF  0000              add [bx+si],al
000001D1  0000              add [bx+si],al
000001D3  0000              add [bx+si],al
000001D5  0000              add [bx+si],al
000001D7  002E7465          add [0x6574],ch
000001DB  7874              js 0x251
000001DD  0000              add [bx+si],al
000001DF  00E4              add ah,ah
000001E1  07                pop es
000001E2  0000              add [bx+si],al
000001E4  0010              add [bx+si],dl
000001E6  0000              add [bx+si],al
000001E8  0008              add [bx+si],cl
000001EA  0000              add [bx+si],al
000001EC  0004              add [si],al
000001EE  0000              add [bx+si],al
000001F0  0000              add [bx+si],al
000001F2  0000              add [bx+si],al
000001F4  0000              add [bx+si],al
000001F6  0000              add [bx+si],al
000001F8  0000              add [bx+si],al
000001FA  0000              add [bx+si],al
000001FC  2000              and [bx+si],al
000001FE  00602E            add [bx+si+0x2e],ah
00000201  7264              jc 0x267
00000203  61                popaw
00000204  7461              jz 0x267
00000206  0000              add [bx+si],al
00000208  C60500            mov byte [di],0x0
0000020B  0000              add [bx+si],al
0000020D  2000              and [bx+si],al
0000020F  0000              add [bx+si],al
00000211  06                push es
00000212  0000              add [bx+si],al
00000214  000C              add [si],cl
00000216  0000              add [bx+si],al
00000218  0000              add [bx+si],al
0000021A  0000              add [bx+si],al
0000021C  0000              add [bx+si],al
0000021E  0000              add [bx+si],al
00000220  0000              add [bx+si],al
00000222  0000              add [bx+si],al
00000224  40                inc ax
00000225  0000              add [bx+si],al
00000227  40                inc ax
00000228  2E6461            fs popaw
0000022B  7461              jz 0x28e
0000022D  0000              add [bx+si],al
0000022F  00840300          add [si+0x3],al
00000233  0000              add [bx+si],al
00000235  3000              xor [bx+si],al
00000237  0000              add [bx+si],al
00000239  0200              add al,[bx+si]
0000023B  0000              add [bx+si],al
0000023D  1200              adc al,[bx+si]
0000023F  0000              add [bx+si],al
00000241  0000              add [bx+si],al
00000243  0000              add [bx+si],al
00000245  0000              add [bx+si],al
00000247  0000              add [bx+si],al
00000249  0000              add [bx+si],al
0000024B  004000            add [bx+si+0x0],al
0000024E  00C0              add al,al
00000250  2E7273            cs jc 0x2c6
00000253  7263              jc 0x2b8
00000255  0000              add [bx+si],al
00000257  00B40100          add [si+0x1],dh
0000025B  0000              add [bx+si],al
0000025D  40                inc ax
0000025E  0000              add [bx+si],al
00000260  0002              add [bp+si],al
00000262  0000              add [bx+si],al
00000264  0014              add [si],dl
00000266  0000              add [bx+si],al
00000268  0000              add [bx+si],al
0000026A  0000              add [bx+si],al
0000026C  0000              add [bx+si],al
0000026E  0000              add [bx+si],al
00000270  0000              add [bx+si],al
00000272  0000              add [bx+si],al
00000274  40                inc ax
00000275  0000              add [bx+si],al
00000277  40                inc ax
00000278  2E7265            cs jc 0x2e0
0000027B  6C                insb
0000027C  6F                outsw
0000027D  6300              arpl [bx+si],ax
0000027F  008E0100          add [bp+0x1],cl
00000283  0000              add [bx+si],al
00000285  50                push ax
00000286  0000              add [bx+si],al
00000288  0002              add [bp+si],al
0000028A  0000              add [bx+si],al
0000028C  00160000          add [0x0],dl
00000290  0000              add [bx+si],al
00000292  0000              add [bx+si],al
00000294  0000              add [bx+si],al
00000296  0000              add [bx+si],al
00000298  0000              add [bx+si],al
0000029A  0000              add [bx+si],al
0000029C  40                inc ax
0000029D  0000              add [bx+si],al
0000029F  42                inc dx
000002A0  0000              add [bx+si],al
000002A2  0000              add [bx+si],al
000002A4  0000              add [bx+si],al
000002A6  0000              add [bx+si],al
000002A8  0000              add [bx+si],al
000002AA  0000              add [bx+si],al
000002AC  0000              add [bx+si],al
000002AE  0000              add [bx+si],al
000002B0  0000              add [bx+si],al
000002B2  0000              add [bx+si],al
000002B4  0000              add [bx+si],al
000002B6  0000              add [bx+si],al
000002B8  0000              add [bx+si],al
000002BA  0000              add [bx+si],al
000002BC  0000              add [bx+si],al
000002BE  0000              add [bx+si],al
000002C0  0000              add [bx+si],al
000002C2  0000              add [bx+si],al
000002C4  0000              add [bx+si],al
000002C6  0000              add [bx+si],al
000002C8  0000              add [bx+si],al
000002CA  0000              add [bx+si],al
000002CC  0000              add [bx+si],al
000002CE  0000              add [bx+si],al
000002D0  0000              add [bx+si],al
000002D2  0000              add [bx+si],al
000002D4  0000              add [bx+si],al
000002D6  0000              add [bx+si],al
000002D8  0000              add [bx+si],al
000002DA  0000              add [bx+si],al
000002DC  0000              add [bx+si],al
000002DE  0000              add [bx+si],al
000002E0  0000              add [bx+si],al
000002E2  0000              add [bx+si],al
000002E4  0000              add [bx+si],al
000002E6  0000              add [bx+si],al
000002E8  0000              add [bx+si],al
000002EA  0000              add [bx+si],al
000002EC  0000              add [bx+si],al
000002EE  0000              add [bx+si],al
000002F0  0000              add [bx+si],al
000002F2  0000              add [bx+si],al
000002F4  0000              add [bx+si],al
000002F6  0000              add [bx+si],al
000002F8  0000              add [bx+si],al
000002FA  0000              add [bx+si],al
000002FC  0000              add [bx+si],al
000002FE  0000              add [bx+si],al
00000300  0000              add [bx+si],al
00000302  0000              add [bx+si],al
00000304  0000              add [bx+si],al
00000306  0000              add [bx+si],al
00000308  0000              add [bx+si],al
0000030A  0000              add [bx+si],al
0000030C  0000              add [bx+si],al
0000030E  0000              add [bx+si],al
00000310  0000              add [bx+si],al
00000312  0000              add [bx+si],al
00000314  0000              add [bx+si],al
00000316  0000              add [bx+si],al
00000318  0000              add [bx+si],al
0000031A  0000              add [bx+si],al
0000031C  0000              add [bx+si],al
0000031E  0000              add [bx+si],al
00000320  0000              add [bx+si],al
00000322  0000              add [bx+si],al
00000324  0000              add [bx+si],al
00000326  0000              add [bx+si],al
00000328  0000              add [bx+si],al
0000032A  0000              add [bx+si],al
0000032C  0000              add [bx+si],al
0000032E  0000              add [bx+si],al
00000330  0000              add [bx+si],al
00000332  0000              add [bx+si],al
00000334  0000              add [bx+si],al
00000336  0000              add [bx+si],al
00000338  0000              add [bx+si],al
0000033A  0000              add [bx+si],al
0000033C  0000              add [bx+si],al
0000033E  0000              add [bx+si],al
00000340  0000              add [bx+si],al
00000342  0000              add [bx+si],al
00000344  0000              add [bx+si],al
00000346  0000              add [bx+si],al
00000348  0000              add [bx+si],al
0000034A  0000              add [bx+si],al
0000034C  0000              add [bx+si],al
0000034E  0000              add [bx+si],al
00000350  0000              add [bx+si],al
00000352  0000              add [bx+si],al
00000354  0000              add [bx+si],al
00000356  0000              add [bx+si],al
00000358  0000              add [bx+si],al
0000035A  0000              add [bx+si],al
0000035C  0000              add [bx+si],al
0000035E  0000              add [bx+si],al
00000360  0000              add [bx+si],al
00000362  0000              add [bx+si],al
00000364  0000              add [bx+si],al
00000366  0000              add [bx+si],al
00000368  0000              add [bx+si],al
0000036A  0000              add [bx+si],al
0000036C  0000              add [bx+si],al
0000036E  0000              add [bx+si],al
00000370  0000              add [bx+si],al
00000372  0000              add [bx+si],al
00000374  0000              add [bx+si],al
00000376  0000              add [bx+si],al
00000378  0000              add [bx+si],al
0000037A  0000              add [bx+si],al
0000037C  0000              add [bx+si],al
0000037E  0000              add [bx+si],al
00000380  0000              add [bx+si],al
00000382  0000              add [bx+si],al
00000384  0000              add [bx+si],al
00000386  0000              add [bx+si],al
00000388  0000              add [bx+si],al
0000038A  0000              add [bx+si],al
0000038C  0000              add [bx+si],al
0000038E  0000              add [bx+si],al
00000390  0000              add [bx+si],al
00000392  0000              add [bx+si],al
00000394  0000              add [bx+si],al
00000396  0000              add [bx+si],al
00000398  0000              add [bx+si],al
0000039A  0000              add [bx+si],al
0000039C  0000              add [bx+si],al
0000039E  0000              add [bx+si],al
000003A0  0000              add [bx+si],al
000003A2  0000              add [bx+si],al
000003A4  0000              add [bx+si],al
000003A6  0000              add [bx+si],al
000003A8  0000              add [bx+si],al
000003AA  0000              add [bx+si],al
000003AC  0000              add [bx+si],al
000003AE  0000              add [bx+si],al
000003B0  0000              add [bx+si],al
000003B2  0000              add [bx+si],al
000003B4  0000              add [bx+si],al
000003B6  0000              add [bx+si],al
000003B8  0000              add [bx+si],al
000003BA  0000              add [bx+si],al
000003BC  0000              add [bx+si],al
000003BE  0000              add [bx+si],al
000003C0  0000              add [bx+si],al
000003C2  0000              add [bx+si],al
000003C4  0000              add [bx+si],al
000003C6  0000              add [bx+si],al
000003C8  0000              add [bx+si],al
000003CA  0000              add [bx+si],al
000003CC  0000              add [bx+si],al
000003CE  0000              add [bx+si],al
000003D0  0000              add [bx+si],al
000003D2  0000              add [bx+si],al
000003D4  0000              add [bx+si],al
000003D6  0000              add [bx+si],al
000003D8  0000              add [bx+si],al
000003DA  0000              add [bx+si],al
000003DC  0000              add [bx+si],al
000003DE  0000              add [bx+si],al
000003E0  0000              add [bx+si],al
000003E2  0000              add [bx+si],al
000003E4  0000              add [bx+si],al
000003E6  0000              add [bx+si],al
000003E8  0000              add [bx+si],al
000003EA  0000              add [bx+si],al
000003EC  0000              add [bx+si],al
000003EE  0000              add [bx+si],al
000003F0  0000              add [bx+si],al
000003F2  0000              add [bx+si],al
000003F4  0000              add [bx+si],al
000003F6  0000              add [bx+si],al
000003F8  0000              add [bx+si],al
000003FA  0000              add [bx+si],al
000003FC  0000              add [bx+si],al
000003FE  0000              add [bx+si],al
00000400  33C0              xor ax,ax
00000402  C3                ret
00000403  3B0D              cmp cx,[di]
00000405  0030              add [bx+si],dh
00000407  40                inc ax
00000408  007502            add [di+0x2],dh
0000040B  F3C3              rep ret
0000040D  E99802            jmp word 0x6a8
00000410  0000              add [bx+si],al
00000412  68E414            push word 0x14e4
00000415  40                inc ax
00000416  00E8              add al,ch
00000418  8B04              mov ax,[si]
0000041A  0000              add [bx+si],al
0000041C  A16033            mov ax,[0x3360]
0000041F  40                inc ax
00000420  00C7              add bh,al
00000422  0424              add al,0x24
00000424  2C30              sub al,0x30
00000426  40                inc ax
00000427  00FF              add bh,bh
00000429  355C33            xor ax,0x335c
0000042C  40                inc ax
0000042D  00A32C30          add [bp+di+0x302c],ah
00000431  40                inc ax
00000432  00681C            add [bx+si+0x1c],ch
00000435  304000            xor [bx+si+0x0],al
00000438  682030            push word 0x3020
0000043B  40                inc ax
0000043C  006818            add [bx+si+0x18],ch
0000043F  304000            xor [bx+si+0x0],al
00000442  FF15              call word near [di]
00000444  94                xchg ax,sp
00000445  204000            and [bx+si+0x0],al
00000448  83C414            add sp,byte +0x14
0000044B  A32830            mov [0x3028],ax
0000044E  40                inc ax
0000044F  0085C079          add [di+0x79c0],al
00000453  086A08            or [bp+si+0x8],ch
00000456  E8A503            call word 0x7fe
00000459  0000              add [bx+si],al
0000045B  59                pop cx
0000045C  C3                ret
0000045D  6A10              push byte +0x10
0000045F  68C821            push word 0x21c8
00000462  40                inc ax
00000463  00E8              add al,ch
00000465  07                pop es
00000466  06                push es
00000467  0000              add [bx+si],al
00000469  33DB              xor bx,bx
0000046B  391D              cmp [di],bx
0000046D  7C33              jl 0x4a2
0000046F  40                inc ax
00000470  00750B            add [di+0xb],dh
00000473  53                push bx
00000474  53                push bx
00000475  6A01              push byte +0x1
00000477  53                push bx
00000478  FF15              call word near [di]
0000047A  2C20              sub al,0x20
0000047C  40                inc ax
0000047D  00895DFC          add [bx+di-0x3a3],cl
00000481  64A11800          mov ax,[fs:0x18]
00000485  0000              add [bx+si],al
00000487  8B7004            mov si,[bx+si+0x4]
0000048A  895DE4            mov [di-0x1c],bx
0000048D  BF7033            mov di,0x3370
00000490  40                inc ax
00000491  005356            add [bp+di+0x56],dl
00000494  57                push di
00000495  FF15              call word near [di]
00000497  3020              xor [bx+si],ah
00000499  40                inc ax
0000049A  003B              add [bp+di],bh
0000049C  C3                ret
0000049D  7419              jz 0x4b8
0000049F  3BC6              cmp ax,si
000004A1  7508              jnz 0x4ab
000004A3  33F6              xor si,si
000004A5  46                inc si
000004A6  8975E4            mov [di-0x1c],si
000004A9  EB10              jmp short 0x4bb
000004AB  68E803            push word 0x3e8
000004AE  0000              add [bx+si],al
000004B0  FF15              call word near [di]
000004B2  3420              xor al,0x20
000004B4  40                inc ax
000004B5  00EB              add bl,ch
000004B7  DA33              fidiv dword [bp+di]
000004B9  F646A16C          test byte [bp-0x5f],0x6c
000004BD  334000            xor ax,[bx+si+0x0]
000004C0  3BC6              cmp ax,si
000004C2  750A              jnz 0x4ce
000004C4  6A1F              push byte +0x1f
000004C6  E83503            call word 0x7fe
000004C9  0000              add [bx+si],al
000004CB  59                pop cx
000004CC  EB3B              jmp short 0x509
000004CE  A16C33            mov ax,[0x336c]
000004D1  40                inc ax
000004D2  0085C075          add [di+0x75c0],al
000004D6  2C89              sub al,0x89
000004D8  356C33            xor ax,0x336c
000004DB  40                inc ax
000004DC  0068BC            add [bx+si-0x44],ch
000004DF  204000            and [bx+si+0x0],al
000004E2  68B020            push word 0x20b0
000004E5  40                inc ax
000004E6  00E8              add al,ch
000004E8  7605              jna 0x4ef
000004EA  0000              add [bx+si],al
000004EC  59                pop cx
000004ED  59                pop cx
000004EE  85C0              test ax,ax
000004F0  7417              jz 0x509
000004F2  C745FCFEFF        mov word [di-0x4],0xfffe
000004F7  FF                db 0xff
000004F8  FF                db 0xff
000004F9  B8FF00            mov ax,0xff
000004FC  0000              add [bx+si],al
000004FE  E9DD00            jmp word 0x5de
00000501  0000              add [bx+si],al
00000503  8935              mov [di],si
00000505  3430              xor al,0x30
00000507  40                inc ax
00000508  00A16C33          add [bx+di+0x336c],ah
0000050C  40                inc ax
0000050D  003B              add [bp+di],bh
0000050F  C6                db 0xc6
00000510  751B              jnz 0x52d
00000512  68AC20            push word 0x20ac
00000515  40                inc ax
00000516  0068A4            add [bx+si-0x5c],ch
00000519  204000            and [bx+si+0x0],al
0000051C  E83B05            call word 0xa5a
0000051F  0000              add [bx+si],al
00000521  59                pop cx
00000522  59                pop cx
00000523  C7056C33          mov word [di],0x336c
00000527  40                inc ax
00000528  0002              add [bp+si],al
0000052A  0000              add [bx+si],al
0000052C  0039              add [bx+di],bh
0000052E  5D                pop bp
0000052F  E475              in al,0x75
00000531  085357            or [bp+di+0x57],dl
00000534  FF15              call word near [di]
00000536  3820              cmp [bx+si],ah
00000538  40                inc ax
00000539  0039              add [bx+di],bh
0000053B  1D8033            sbb ax,0x3380
0000053E  40                inc ax
0000053F  007419            add [si+0x19],dh
00000542  688033            push word 0x3380
00000545  40                inc ax
00000546  00E8              add al,ch
00000548  54                push sp
00000549  0400              add al,0x0
0000054B  005985            add [bx+di-0x7b],bl
0000054E  C0                db 0xc0
0000054F  740A              jz 0x55b
00000551  53                push bx
00000552  6A02              push byte +0x2
00000554  53                push bx
00000555  FF15              call word near [di]
00000557  803340            xor byte [bp+di],0x40
0000055A  00A11C30          add [bx+di+0x301c],ah
0000055E  40                inc ax
0000055F  008B0D80          add [bp+di-0x7ff3],cl
00000563  204000            and [bx+si+0x0],al
00000566  8901              mov [bx+di],ax
00000568  FF35              push word [di]
0000056A  1C30              sbb al,0x30
0000056C  40                inc ax
0000056D  00FF              add bh,bh
0000056F  352030            xor ax,0x3020
00000572  40                inc ax
00000573  00FF              add bh,bh
00000575  351830            xor ax,0x3018
00000578  40                inc ax
00000579  00E8              add al,ch
0000057B  81FEFFFF          cmp si,0xffff
0000057F  83C40C            add sp,byte +0xc
00000582  A33030            mov [0x3030],ax
00000585  40                inc ax
00000586  0039              add [bx+di],bh
00000588  1D2430            sbb ax,0x3024
0000058B  40                inc ax
0000058C  007537            add [di+0x37],dh
0000058F  50                push ax
00000590  FF15              call word near [di]
00000592  8420              test [bx+si],ah
00000594  40                inc ax
00000595  008B45EC          add [bp+di-0x13bb],cl
00000599  8B08              mov cx,[bx+si]
0000059B  8B09              mov cx,[bx+di]
0000059D  894DE0            mov [di-0x20],cx
000005A0  50                push ax
000005A1  51                push cx
000005A2  E86303            call word 0x908
000005A5  0000              add [bx+si],al
000005A7  59                pop cx
000005A8  59                pop cx
000005A9  C3                ret
000005AA  8B65E8            mov sp,[di-0x18]
000005AD  8B45E0            mov ax,[di-0x20]
000005B0  A33030            mov [0x3030],ax
000005B3  40                inc ax
000005B4  0033              add [bp+di],dh
000005B6  DB39              fstp tword [bx+di]
000005B8  1D2430            sbb ax,0x3024
000005BB  40                inc ax
000005BC  007507            add [di+0x7],dh
000005BF  50                push ax
000005C0  FF15              call word near [di]
000005C2  8C20              mov [bx+si],fs
000005C4  40                inc ax
000005C5  0039              add [bx+di],bh
000005C7  1D3430            sbb ax,0x3034
000005CA  40                inc ax
000005CB  007506            add [di+0x6],dh
000005CE  FF15              call word near [di]
000005D0  90                nop
000005D1  204000            and [bx+si+0x0],al
000005D4  C745FCFEFF        mov word [di-0x4],0xfffe
000005D9  FF                db 0xff
000005DA  FFA13030          jmp word near [bx+di+0x3030]
000005DE  40                inc ax
000005DF  00E8              add al,ch
000005E1  D004              rol byte [si],1
000005E3  0000              add [bx+si],al
000005E5  C3                ret
000005E6  B84D5A            mov ax,0x5a4d
000005E9  0000              add [bx+si],al
000005EB  663905            cmp [di],eax
000005EE  0000              add [bx+si],al
000005F0  40                inc ax
000005F1  007404            add [si+0x4],dh
000005F4  33C0              xor ax,ax
000005F6  EB35              jmp short 0x62d
000005F8  A13C00            mov ax,[0x3c]
000005FB  40                inc ax
000005FC  0081B800          add [bx+di+0xb8],al
00000600  004000            add [bx+si+0x0],al
00000603  50                push ax
00000604  45                inc bp
00000605  0000              add [bx+si],al
00000607  75EB              jnz 0x5f4
00000609  B90B01            mov cx,0x10b
0000060C  0000              add [bx+si],al
0000060E  6639881800        cmp [bx+si+0x18],ecx
00000613  40                inc ax
00000614  0075DD            add [di-0x23],dh
00000617  83B8740040        cmp word [bx+si+0x74],byte +0x40
0000061C  000E76D4          add [0xd476],cl
00000620  33C9              xor cx,cx
00000622  3988E800          cmp [bx+si+0xe8],cx
00000626  40                inc ax
00000627  000F              add [bx],cl
00000629  95                xchg ax,bp
0000062A  C18BC16A01        ror word [bp+di+0x6ac1],0x1
0000062F  A32430            mov [0x3024],ax
00000632  40                inc ax
00000633  00FF              add bh,bh
00000635  156420            adc ax,0x2064
00000638  40                inc ax
00000639  00596A            add [bx+di+0x6a],bl
0000063C  FF                db 0xff
0000063D  FF15              call word near [di]
0000063F  2820              sub [bx+si],ah
00000641  40                inc ax
00000642  008B0D68          add [bp+di+0x680d],cl
00000646  334000            xor ax,[bx+si+0x0]
00000649  A37433            mov [0x3374],ax
0000064C  40                inc ax
0000064D  00A37833          add [bp+di+0x3378],ah
00000651  40                inc ax
00000652  00A16820          add [bx+di+0x2068],ah
00000656  40                inc ax
00000657  008908A1          add [bx+di-0x5ef8],cl
0000065B  6C                insb
0000065C  204000            and [bx+si+0x0],al
0000065F  8B0D              mov cx,[di]
00000661  64334000          xor ax,[fs:bx+si+0x0]
00000665  8908              mov [bx+si],cx
00000667  E85202            call word 0x8bc
0000066A  0000              add [bx+si],al
0000066C  E8A504            call word 0xb14
0000066F  0000              add [bx+si],al
00000671  833D14            cmp word [di],byte +0x14
00000674  304000            xor [bx+si+0x0],al
00000677  00750C            add [di+0xc],dh
0000067A  681617            push word 0x1716
0000067D  40                inc ax
0000067E  00FF              add bh,bh
00000680  157020            adc ax,0x2070
00000683  40                inc ax
00000684  0059E8            add [bx+di-0x18],bl
00000687  6304              arpl [si],ax
00000689  0000              add [bx+si],al
0000068B  833D10            cmp word [di],byte +0x10
0000068E  304000            xor [bx+si+0x0],al
00000691  FF7509            push word [di+0x9]
00000694  6AFF              push byte -0x1
00000696  FF15              call word near [di]
00000698  7420              jz 0x6ba
0000069A  40                inc ax
0000069B  005933            add [bx+di+0x33],bl
0000069E  C0C3E8            rol bl,0xe8
000006A1  7404              jz 0x6a7
000006A3  0000              add [bx+si],al
000006A5  E9B3FD            jmp word 0x45b
000006A8  FF                db 0xff
000006A9  FF8BFF55          dec word [bp+di+0x55ff]
000006AD  8BEC              mov bp,sp
000006AF  81EC2803          sub sp,0x328
000006B3  0000              add [bx+si],al
000006B5  A34031            mov [0x3140],ax
000006B8  40                inc ax
000006B9  00890D3C          add [bx+di+0x3c0d],cl
000006BD  314000            xor [bx+si+0x0],ax
000006C0  8915              mov [di],dx
000006C2  3831              cmp [bx+di],dh
000006C4  40                inc ax
000006C5  00891D34          add [bx+di+0x341d],cl
000006C9  314000            xor [bx+si+0x0],ax
000006CC  8935              mov [di],si
000006CE  3031              xor [bx+di],dh
000006D0  40                inc ax
000006D1  00893D2C          add [bx+di+0x2c3d],cl
000006D5  314000            xor [bx+si+0x0],ax
000006D8  668C15            o32 mov [di],ss
000006DB  58                pop ax
000006DC  314000            xor [bx+si+0x0],ax
000006DF  668C0D            o32 mov [di],cs
000006E2  4C                dec sp
000006E3  314000            xor [bx+si+0x0],ax
000006E6  668C1D            o32 mov [di],ds
000006E9  2831              sub [bx+di],dh
000006EB  40                inc ax
000006EC  00668C            add [bp-0x74],ah
000006EF  052431            add ax,0x3124
000006F2  40                inc ax
000006F3  00668C            add [bp-0x74],ah
000006F6  252031            and ax,0x3120
000006F9  40                inc ax
000006FA  00668C            add [bp-0x74],ah
000006FD  2D1C31            sub ax,0x311c
00000700  40                inc ax
00000701  009C8F05          add [si+0x58f],bl
00000705  50                push ax
00000706  314000            xor [bx+si+0x0],ax
00000709  8B4500            mov ax,[di+0x0]
0000070C  A34431            mov [0x3144],ax
0000070F  40                inc ax
00000710  008B4504          add [bp+di+0x445],cl
00000714  A34831            mov [0x3148],ax
00000717  40                inc ax
00000718  008D4508          add [di+0x845],cl
0000071C  A35431            mov [0x3154],ax
0000071F  40                inc ax
00000720  008B85E0          add [bp+di-0x1f7b],cl
00000724  FC                cld
00000725  FF                db 0xff
00000726  FFC7              inc di
00000728  059030            add ax,0x3090
0000072B  40                inc ax
0000072C  0001              add [bx+di],al
0000072E  0001              add [bx+di],al
00000730  00A14831          add [bx+di+0x3148],ah
00000734  40                inc ax
00000735  00A34430          add [bp+di+0x3044],ah
00000739  40                inc ax
0000073A  00C7              add bh,al
0000073C  053830            add ax,0x3038
0000073F  40                inc ax
00000740  0009              add [bx+di],cl
00000742  0400              add al,0x0
00000744  C0C705            rol bh,0x5
00000747  3C30              cmp al,0x30
00000749  40                inc ax
0000074A  0001              add [bx+di],al
0000074C  0000              add [bx+si],al
0000074E  00A10030          add [bx+di+0x3000],ah
00000752  40                inc ax
00000753  008985D8          add [bx+di-0x277b],cl
00000757  FC                cld
00000758  FF                db 0xff
00000759  FFA10430          jmp word near [bx+di+0x3004]
0000075D  40                inc ax
0000075E  008985DC          add [bx+di-0x237b],cl
00000762  FC                cld
00000763  FF                db 0xff
00000764  FF                db 0xff
00000765  FF15              call word near [di]
00000767  1420              adc al,0x20
00000769  40                inc ax
0000076A  00A38830          add [bp+di+0x3088],ah
0000076E  40                inc ax
0000076F  006A01            add [bp+si+0x1],ch
00000772  E83D04            call word 0xbb2
00000775  0000              add [bx+si],al
00000777  59                pop cx
00000778  6A00              push byte +0x0
0000077A  FF15              call word near [di]
0000077C  1820              sbb [bx+si],ah
0000077E  40                inc ax
0000077F  0068DC            add [bx+si-0x24],ch
00000782  204000            and [bx+si+0x0],al
00000785  FF15              call word near [di]
00000787  1C20              sbb al,0x20
00000789  40                inc ax
0000078A  00833D88          add [bp+di-0x77c3],al
0000078E  304000            xor [bx+si+0x0],al
00000791  007508            add [di+0x8],dh
00000794  6A01              push byte +0x1
00000796  E81904            call word 0xbb2
00000799  0000              add [bx+si],al
0000079B  59                pop cx
0000079C  680904            push word 0x409
0000079F  00C0              add al,al
000007A1  FF15              call word near [di]
000007A3  2020              and [bx+si],ah
000007A5  40                inc ax
000007A6  0050FF            add [bx+si-0x1],dl
000007A9  152420            adc ax,0x2024
000007AC  40                inc ax
000007AD  00C9              add cl,cl
000007AF  C3                ret
000007B0  8BFF              mov di,di
000007B2  55                push bp
000007B3  8BEC              mov bp,sp
000007B5  8B4508            mov ax,[di+0x8]
000007B8  8B00              mov ax,[bx+si]
000007BA  81386373          cmp word [bx+si],0x7363
000007BE  6D                insw
000007BF  E075              loopne 0x836
000007C1  2A837810          sub al,[bp+di+0x1078]
000007C5  037524            add si,[di+0x24]
000007C8  8B4014            mov ax,[bx+si+0x14]
000007CB  3D2005            cmp ax,0x520
000007CE  93                xchg ax,bx
000007CF  197415            sbb [si+0x15],si
000007D2  3D2105            cmp ax,0x521
000007D5  93                xchg ax,bx
000007D6  19740E            sbb [si+0xe],si
000007D9  3D2205            cmp ax,0x522
000007DC  93                xchg ax,bx
000007DD  197407            sbb [si+0x7],si
000007E0  3D0040            cmp ax,0x4000
000007E3  99                cwd
000007E4  017505            add [di+0x5],si
000007E7  E8CE03            call word 0xbb8
000007EA  0000              add [bx+si],al
000007EC  33C0              xor ax,ax
000007EE  5D                pop bp
000007EF  C20400            ret 0x4
000007F2  68B013            push word 0x13b0
000007F5  40                inc ax
000007F6  00FF              add bh,bh
000007F8  151820            adc ax,0x2018
000007FB  40                inc ax
000007FC  0033              add [bp+di],dh
000007FE  C0C3FF            rol bl,0xff
00000801  259C20            and ax,0x209c
00000804  40                inc ax
00000805  006A14            add [bp+si+0x14],ch
00000808  68E821            push word 0x21e8
0000080B  40                inc ax
0000080C  00E8              add al,ch
0000080E  5E                pop si
0000080F  0200              add al,[bx+si]
00000811  00FF              add bh,bh
00000813  357833            xor ax,0x3378
00000816  40                inc ax
00000817  008B3510          add [bp+di+0x1035],cl
0000081B  204000            and [bx+si+0x0],al
0000081E  FFD6              call si
00000820  8945E4            mov [di-0x1c],ax
00000823  83F8FF            cmp ax,byte -0x1
00000826  750C              jnz 0x834
00000828  FF7508            push word [di+0x8]
0000082B  FF15              call word near [di]
0000082D  4C                dec sp
0000082E  204000            and [bx+si+0x0],al
00000831  59                pop cx
00000832  EB64              jmp short 0x898
00000834  6A08              push byte +0x8
00000836  E89103            call word 0xbca
00000839  0000              add [bx+si],al
0000083B  59                pop cx
0000083C  8365FC00          and word [di-0x4],byte +0x0
00000840  FF35              push word [di]
00000842  7833              js 0x877
00000844  40                inc ax
00000845  00FF              add bh,bh
00000847  D6                salc
00000848  8945E4            mov [di-0x1c],ax
0000084B  FF35              push word [di]
0000084D  7433              jz 0x882
0000084F  40                inc ax
00000850  00FF              add bh,bh
00000852  D6                salc
00000853  8945E0            mov [di-0x20],ax
00000856  8D45E0            lea ax,[di-0x20]
00000859  50                push ax
0000085A  8D45E4            lea ax,[di-0x1c]
0000085D  50                push ax
0000085E  FF7508            push word [di+0x8]
00000861  8B35              mov si,[di]
00000863  2820              sub [bx+si],ah
00000865  40                inc ax
00000866  00FF              add bh,bh
00000868  D6                salc
00000869  50                push ax
0000086A  E85703            call word 0xbc4
0000086D  0000              add [bx+si],al
0000086F  83C40C            add sp,byte +0xc
00000872  8945DC            mov [di-0x24],ax
00000875  FF75E4            push word [di-0x1c]
00000878  FFD6              call si
0000087A  A37833            mov [0x3378],ax
0000087D  40                inc ax
0000087E  00FF              add bh,bh
00000880  75E0              jnz 0x862
00000882  FFD6              call si
00000884  A37433            mov [0x3374],ax
00000887  40                inc ax
00000888  00C7              add bh,al
0000088A  45                inc bp
0000088B  FC                cld
0000088C  FE                db 0xfe
0000088D  FF                db 0xff
0000088E  FF                db 0xff
0000088F  FF                db 0xff
00000890  E80900            call word 0x89c
00000893  0000              add [bx+si],al
00000895  8B45DC            mov ax,[di-0x24]
00000898  E81802            call word 0xab3
0000089B  0000              add [bx+si],al
0000089D  C3                ret
0000089E  6A08              push byte +0x8
000008A0  E81B03            call word 0xbbe
000008A3  0000              add [bx+si],al
000008A5  59                pop cx
000008A6  C3                ret
000008A7  8BFF              mov di,di
000008A9  55                push bp
000008AA  8BEC              mov bp,sp
000008AC  FF7508            push word [di+0x8]
000008AF  E852FF            call word 0x804
000008B2  FF                db 0xff
000008B3  FFF7              push di
000008B5  D81B              fcomp dword [bp+di]
000008B7  C0                db 0xc0
000008B8  F7D8              neg ax
000008BA  59                pop cx
000008BB  48                dec ax
000008BC  5D                pop bp
000008BD  C3                ret
000008BE  8BFF              mov di,di
000008C0  56                push si
000008C1  B8B821            mov ax,0x21b8
000008C4  40                inc ax
000008C5  00BEB821          add [bp+0x21b8],bh
000008C9  40                inc ax
000008CA  00578B            add [bx-0x75],dl
000008CD  F8                clc
000008CE  3BC6              cmp ax,si
000008D0  730F              jnc 0x8e1
000008D2  8B07              mov ax,[bx]
000008D4  85C0              test ax,ax
000008D6  7402              jz 0x8da
000008D8  FFD0              call ax
000008DA  83C704            add di,byte +0x4
000008DD  3BFE              cmp di,si
000008DF  72F1              jc 0x8d2
000008E1  5F                pop di
000008E2  5E                pop si
000008E3  C3                ret
000008E4  8BFF              mov di,di
000008E6  56                push si
000008E7  B8C021            mov ax,0x21c0
000008EA  40                inc ax
000008EB  00BEC021          add [bp+0x21c0],bh
000008EF  40                inc ax
000008F0  00578B            add [bx-0x75],dl
000008F3  F8                clc
000008F4  3BC6              cmp ax,si
000008F6  730F              jnc 0x907
000008F8  8B07              mov ax,[bx]
000008FA  85C0              test ax,ax
000008FC  7402              jz 0x900
000008FE  FFD0              call ax
00000900  83C704            add di,byte +0x4
00000903  3BFE              cmp di,si
00000905  72F1              jc 0x8f8
00000907  5F                pop di
00000908  5E                pop si
00000909  C3                ret
0000090A  FF25              jmp word near [di]
0000090C  8820              mov [bx+si],ah
0000090E  40                inc ax
0000090F  008BFF55          add [bp+di+0x55ff],cl
00000913  8BEC              mov bp,sp
00000915  8B4D08            mov cx,[di+0x8]
00000918  B84D5A            mov ax,0x5a4d
0000091B  0000              add [bx+si],al
0000091D  663901            cmp [bx+di],eax
00000920  7404              jz 0x926
00000922  33C0              xor ax,ax
00000924  5D                pop bp
00000925  C3                ret
00000926  8B413C            mov ax,[bx+di+0x3c]
00000929  03C1              add ax,cx
0000092B  81385045          cmp word [bx+si],0x4550
0000092F  0000              add [bx+si],al
00000931  75EF              jnz 0x922
00000933  33D2              xor dx,dx
00000935  B90B01            mov cx,0x10b
00000938  0000              add [bx+si],al
0000093A  66394818          cmp [bx+si+0x18],ecx
0000093E  0F94C2            setz dl
00000941  8BC2              mov ax,dx
00000943  5D                pop bp
00000944  C3                ret
00000945  CC                int3
00000946  CC                int3
00000947  CC                int3
00000948  CC                int3
00000949  CC                int3
0000094A  CC                int3
0000094B  CC                int3
0000094C  CC                int3
0000094D  CC                int3
0000094E  CC                int3
0000094F  CC                int3
00000950  8BFF              mov di,di
00000952  55                push bp
00000953  8BEC              mov bp,sp
00000955  8B4508            mov ax,[di+0x8]
00000958  8B483C            mov cx,[bx+si+0x3c]
0000095B  03C8              add cx,ax
0000095D  0F                db 0x0f
0000095E  B741              mov bh,0x41
00000960  1453              adc al,0x53
00000962  56                push si
00000963  0F                db 0x0f
00000964  B771              mov bh,0x71
00000966  06                push es
00000967  33D2              xor dx,dx
00000969  57                push di
0000096A  8D4408            lea ax,[si+0x8]
0000096D  1885F674          sbb [di+0x74f6],al
00000971  1B8B7D0C          sbb cx,[bp+di+0xc7d]
00000975  8B480C            mov cx,[bx+si+0xc]
00000978  3BF9              cmp di,cx
0000097A  7209              jc 0x985
0000097C  8B5808            mov bx,[bx+si+0x8]
0000097F  03D9              add bx,cx
00000981  3BFB              cmp di,bx
00000983  720A              jc 0x98f
00000985  42                inc dx
00000986  83C028            add ax,byte +0x28
00000989  3BD6              cmp dx,si
0000098B  72E8              jc 0x975
0000098D  33C0              xor ax,ax
0000098F  5F                pop di
00000990  5E                pop si
00000991  5B                pop bx
00000992  5D                pop bp
00000993  C3                ret
00000994  CC                int3
00000995  CC                int3
00000996  CC                int3
00000997  CC                int3
00000998  CC                int3
00000999  CC                int3
0000099A  CC                int3
0000099B  CC                int3
0000099C  CC                int3
0000099D  CC                int3
0000099E  CC                int3
0000099F  CC                int3
000009A0  8BFF              mov di,di
000009A2  55                push bp
000009A3  8BEC              mov bp,sp
000009A5  6AFE              push byte -0x2
000009A7  680822            push word 0x2208
000009AA  40                inc ax
000009AB  0068C9            add [bx+si-0x37],ch
000009AE  16                push ss
000009AF  40                inc ax
000009B0  0064A1            add [si-0x5f],ah
000009B3  0000              add [bx+si],al
000009B5  0000              add [bx+si],al
000009B7  50                push ax
000009B8  83EC08            sub sp,byte +0x8
000009BB  53                push bx
000009BC  56                push si
000009BD  57                push di
000009BE  A10030            mov ax,[0x3000]
000009C1  40                inc ax
000009C2  0031              add [bx+di],dh
000009C4  45                inc bp
000009C5  F8                clc
000009C6  33C5              xor ax,bp
000009C8  50                push ax
000009C9  8D45F0            lea ax,[di-0x10]
000009CC  64A30000          mov [fs:0x0],ax
000009D0  0000              add [bx+si],al
000009D2  8965E8            mov [di-0x18],sp
000009D5  C745FC0000        mov word [di-0x4],0x0
000009DA  0000              add [bx+si],al
000009DC  680000            push word 0x0
000009DF  40                inc ax
000009E0  00E8              add al,ch
000009E2  2AFF              sub bh,bh
000009E4  FF                db 0xff
000009E5  FF83C404          inc word [bp+di+0x4c4]
000009E9  85C0              test ax,ax
000009EB  7454              jz 0xa41
000009ED  8B4508            mov ax,[di+0x8]
000009F0  2D0000            sub ax,0x0
000009F3  40                inc ax
000009F4  005068            add [bx+si+0x68],dl
000009F7  0000              add [bx+si],al
000009F9  40                inc ax
000009FA  00E8              add al,ch
000009FC  50                push ax
000009FD  FF                db 0xff
000009FE  FF                db 0xff
000009FF  FF83C408          inc word [bp+di+0x8c4]
00000A03  85C0              test ax,ax
00000A05  743A              jz 0xa41
00000A07  8B4024            mov ax,[bx+si+0x24]
00000A0A  C1E81F            shr ax,0x1f
00000A0D  F7D0              not ax
00000A0F  83E001            and ax,byte +0x1
00000A12  C745FCFEFF        mov word [di-0x4],0xfffe
00000A17  FF                db 0xff
00000A18  FF8B4DF0          dec word [bp+di-0xfb3]
00000A1C  64890D            mov [fs:di],cx
00000A1F  0000              add [bx+si],al
00000A21  0000              add [bx+si],al
00000A23  59                pop cx
00000A24  5F                pop di
00000A25  5E                pop si
00000A26  5B                pop bx
00000A27  8BE5              mov sp,bp
00000A29  5D                pop bp
00000A2A  C3                ret
00000A2B  8B45EC            mov ax,[di-0x14]
00000A2E  8B08              mov cx,[bx+si]
00000A30  33D2              xor dx,dx
00000A32  81390500          cmp word [bx+di],0x5
00000A36  00C0              add al,al
00000A38  0F94C2            setz dl
00000A3B  8BC2              mov ax,dx
00000A3D  C3                ret
00000A3E  8B65E8            mov sp,[di-0x18]
00000A41  C745FCFEFF        mov word [di-0x4],0xfffe
00000A46  FF                db 0xff
00000A47  FF33              push word [bp+di]
00000A49  C08B4DF064        ror byte [bp+di-0xfb3],0x64
00000A4E  890D              mov [di],cx
00000A50  0000              add [bx+si],al
00000A52  0000              add [bx+si],al
00000A54  59                pop cx
00000A55  5F                pop di
00000A56  5E                pop si
00000A57  5B                pop bx
00000A58  8BE5              mov sp,bp
00000A5A  5D                pop bp
00000A5B  C3                ret
00000A5C  FF25              jmp word near [di]
00000A5E  7C20              jl 0xa80
00000A60  40                inc ax
00000A61  00FF              add bh,bh
00000A63  257820            and ax,0x2078
00000A66  40                inc ax
00000A67  00CC              add ah,cl
00000A69  CC                int3
00000A6A  CC                int3
00000A6B  CC                int3
00000A6C  CC                int3
00000A6D  CC                int3
00000A6E  CC                int3
00000A6F  CC                int3
00000A70  68C916            push word 0x16c9
00000A73  40                inc ax
00000A74  0064FF            add [si-0x1],ah
00000A77  350000            xor ax,0x0
00000A7A  0000              add [bx+si],al
00000A7C  8B4424            mov ax,[si+0x24]
00000A7F  10896C24          adc [bx+di+0x246c],cl
00000A83  108D6C24          adc [di+0x246c],cl
00000A87  102B              adc [bp+di],ch
00000A89  E053              loopne 0xade
00000A8B  56                push si
00000A8C  57                push di
00000A8D  A10030            mov ax,[0x3000]
00000A90  40                inc ax
00000A91  0031              add [bx+di],dh
00000A93  45                inc bp
00000A94  FC                cld
00000A95  33C5              xor ax,bp
00000A97  50                push ax
00000A98  8965E8            mov [di-0x18],sp
00000A9B  FF75F8            push word [di-0x8]
00000A9E  8B45FC            mov ax,[di-0x4]
00000AA1  C745FCFEFF        mov word [di-0x4],0xfffe
00000AA6  FF                db 0xff
00000AA7  FF8945F8          dec word [bx+di-0x7bb]
00000AAB  8D45F0            lea ax,[di-0x10]
00000AAE  64A30000          mov [fs:0x0],ax
00000AB2  0000              add [bx+si],al
00000AB4  C3                ret
00000AB5  8B4DF0            mov cx,[di-0x10]
00000AB8  64890D            mov [fs:di],cx
00000ABB  0000              add [bx+si],al
00000ABD  0000              add [bx+si],al
00000ABF  59                pop cx
00000AC0  5F                pop di
00000AC1  5F                pop di
00000AC2  5E                pop si
00000AC3  5B                pop bx
00000AC4  8BE5              mov sp,bp
00000AC6  5D                pop bp
00000AC7  51                push cx
00000AC8  C3                ret
00000AC9  8BFF              mov di,di
00000ACB  55                push bp
00000ACC  8BEC              mov bp,sp
00000ACE  FF7514            push word [di+0x14]
00000AD1  FF7510            push word [di+0x10]
00000AD4  FF750C            push word [di+0xc]
00000AD7  FF7508            push word [di+0x8]
00000ADA  680310            push word 0x1003
00000ADD  40                inc ax
00000ADE  006800            add [bx+si+0x0],ch
00000AE1  304000            xor [bx+si+0x0],al
00000AE4  E8E900            call word 0xbd0
00000AE7  0000              add [bx+si],al
00000AE9  83C418            add sp,byte +0x18
00000AEC  5D                pop bp
00000AED  C3                ret
00000AEE  8BFF              mov di,di
00000AF0  56                push si
00000AF1  680000            push word 0x0
00000AF4  0300              add ax,[bx+si]
00000AF6  680000            push word 0x0
00000AF9  0100              add [bx+si],ax
00000AFB  33F6              xor si,si
00000AFD  56                push si
00000AFE  E8DB00            call word 0xbdc
00000B01  0000              add [bx+si],al
00000B03  83C40C            add sp,byte +0xc
00000B06  85C0              test ax,ax
00000B08  740A              jz 0xb14
00000B0A  56                push si
00000B0B  56                push si
00000B0C  56                push si
00000B0D  56                push si
00000B0E  56                push si
00000B0F  E8C400            call word 0xbd6
00000B12  0000              add [bx+si],al
00000B14  5E                pop si
00000B15  C3                ret
00000B16  33C0              xor ax,ax
00000B18  C3                ret
00000B19  8BFF              mov di,di
00000B1B  55                push bp
00000B1C  8BEC              mov bp,sp
00000B1E  83EC10            sub sp,byte +0x10
00000B21  A10030            mov ax,[0x3000]
00000B24  40                inc ax
00000B25  008365F8          add [bp+di-0x79b],al
00000B29  008365FC          add [bp+di-0x39b],al
00000B2D  005357            add [bp+di+0x57],dl
00000B30  BF4EE6            mov di,0xe64e
00000B33  40                inc ax
00000B34  BBBB00            mov bx,0xbb
00000B37  00FF              add bh,bh
00000B39  FF                db 0xff
00000B3A  3BC7              cmp ax,di
00000B3C  740D              jz 0xb4b
00000B3E  85C3              test bx,ax
00000B40  7409              jz 0xb4b
00000B42  F7D0              not ax
00000B44  A30430            mov [0x3004],ax
00000B47  40                inc ax
00000B48  00EB              add bl,ch
00000B4A  6556              gs push si
00000B4C  8D45F8            lea ax,[di-0x8]
00000B4F  50                push ax
00000B50  FF15              call word near [di]
00000B52  3C20              cmp al,0x20
00000B54  40                inc ax
00000B55  008B75FC          add [bp+di-0x38b],cl
00000B59  3375F8            xor si,[di-0x8]
00000B5C  FF15              call word near [di]
00000B5E  0020              add [bx+si],ah
00000B60  40                inc ax
00000B61  0033              add [bp+di],dh
00000B63  F0FF15            lock call word near [di]
00000B66  0420              add al,0x20
00000B68  40                inc ax
00000B69  0033              add [bp+di],dh
00000B6B  F0FF15            lock call word near [di]
00000B6E  0820              or [bx+si],ah
00000B70  40                inc ax
00000B71  0033              add [bp+di],dh
00000B73  F08D45F0          lock lea ax,[di-0x10]
00000B77  50                push ax
00000B78  FF15              call word near [di]
00000B7A  0C20              or al,0x20
00000B7C  40                inc ax
00000B7D  008B45F4          add [bp+di-0xbbb],cl
00000B81  3345F0            xor ax,[di-0x10]
00000B84  33F0              xor si,ax
00000B86  3BF7              cmp si,di
00000B88  7507              jnz 0xb91
00000B8A  BE4FE6            mov si,0xe64f
00000B8D  40                inc ax
00000B8E  BBEB10            mov bx,0x10eb
00000B91  85F3              test bx,si
00000B93  750C              jnz 0xba1
00000B95  8BC6              mov ax,si
00000B97  0D1147            or ax,0x4711
00000B9A  0000              add [bx+si],al
00000B9C  C1E010            shl ax,0x10
00000B9F  0BF0              or si,ax
00000BA1  8935              mov [di],si
00000BA3  0030              add [bx+si],dh
00000BA5  40                inc ax
00000BA6  00F7              add bh,dh
00000BA8  D6                salc
00000BA9  8935              mov [di],si
00000BAB  0430              add al,0x30
00000BAD  40                inc ax
00000BAE  005E5F            add [bp+0x5f],bl
00000BB1  5B                pop bx
00000BB2  C9                leave
00000BB3  C3                ret
00000BB4  FF25              jmp word near [di]
00000BB6  60                pushaw
00000BB7  204000            and [bx+si+0x0],al
00000BBA  FF25              jmp word near [di]
00000BBC  5C                pop sp
00000BBD  204000            and [bx+si+0x0],al
00000BC0  FF25              jmp word near [di]
00000BC2  50                push ax
00000BC3  204000            and [bx+si+0x0],al
00000BC6  FF25              jmp word near [di]
00000BC8  44                inc sp
00000BC9  204000            and [bx+si+0x0],al
00000BCC  FF25              jmp word near [di]
00000BCE  48                dec ax
00000BCF  204000            and [bx+si+0x0],al
00000BD2  FF25              jmp word near [di]
00000BD4  98                cbw
00000BD5  204000            and [bx+si+0x0],al
00000BD8  FF25              jmp word near [di]
00000BDA  54                push sp
00000BDB  204000            and [bx+si+0x0],al
00000BDE  FF25              jmp word near [di]
00000BE0  58                pop ax
00000BE1  204000            and [bx+si+0x0],al
00000BE4  0000              add [bx+si],al
00000BE6  0000              add [bx+si],al
00000BE8  0000              add [bx+si],al
00000BEA  0000              add [bx+si],al
00000BEC  0000              add [bx+si],al
00000BEE  0000              add [bx+si],al
00000BF0  0000              add [bx+si],al
00000BF2  0000              add [bx+si],al
00000BF4  0000              add [bx+si],al
00000BF6  0000              add [bx+si],al
00000BF8  0000              add [bx+si],al
00000BFA  0000              add [bx+si],al
00000BFC  0000              add [bx+si],al
00000BFE  0000              add [bx+si],al
00000C00  8825              mov [di],ah
00000C02  0000              add [bx+si],al
00000C04  7225              jc 0xc2b
00000C06  0000              add [bx+si],al
00000C08  6225              bound sp,[di]
00000C0A  0000              add [bx+si],al
00000C0C  48                dec ax
00000C0D  250000            and ax,0x0
00000C10  3825              cmp [di],ah
00000C12  0000              add [bx+si],al
00000C14  2425              and al,0x25
00000C16  0000              add [bx+si],al
00000C18  06                push es
00000C19  250000            and ax,0x0
00000C1C  EA240000D6        jmp word 0xd600:0x24
00000C21  2400              and al,0x0
00000C23  00C2              add dl,al
00000C25  2400              and al,0x0
00000C27  00B22400          add [bp+si+0x24],dh
00000C2B  009C2400          add [si+0x24],bl
00000C2F  007E24            add [bp+0x24],bh
00000C32  0000              add [bx+si],al
00000C34  7624              jna 0xc5a
00000C36  0000              add [bx+si],al
00000C38  60                pushaw
00000C39  2400              and al,0x0
00000C3B  009E2500          add [bp+0x25],bl
00000C3F  0000              add [bx+si],al
00000C41  0000              add [bx+si],al
00000C43  0004              add [si],al
00000C45  2400              and al,0x0
00000C47  0012              add [bp+si],dl
00000C49  2400              and al,0x0
00000C4B  001A              add [bp+si],bl
00000C4D  2400              and al,0x0
00000C4F  00FA              add dl,bh
00000C51  2300              and ax,[bx+si]
00000C53  003E2400          add [0x24],bh
00000C57  005024            add [bx+si+0x24],dl
00000C5A  0000              add [bx+si],al
00000C5C  D823              fsub dword [bp+di]
00000C5E  0000              add [bx+si],al
00000C60  C22300            ret 0x23
00000C63  00B02300          add [bx+si+0x23],dh
00000C67  00A62300          add [bp+0x23],ah
00000C6B  009A2300          add [bp+si+0x23],bl
00000C6F  00862300          add [bp+0x23],al
00000C73  007023            add [bx+si+0x23],dh
00000C76  0000              add [bx+si],al
00000C78  6223              bound sp,[bp+di]
00000C7A  0000              add [bx+si],al
00000C7C  56                push si
00000C7D  2300              and ax,[bx+si]
00000C7F  004A23            add [bp+si+0x23],cl
00000C82  0000              add [bx+si],al
00000C84  42                inc dx
00000C85  2300              and ax,[bx+si]
00000C87  0034              add [si],dh
00000C89  2300              and ax,[bx+si]
00000C8B  002C              add [si],ch
00000C8D  2300              and ax,[bx+si]
00000C8F  0022              add [bp+si],ah
00000C91  2300              and ax,[bx+si]
00000C93  0012              add [bp+si],dl
00000C95  2300              and ax,[bx+si]
00000C97  0024              add [si],ah
00000C99  2400              and al,0x0
00000C9B  0004              add [si],al
00000C9D  2300              and ax,[bx+si]
00000C9F  0000              add [bx+si],al
00000CA1  0000              add [bx+si],al
00000CA3  0000              add [bx+si],al
00000CA5  0000              add [bx+si],al
00000CA7  0012              add [bp+si],dl
00000CA9  104000            adc [bx+si+0x0],al
00000CAC  0000              add [bx+si],al
00000CAE  0000              add [bx+si],al
00000CB0  0000              add [bx+si],al
00000CB2  0000              add [bx+si],al
00000CB4  E611              out 0x11,al
00000CB6  40                inc ax
00000CB7  00F2              add dl,dh
00000CB9  134000            adc ax,[bx+si+0x0]
00000CBC  0000              add [bx+si],al
00000CBE  0000              add [bx+si],al
00000CC0  0000              add [bx+si],al
00000CC2  0000              add [bx+si],al
00000CC4  F1                int1
00000CC5  9D                popfw
00000CC6  844E00            test [bp+0x0],cl
00000CC9  0000              add [bx+si],al
00000CCB  0002              add [bp+si],al
00000CCD  0000              add [bx+si],al
00000CCF  00800000          add [bx+si+0x0],al
00000CD3  0030              add [bx+si],dh
00000CD5  2100              and [bx+si],ax
00000CD7  0030              add [bx+si],dh
00000CD9  0D0000            or ax,0x0
00000CDC  3830              cmp [bx+si],dh
00000CDE  40                inc ax
00000CDF  00903040          add [bx+si+0x4030],dl
00000CE3  0000              add [bx+si],al
00000CE5  0000              add [bx+si],al
00000CE7  004800            add [bx+si+0x0],cl
00000CEA  0000              add [bx+si],al
00000CEC  0000              add [bx+si],al
00000CEE  0000              add [bx+si],al
00000CF0  0000              add [bx+si],al
00000CF2  0000              add [bx+si],al
00000CF4  0000              add [bx+si],al
00000CF6  0000              add [bx+si],al
00000CF8  0000              add [bx+si],al
00000CFA  0000              add [bx+si],al
00000CFC  0000              add [bx+si],al
00000CFE  0000              add [bx+si],al
00000D00  0000              add [bx+si],al
00000D02  0000              add [bx+si],al
00000D04  0000              add [bx+si],al
00000D06  0000              add [bx+si],al
00000D08  0000              add [bx+si],al
00000D0A  0000              add [bx+si],al
00000D0C  0000              add [bx+si],al
00000D0E  0000              add [bx+si],al
00000D10  0000              add [bx+si],al
00000D12  0000              add [bx+si],al
00000D14  0000              add [bx+si],al
00000D16  0000              add [bx+si],al
00000D18  0000              add [bx+si],al
00000D1A  0000              add [bx+si],al
00000D1C  0000              add [bx+si],al
00000D1E  0000              add [bx+si],al
00000D20  0000              add [bx+si],al
00000D22  0000              add [bx+si],al
00000D24  0030              add [bx+si],dh
00000D26  40                inc ax
00000D27  00B02140          add [bx+si+0x4021],dh
00000D2B  0001              add [bx+di],al
00000D2D  0000              add [bx+si],al
00000D2F  005253            add [bp+si+0x53],dl
00000D32  44                inc sp
00000D33  53                push bx
00000D34  91                xchg ax,cx
00000D35  BFB47D            mov di,0x7db4
00000D38  C6                db 0xc6
00000D39  A4                movsb
00000D3A  8A45B4            mov al,[di-0x4c]
00000D3D  57                push di
00000D3E  34FD              xor al,0xfd
00000D40  8A4467            mov al,[si+0x67]
00000D43  93                xchg ax,bx
00000D44  050000            add ax,0x0
00000D47  00433A            add [bp+di+0x3a],al
00000D4A  5C                pop sp
00000D4B  637967            arpl [bx+di+0x67],di
00000D4E  7769              ja 0xdb9
00000D50  6E                outsb
00000D51  5C                pop sp
00000D52  686F6D            push word 0x6d6f
00000D55  655C              gs pop sp
00000D57  7072              jo 0xdcb
00000D59  6F                outsw
00000D5A  746F              jz 0xdcb
00000D5C  7479              jz 0xdd7
00000D5E  7065              jo 0xdc5
00000D60  5C                pop sp
00000D61  7265              jc 0xdc8
00000D63  706F              jo 0xdd4
00000D65  735C              jnc 0xdc3
00000D67  7363              jnc 0xdcc
00000D69  686F6F            push word 0x6f6f
00000D6C  6C                insb
00000D6D  776F              ja 0xdde
00000D6F  726B              jc 0xddc
00000D71  5C                pop sp
00000D72  636F6D            arpl [bx+0x6d],bp
00000D75  702D              jo 0xda4
00000D77  6F                outsw
00000D78  7267              jc 0xde1
00000D7A  5C                pop sp
00000D7B  7072              jo 0xdef
00000D7D  6F                outsw
00000D7E  6A65              push byte +0x65
00000D80  637473            arpl [si+0x73],si
00000D83  5C                pop sp
00000D84  61                popaw
00000D85  64647265          fs jc 0xdee
00000D89  7373              jnc 0xdfe
00000D8B  5F                pop di
00000D8C  7072              jo 0xe00
00000D8E  6F                outsw
00000D8F  6A65              push byte +0x65
00000D91  63745C            arpl [si+0x5c],si
00000D94  52                push dx
00000D95  656C              gs insb
00000D97  6561              gs popaw
00000D99  7365              jnc 0xe00
00000D9B  5C                pop sp
00000D9C  61                popaw
00000D9D  64647265          fs jc 0xe06
00000DA1  7373              jnc 0xe16
00000DA3  5F                pop di
00000DA4  7072              jo 0xe18
00000DA6  6F                outsw
00000DA7  6A65              push byte +0x65
00000DA9  63742E            arpl [si+0x2e],si
00000DAC  7064              jo 0xe12
00000DAE  6200              bound ax,[bx+si]
00000DB0  C9                leave
00000DB1  16                push ss
00000DB2  0000              add [bx+si],al
00000DB4  0000              add [bx+si],al
00000DB6  0000              add [bx+si],al
00000DB8  0000              add [bx+si],al
00000DBA  0000              add [bx+si],al
00000DBC  0000              add [bx+si],al
00000DBE  0000              add [bx+si],al
00000DC0  0000              add [bx+si],al
00000DC2  0000              add [bx+si],al
00000DC4  0000              add [bx+si],al
00000DC6  0000              add [bx+si],al
00000DC8  FE                db 0xfe
00000DC9  FF                db 0xff
00000DCA  FF                db 0xff
00000DCB  FF00              inc word [bx+si]
00000DCD  0000              add [bx+si],al
00000DCF  00D0              add al,dl
00000DD1  FF                db 0xff
00000DD2  FF                db 0xff
00000DD3  FF00              inc word [bx+si]
00000DD5  0000              add [bx+si],al
00000DD7  00FE              add dh,bh
00000DD9  FF                db 0xff
00000DDA  FF                db 0xff
00000DDB  FF961140          call word near [bp+0x4011]
00000DDF  00AA1140          add [bp+si+0x4011],ch
00000DE3  0000              add [bx+si],al
00000DE5  0000              add [bx+si],al
00000DE7  00FE              add dh,bh
00000DE9  FF                db 0xff
00000DEA  FF                db 0xff
00000DEB  FF00              inc word [bx+si]
00000DED  0000              add [bx+si],al
00000DEF  00CC              add ah,cl
00000DF1  FF                db 0xff
00000DF2  FF                db 0xff
00000DF3  FF00              inc word [bx+si]
00000DF5  0000              add [bx+si],al
00000DF7  00FE              add dh,bh
00000DF9  FF                db 0xff
00000DFA  FF                db 0xff
00000DFB  FF00              inc word [bx+si]
00000DFD  0000              add [bx+si],al
00000DFF  009E1440          add [bp+0x4014],bl
00000E03  0000              add [bx+si],al
00000E05  0000              add [bx+si],al
00000E07  00FE              add dh,bh
00000E09  FF                db 0xff
00000E0A  FF                db 0xff
00000E0B  FF00              inc word [bx+si]
00000E0D  0000              add [bx+si],al
00000E0F  00D8              add al,bl
00000E11  FF                db 0xff
00000E12  FF                db 0xff
00000E13  FF00              inc word [bx+si]
00000E15  0000              add [bx+si],al
00000E17  00FE              add dh,bh
00000E19  FF                db 0xff
00000E1A  FF                db 0xff
00000E1B  FF2B              jmp word far [bp+di]
00000E1D  16                push ss
00000E1E  40                inc ax
00000E1F  003E1640          add [0x4016],bh
00000E23  00A42200          add [si+0x22],ah
00000E27  0000              add [bx+si],al
00000E29  0000              add [bx+si],al
00000E2B  0000              add [bx+si],al
00000E2D  0000              add [bx+si],al
00000E2F  00EC              add ah,ch
00000E31  2300              and ax,[bx+si]
00000E33  004420            add [si+0x20],al
00000E36  0000              add [bx+si],al
00000E38  60                pushaw
00000E39  2200              and al,[bx+si]
00000E3B  0000              add [bx+si],al
00000E3D  0000              add [bx+si],al
00000E3F  0000              add [bx+si],al
00000E41  0000              add [bx+si],al
00000E43  00B82500          add [bx+si+0x25],bh
00000E47  0000              add [bx+si],al
00000E49  2000              and [bx+si],al
00000E4B  0000              add [bx+si],al
00000E4D  0000              add [bx+si],al
00000E4F  0000              add [bx+si],al
00000E51  0000              add [bx+si],al
00000E53  0000              add [bx+si],al
00000E55  0000              add [bx+si],al
00000E57  0000              add [bx+si],al
00000E59  0000              add [bx+si],al
00000E5B  0000              add [bx+si],al
00000E5D  0000              add [bx+si],al
00000E5F  00882500          add [bx+si+0x25],cl
00000E63  007225            add [bp+si+0x25],dh
00000E66  0000              add [bx+si],al
00000E68  6225              bound sp,[di]
00000E6A  0000              add [bx+si],al
00000E6C  48                dec ax
00000E6D  250000            and ax,0x0
00000E70  3825              cmp [di],ah
00000E72  0000              add [bx+si],al
00000E74  2425              and al,0x25
00000E76  0000              add [bx+si],al
00000E78  06                push es
00000E79  250000            and ax,0x0
00000E7C  EA240000D6        jmp word 0xd600:0x24
00000E81  2400              and al,0x0
00000E83  00C2              add dl,al
00000E85  2400              and al,0x0
00000E87  00B22400          add [bp+si+0x24],dh
00000E8B  009C2400          add [si+0x24],bl
00000E8F  007E24            add [bp+0x24],bh
00000E92  0000              add [bx+si],al
00000E94  7624              jna 0xeba
00000E96  0000              add [bx+si],al
00000E98  60                pushaw
00000E99  2400              and al,0x0
00000E9B  009E2500          add [bp+0x25],bl
00000E9F  0000              add [bx+si],al
00000EA1  0000              add [bx+si],al
00000EA3  0004              add [si],al
00000EA5  2400              and al,0x0
00000EA7  0012              add [bp+si],dl
00000EA9  2400              and al,0x0
00000EAB  001A              add [bp+si],bl
00000EAD  2400              and al,0x0
00000EAF  00FA              add dl,bh
00000EB1  2300              and ax,[bx+si]
00000EB3  003E2400          add [0x24],bh
00000EB7  005024            add [bx+si+0x24],dl
00000EBA  0000              add [bx+si],al
00000EBC  D823              fsub dword [bp+di]
00000EBE  0000              add [bx+si],al
00000EC0  C22300            ret 0x23
00000EC3  00B02300          add [bx+si+0x23],dh
00000EC7  00A62300          add [bp+0x23],ah
00000ECB  009A2300          add [bp+si+0x23],bl
00000ECF  00862300          add [bp+0x23],al
00000ED3  007023            add [bx+si+0x23],dh
00000ED6  0000              add [bx+si],al
00000ED8  6223              bound sp,[bp+di]
00000EDA  0000              add [bx+si],al
00000EDC  56                push si
00000EDD  2300              and ax,[bx+si]
00000EDF  004A23            add [bp+si+0x23],cl
00000EE2  0000              add [bx+si],al
00000EE4  42                inc dx
00000EE5  2300              and ax,[bx+si]
00000EE7  0034              add [si],dh
00000EE9  2300              and ax,[bx+si]
00000EEB  002C              add [si],ch
00000EED  2300              and ax,[bx+si]
00000EEF  0022              add [bp+si],ah
00000EF1  2300              and ax,[bx+si]
00000EF3  0012              add [bp+si],dl
00000EF5  2300              and ax,[bx+si]
00000EF7  0024              add [si],ah
00000EF9  2400              and al,0x0
00000EFB  0004              add [si],al
00000EFD  2300              and ax,[bx+si]
00000EFF  0000              add [bx+si],al
00000F01  0000              add [bx+si],al
00000F03  00C5              add ch,al
00000F05  015F61            add [bx+0x61],bx
00000F08  6D                insw
00000F09  7367              jnc 0xf72
00000F0B  5F                pop di
00000F0C  657869            gs js 0xf78
00000F0F  7400              jz 0xf11
00000F11  006301            add [bp+di+0x1],ah
00000F14  5F                pop di
00000F15  5F                pop di
00000F16  6765746D          gs jz 0xf87
00000F1A  61                popaw
00000F1B  696E617267        imul bp,[bp+0x61],word 0x6772
00000F20  7300              jnc 0xf22
00000F22  DC01              fadd qword [bx+di]
00000F24  5F                pop di
00000F25  636578            arpl [di+0x78],sp
00000F28  697400002A        imul si,[si+0x0],word 0x2a00
00000F2D  025F65            add bl,[bx+0x65]
00000F30  7869              js 0xf9b
00000F32  7400              jz 0xf34
00000F34  2D015F            sub ax,0x5f01
00000F37  58                pop ax
00000F38  637074            arpl [bx+si+0x74],si
00000F3B  46                inc si
00000F3C  696C746572        imul bp,[si+0x74],word 0x7265
00000F41  007305            add [bp+di+0x5],dh
00000F44  657869            gs js 0xfb0
00000F47  7400              jz 0xf49
00000F49  006401            add [si+0x1],ah
00000F4C  5F                pop di
00000F4D  5F                pop di
00000F4E  696E697465        imul bp,[bp+0x69],word 0x6574
00000F53  6E                outsb
00000F54  7600              jna 0xf56
00000F56  B002              mov al,0x2
00000F58  5F                pop di
00000F59  696E697474        imul bp,[bp+0x69],word 0x7474
00000F5E  65726D            gs jc 0xfce
00000F61  00B1025F          add [bx+di+0x5f02],dh
00000F65  696E697474        imul bp,[bp+0x69],word 0x7474
00000F6A  65726D            gs jc 0xfda
00000F6D  5F                pop di
00000F6E  6500EC            gs add ah,ch
00000F71  015F63            add [bx+0x63],bx
00000F74  6F                outsw
00000F75  6E                outsb
00000F76  6669677468726561  imul esp,[bx+0x74],dword 0x61657268
00000F7E  646C              fs insb
00000F80  6F                outsw
00000F81  63616C            arpl [bx+di+0x6c],sp
00000F84  6500A2015F        add [gs:bp+si+0x5f01],ah
00000F89  5F                pop di
00000F8A  7365              jnc 0xff1
00000F8C  7475              jz 0x1003
00000F8E  7365              jnc 0xff5
00000F90  726D              jc 0xfff
00000F92  61                popaw
00000F93  7468              jz 0xffd
00000F95  657272            gs jc 0x100a
00000F98  0000              add [bx+si],al
00000F9A  EB01              jmp short 0xf9d
00000F9C  5F                pop di
00000F9D  636F6D            arpl [bx+0x6d],bp
00000FA0  6D                insw
00000FA1  6F                outsw
00000FA2  64650000          add [gs:bx+si],al
00000FA6  45                inc bp
00000FA7  025F66            add bl,[bx+0x66]
00000FAA  6D                insw
00000FAB  6F                outsw
00000FAC  64650000          add [gs:bx+si],al
00000FB0  9F                lahf
00000FB1  015F5F            add [bx+0x5f],bx
00000FB4  7365              jnc 0x101b
00000FB6  745F              jz 0x1017
00000FB8  61                popaw
00000FB9  7070              jo 0x102b
00000FBB  5F                pop di
00000FBC  7479              jz 0x1037
00000FBE  7065              jo 0x1025
00000FC0  0000              add [bx+si],al
00000FC2  FB                sti
00000FC3  015F63            add [bx+0x63],bx
00000FC6  7274              jc 0x103c
00000FC8  5F                pop di
00000FC9  6465627567        bound si,[gs:di+0x67]
00000FCE  6765725F          gs jc 0x1031
00000FD2  686F6F            push word 0x6f6f
00000FD5  6B0000            imul ax,[bx+si],byte +0x0
00000FD8  0201              add al,[bx+di]
00000FDA  3F                aas
00000FDB  7465              jz 0x1042
00000FDD  726D              jc 0x104c
00000FDF  696E617465        imul bp,[bp+0x61],word 0x6574
00000FE4  40                inc ax
00000FE5  40                inc ax
00000FE6  59                pop cx
00000FE7  41                inc cx
00000FE8  58                pop ax
00000FE9  58                pop ax
00000FEA  5A                pop dx
00000FEB  004D53            add [di+0x53],cl
00000FEE  56                push si
00000FEF  43                inc bx
00000FF0  52                push dx
00000FF1  3130              xor [bx+si],si
00000FF3  302E646C          xor [0x6c64],ch
00000FF7  6C                insb
00000FF8  0000              add [bx+si],al
00000FFA  8D04              lea ax,[si]
00000FFC  5F                pop di
00000FFD  756E              jnz 0x106d
00000FFF  6C                insb
00001000  6F                outsw
00001001  636B00            arpl [bp+di+0x0],bp
00001004  5B                pop bx
00001005  015F5F            add [bx+0x5f],bx
00001008  646C              fs insb
0000100A  6C                insb
0000100B  6F                outsw
0000100C  6E                outsb
0000100D  657869            gs js 0x1079
00001010  7400              jz 0x1012
00001012  2303              and ax,[bp+di]
00001014  5F                pop di
00001015  6C                insb
00001016  6F                outsw
00001017  636B00            arpl [bp+di+0x0],bp
0000101A  C9                leave
0000101B  035F6F            add bx,[bx+0x6f]
0000101E  6E                outsb
0000101F  657869            gs js 0x108b
00001022  7400              jz 0x1024
00001024  2102              and [bp+si],ax
00001026  5F                pop di
00001027  657863            gs js 0x108d
0000102A  657074            gs jo 0x10a1
0000102D  5F                pop di
0000102E  68616E            push word 0x6e61
00001031  646C              fs insb
00001033  657234            gs jc 0x106a
00001036  5F                pop di
00001037  636F6D            arpl [bx+0x6d],bp
0000103A  6D                insw
0000103B  6F                outsw
0000103C  6E                outsb
0000103D  00B8025F          add [bx+si+0x5f02],bh
00001041  696E766F6B        imul bp,[bp+0x76],word 0x6b6f
00001046  655F              gs pop di
00001048  7761              ja 0x10ab
0000104A  7473              jz 0x10bf
0000104C  6F                outsw
0000104D  6E                outsb
0000104E  0000              add [bx+si],al
00001050  EF                out dx,ax
00001051  015F63            add [bx+0x63],bx
00001054  6F                outsw
00001055  6E                outsb
00001056  7472              jz 0x10ca
00001058  6F                outsw
00001059  6C                insb
0000105A  66705F            o32 jo 0x10bc
0000105D  7300              jnc 0x105f
0000105F  00EC              add ah,ch
00001061  02496E            add cl,[bx+di+0x6e]
00001064  7465              jz 0x10cb
00001066  726C              jc 0x10d4
00001068  6F                outsw
00001069  636B65            arpl [bp+di+0x65],bp
0000106C  6445              fs inc bp
0000106E  7863              js 0x10d3
00001070  68616E            push word 0x6e61
00001073  676500B204536C65  add [gs:edx+0x656c5304],dh
0000107B  657000            gs jo 0x107e
0000107E  E90249            jmp word 0x5983
00001081  6E                outsb
00001082  7465              jz 0x10e9
00001084  726C              jc 0x10f2
00001086  6F                outsw
00001087  636B65            arpl [bp+di+0x65],bp
0000108A  6443              fs inc bx
0000108C  6F                outsw
0000108D  6D                insw
0000108E  7061              jo 0x10f1
00001090  7265              jc 0x10f7
00001092  45                inc bp
00001093  7863              js 0x10f8
00001095  68616E            push word 0x6e61
00001098  67650000          add [gs:eax],al
0000109C  D302              rol word [bp+si],cl
0000109E  48                dec ax
0000109F  6561              gs popaw
000010A1  7053              jo 0x10f6
000010A3  657449            gs jz 0x10ef
000010A6  6E                outsb
000010A7  666F              outsd
000010A9  726D              jc 0x1118
000010AB  61                popaw
000010AC  7469              jz 0x1117
000010AE  6F                outsw
000010AF  6E                outsb
000010B0  0000              add [bx+si],al
000010B2  EA00456E63        jmp word 0x636e:0x4500
000010B7  6F                outsw
000010B8  646550            gs push ax
000010BB  6F                outsw
000010BC  696E746572        imul bp,[bp+0x74],word 0x7265
000010C1  00C0              add al,al
000010C3  0454              add al,0x54
000010C5  65726D            gs jc 0x1135
000010C8  696E617465        imul bp,[bp+0x61],word 0x6574
000010CD  50                push ax
000010CE  726F              jc 0x113f
000010D0  636573            arpl [di+0x73],sp
000010D3  7300              jnc 0x10d5
000010D5  00C0              add al,al
000010D7  014765            add [bx+0x65],ax
000010DA  7443              jz 0x111f
000010DC  7572              jnz 0x1150
000010DE  7265              jc 0x1145
000010E0  6E                outsb
000010E1  7450              jz 0x1133
000010E3  726F              jc 0x1154
000010E5  636573            arpl [di+0x73],sp
000010E8  7300              jnc 0x10ea
000010EA  D304              rol word [si],cl
000010EC  55                push bp
000010ED  6E                outsb
000010EE  68616E            push word 0x6e61
000010F1  646C              fs insb
000010F3  656445            fs inc bp
000010F6  7863              js 0x115b
000010F8  657074            gs jo 0x116f
000010FB  696F6E4669        imul bp,[bx+0x6e],word 0x6946
00001100  6C                insb
00001101  7465              jz 0x1168
00001103  7200              jc 0x1105
00001105  00A50453          add [di+0x5304],ah
00001109  657455            gs jz 0x1161
0000110C  6E                outsb
0000110D  68616E            push word 0x6e61
00001110  646C              fs insb
00001112  656445            fs inc bp
00001115  7863              js 0x117a
00001117  657074            gs jo 0x118e
0000111A  696F6E4669        imul bp,[bx+0x6e],word 0x6946
0000111F  6C                insb
00001120  7465              jz 0x1187
00001122  7200              jc 0x1124
00001124  0003              add [bp+di],al
00001126  49                dec cx
00001127  7344              jnc 0x116d
00001129  65627567          bound si,[gs:di+0x67]
0000112D  67657250          gs jc 0x1181
00001131  7265              jc 0x1198
00001133  7365              jnc 0x119a
00001135  6E                outsb
00001136  7400              jz 0x1138
00001138  CA0044            retf 0x4400
0000113B  65636F64          arpl [gs:bx+0x64],bp
0000113F  6550              gs push ax
00001141  6F                outsw
00001142  696E746572        imul bp,[bp+0x74],word 0x7265
00001147  00A70351          add [bx+0x5103],ah
0000114B  7565              jnz 0x11b2
0000114D  7279              jc 0x11c8
0000114F  50                push ax
00001150  657266            gs jc 0x11b9
00001153  6F                outsw
00001154  726D              jc 0x11c3
00001156  61                popaw
00001157  6E                outsb
00001158  636543            arpl [di+0x43],sp
0000115B  6F                outsw
0000115C  756E              jnz 0x11cc
0000115E  7465              jz 0x11c5
00001160  7200              jc 0x1162
00001162  93                xchg ax,bx
00001163  024765            add al,[bx+0x65]
00001166  7454              jz 0x11bc
00001168  69636B436F        imul sp,[bp+di+0x6b],word 0x6f43
0000116D  756E              jnz 0x11dd
0000116F  7400              jz 0x1171
00001171  00C5              add ch,al
00001173  014765            add [bx+0x65],ax
00001176  7443              jz 0x11bb
00001178  7572              jnz 0x11ec
0000117A  7265              jc 0x11e1
0000117C  6E                outsb
0000117D  7454              jz 0x11d3
0000117F  687265            push word 0x6572
00001182  61                popaw
00001183  6449              fs dec cx
00001185  640000            add [fs:bx+si],al
00001188  C10147            rol word [bx+di],0x47
0000118B  657443            gs jz 0x11d1
0000118E  7572              jnz 0x1202
00001190  7265              jc 0x11f7
00001192  6E                outsb
00001193  7450              jz 0x11e5
00001195  726F              jc 0x1206
00001197  636573            arpl [di+0x73],sp
0000119A  7349              jnc 0x11e5
0000119C  64007902          add [fs:bx+di+0x2],bh
000011A0  47                inc di
000011A1  657453            gs jz 0x11f7
000011A4  7973              jns 0x1219
000011A6  7465              jz 0x120d
000011A8  6D                insw
000011A9  54                push sp
000011AA  696D654173        imul bp,[di+0x65],word 0x7341
000011AF  46                inc si
000011B0  696C655469        imul bp,[si+0x65],word 0x6954
000011B5  6D                insw
000011B6  65004B45          add [gs:bp+di+0x45],cl
000011BA  52                push dx
000011BB  4E                dec si
000011BC  45                inc bp
000011BD  4C                dec sp
000011BE  3332              xor si,[bp+si]
000011C0  2E646C            fs insb
000011C3  6C                insb
000011C4  0000              add [bx+si],al
000011C6  0000              add [bx+si],al
000011C8  0000              add [bx+si],al
000011CA  0000              add [bx+si],al
000011CC  0000              add [bx+si],al
000011CE  0000              add [bx+si],al
000011D0  0000              add [bx+si],al
000011D2  0000              add [bx+si],al
000011D4  0000              add [bx+si],al
000011D6  0000              add [bx+si],al
000011D8  0000              add [bx+si],al
000011DA  0000              add [bx+si],al
000011DC  0000              add [bx+si],al
000011DE  0000              add [bx+si],al
000011E0  0000              add [bx+si],al
000011E2  0000              add [bx+si],al
000011E4  0000              add [bx+si],al
000011E6  0000              add [bx+si],al
000011E8  0000              add [bx+si],al
000011EA  0000              add [bx+si],al
000011EC  0000              add [bx+si],al
000011EE  0000              add [bx+si],al
000011F0  0000              add [bx+si],al
000011F2  0000              add [bx+si],al
000011F4  0000              add [bx+si],al
000011F6  0000              add [bx+si],al
000011F8  0000              add [bx+si],al
000011FA  0000              add [bx+si],al
000011FC  0000              add [bx+si],al
000011FE  0000              add [bx+si],al
00001200  4E                dec si
00001201  E640              out 0x40,al
00001203  BBB119            mov bx,0x19b1
00001206  BF44FF            mov di,0xff44
00001209  FF                db 0xff
0000120A  FF                db 0xff
0000120B  FF                db 0xff
0000120C  FF                db 0xff
0000120D  FF                db 0xff
0000120E  FF                db 0xff
0000120F  FF                db 0xff
00001210  FE                db 0xfe
00001211  FF                db 0xff
00001212  FF                db 0xff
00001213  FF01              inc word [bx+di]
00001215  0000              add [bx+si],al
00001217  0000              add [bx+si],al
00001219  0000              add [bx+si],al
0000121B  0000              add [bx+si],al
0000121D  0000              add [bx+si],al
0000121F  0000              add [bx+si],al
00001221  0000              add [bx+si],al
00001223  0000              add [bx+si],al
00001225  0000              add [bx+si],al
00001227  0000              add [bx+si],al
00001229  0000              add [bx+si],al
0000122B  0000              add [bx+si],al
0000122D  0000              add [bx+si],al
0000122F  0000              add [bx+si],al
00001231  0000              add [bx+si],al
00001233  0000              add [bx+si],al
00001235  0000              add [bx+si],al
00001237  0000              add [bx+si],al
00001239  0000              add [bx+si],al
0000123B  0000              add [bx+si],al
0000123D  0000              add [bx+si],al
0000123F  0000              add [bx+si],al
00001241  0000              add [bx+si],al
00001243  0000              add [bx+si],al
00001245  0000              add [bx+si],al
00001247  0000              add [bx+si],al
00001249  0000              add [bx+si],al
0000124B  0000              add [bx+si],al
0000124D  0000              add [bx+si],al
0000124F  0000              add [bx+si],al
00001251  0000              add [bx+si],al
00001253  0000              add [bx+si],al
00001255  0000              add [bx+si],al
00001257  0000              add [bx+si],al
00001259  0000              add [bx+si],al
0000125B  0000              add [bx+si],al
0000125D  0000              add [bx+si],al
0000125F  0000              add [bx+si],al
00001261  0000              add [bx+si],al
00001263  0000              add [bx+si],al
00001265  0000              add [bx+si],al
00001267  0000              add [bx+si],al
00001269  0000              add [bx+si],al
0000126B  0000              add [bx+si],al
0000126D  0000              add [bx+si],al
0000126F  0000              add [bx+si],al
00001271  0000              add [bx+si],al
00001273  0000              add [bx+si],al
00001275  0000              add [bx+si],al
00001277  0000              add [bx+si],al
00001279  0000              add [bx+si],al
0000127B  0000              add [bx+si],al
0000127D  0000              add [bx+si],al
0000127F  0000              add [bx+si],al
00001281  0000              add [bx+si],al
00001283  0000              add [bx+si],al
00001285  0000              add [bx+si],al
00001287  0000              add [bx+si],al
00001289  0000              add [bx+si],al
0000128B  0000              add [bx+si],al
0000128D  0000              add [bx+si],al
0000128F  0000              add [bx+si],al
00001291  0000              add [bx+si],al
00001293  0000              add [bx+si],al
00001295  0000              add [bx+si],al
00001297  0000              add [bx+si],al
00001299  0000              add [bx+si],al
0000129B  0000              add [bx+si],al
0000129D  0000              add [bx+si],al
0000129F  0000              add [bx+si],al
000012A1  0000              add [bx+si],al
000012A3  0000              add [bx+si],al
000012A5  0000              add [bx+si],al
000012A7  0000              add [bx+si],al
000012A9  0000              add [bx+si],al
000012AB  0000              add [bx+si],al
000012AD  0000              add [bx+si],al
000012AF  0000              add [bx+si],al
000012B1  0000              add [bx+si],al
000012B3  0000              add [bx+si],al
000012B5  0000              add [bx+si],al
000012B7  0000              add [bx+si],al
000012B9  0000              add [bx+si],al
000012BB  0000              add [bx+si],al
000012BD  0000              add [bx+si],al
000012BF  0000              add [bx+si],al
000012C1  0000              add [bx+si],al
000012C3  0000              add [bx+si],al
000012C5  0000              add [bx+si],al
000012C7  0000              add [bx+si],al
000012C9  0000              add [bx+si],al
000012CB  0000              add [bx+si],al
000012CD  0000              add [bx+si],al
000012CF  0000              add [bx+si],al
000012D1  0000              add [bx+si],al
000012D3  0000              add [bx+si],al
000012D5  0000              add [bx+si],al
000012D7  0000              add [bx+si],al
000012D9  0000              add [bx+si],al
000012DB  0000              add [bx+si],al
000012DD  0000              add [bx+si],al
000012DF  0000              add [bx+si],al
000012E1  0000              add [bx+si],al
000012E3  0000              add [bx+si],al
000012E5  0000              add [bx+si],al
000012E7  0000              add [bx+si],al
000012E9  0000              add [bx+si],al
000012EB  0000              add [bx+si],al
000012ED  0000              add [bx+si],al
000012EF  0000              add [bx+si],al
000012F1  0000              add [bx+si],al
000012F3  0000              add [bx+si],al
000012F5  0000              add [bx+si],al
000012F7  0000              add [bx+si],al
000012F9  0000              add [bx+si],al
000012FB  0000              add [bx+si],al
000012FD  0000              add [bx+si],al
000012FF  0000              add [bx+si],al
00001301  0000              add [bx+si],al
00001303  0000              add [bx+si],al
00001305  0000              add [bx+si],al
00001307  0000              add [bx+si],al
00001309  0000              add [bx+si],al
0000130B  0000              add [bx+si],al
0000130D  0000              add [bx+si],al
0000130F  0000              add [bx+si],al
00001311  0000              add [bx+si],al
00001313  0000              add [bx+si],al
00001315  0000              add [bx+si],al
00001317  0000              add [bx+si],al
00001319  0000              add [bx+si],al
0000131B  0000              add [bx+si],al
0000131D  0000              add [bx+si],al
0000131F  0000              add [bx+si],al
00001321  0000              add [bx+si],al
00001323  0000              add [bx+si],al
00001325  0000              add [bx+si],al
00001327  0000              add [bx+si],al
00001329  0000              add [bx+si],al
0000132B  0000              add [bx+si],al
0000132D  0000              add [bx+si],al
0000132F  0000              add [bx+si],al
00001331  0000              add [bx+si],al
00001333  0000              add [bx+si],al
00001335  0000              add [bx+si],al
00001337  0000              add [bx+si],al
00001339  0000              add [bx+si],al
0000133B  0000              add [bx+si],al
0000133D  0000              add [bx+si],al
0000133F  0000              add [bx+si],al
00001341  0000              add [bx+si],al
00001343  0000              add [bx+si],al
00001345  0000              add [bx+si],al
00001347  0000              add [bx+si],al
00001349  0000              add [bx+si],al
0000134B  0000              add [bx+si],al
0000134D  0000              add [bx+si],al
0000134F  0000              add [bx+si],al
00001351  0000              add [bx+si],al
00001353  0000              add [bx+si],al
00001355  0000              add [bx+si],al
00001357  0000              add [bx+si],al
00001359  0000              add [bx+si],al
0000135B  0000              add [bx+si],al
0000135D  0000              add [bx+si],al
0000135F  0000              add [bx+si],al
00001361  0000              add [bx+si],al
00001363  0000              add [bx+si],al
00001365  0000              add [bx+si],al
00001367  0000              add [bx+si],al
00001369  0000              add [bx+si],al
0000136B  0000              add [bx+si],al
0000136D  0000              add [bx+si],al
0000136F  0000              add [bx+si],al
00001371  0000              add [bx+si],al
00001373  0000              add [bx+si],al
00001375  0000              add [bx+si],al
00001377  0000              add [bx+si],al
00001379  0000              add [bx+si],al
0000137B  0000              add [bx+si],al
0000137D  0000              add [bx+si],al
0000137F  0000              add [bx+si],al
00001381  0000              add [bx+si],al
00001383  0000              add [bx+si],al
00001385  0000              add [bx+si],al
00001387  0000              add [bx+si],al
00001389  0000              add [bx+si],al
0000138B  0000              add [bx+si],al
0000138D  0000              add [bx+si],al
0000138F  0000              add [bx+si],al
00001391  0000              add [bx+si],al
00001393  0000              add [bx+si],al
00001395  0000              add [bx+si],al
00001397  0000              add [bx+si],al
00001399  0000              add [bx+si],al
0000139B  0000              add [bx+si],al
0000139D  0000              add [bx+si],al
0000139F  0000              add [bx+si],al
000013A1  0000              add [bx+si],al
000013A3  0000              add [bx+si],al
000013A5  0000              add [bx+si],al
000013A7  0000              add [bx+si],al
000013A9  0000              add [bx+si],al
000013AB  0000              add [bx+si],al
000013AD  0000              add [bx+si],al
000013AF  0000              add [bx+si],al
000013B1  0000              add [bx+si],al
000013B3  0000              add [bx+si],al
000013B5  0000              add [bx+si],al
000013B7  0000              add [bx+si],al
000013B9  0000              add [bx+si],al
000013BB  0000              add [bx+si],al
000013BD  0000              add [bx+si],al
000013BF  0000              add [bx+si],al
000013C1  0000              add [bx+si],al
000013C3  0000              add [bx+si],al
000013C5  0000              add [bx+si],al
000013C7  0000              add [bx+si],al
000013C9  0000              add [bx+si],al
000013CB  0000              add [bx+si],al
000013CD  0000              add [bx+si],al
000013CF  0000              add [bx+si],al
000013D1  0000              add [bx+si],al
000013D3  0000              add [bx+si],al
000013D5  0000              add [bx+si],al
000013D7  0000              add [bx+si],al
000013D9  0000              add [bx+si],al
000013DB  0000              add [bx+si],al
000013DD  0000              add [bx+si],al
000013DF  0000              add [bx+si],al
000013E1  0000              add [bx+si],al
000013E3  0000              add [bx+si],al
000013E5  0000              add [bx+si],al
000013E7  0000              add [bx+si],al
000013E9  0000              add [bx+si],al
000013EB  0000              add [bx+si],al
000013ED  0000              add [bx+si],al
000013EF  0000              add [bx+si],al
000013F1  0000              add [bx+si],al
000013F3  0000              add [bx+si],al
000013F5  0000              add [bx+si],al
000013F7  0000              add [bx+si],al
000013F9  0000              add [bx+si],al
000013FB  0000              add [bx+si],al
000013FD  0000              add [bx+si],al
000013FF  0000              add [bx+si],al
00001401  0000              add [bx+si],al
00001403  0000              add [bx+si],al
00001405  0000              add [bx+si],al
00001407  0004              add [si],al
00001409  0000              add [bx+si],al
0000140B  0000              add [bx+si],al
0000140D  0001              add [bx+di],al
0000140F  0018              add [bx+si],bl
00001411  0000              add [bx+si],al
00001413  0018              add [bx+si],bl
00001415  0000              add [bx+si],al
00001417  800000            add byte [bx+si],0x0
0000141A  0000              add [bx+si],al
0000141C  0000              add [bx+si],al
0000141E  0000              add [bx+si],al
00001420  0400              add al,0x0
00001422  0000              add [bx+si],al
00001424  0000              add [bx+si],al
00001426  0100              add [bx+si],ax
00001428  0100              add [bx+si],ax
0000142A  0000              add [bx+si],al
0000142C  3000              xor [bx+si],al
0000142E  00800000          add [bx+si+0x0],al
00001432  0000              add [bx+si],al
00001434  0000              add [bx+si],al
00001436  0000              add [bx+si],al
00001438  0400              add al,0x0
0000143A  0000              add [bx+si],al
0000143C  0000              add [bx+si],al
0000143E  0100              add [bx+si],ax
00001440  0904              or [si],ax
00001442  0000              add [bx+si],al
00001444  48                dec ax
00001445  0000              add [bx+si],al
00001447  005840            add [bx+si+0x40],bl
0000144A  0000              add [bx+si],al
0000144C  5A                pop dx
0000144D  0100              add [bx+si],ax
0000144F  00E4              add ah,ah
00001451  0400              add al,0x0
00001453  0000              add [bx+si],al
00001455  0000              add [bx+si],al
00001457  003C              add [si],bh
00001459  61                popaw
0000145A  7373              jnc 0x14cf
0000145C  656D              gs insw
0000145E  626C79            bound bp,[si+0x79]
00001461  20786D            and [bx+si+0x6d],bh
00001464  6C                insb
00001465  6E                outsb
00001466  733D              jnc 0x14a5
00001468  227572            and dh,[di+0x72]
0000146B  6E                outsb
0000146C  3A7363            cmp dh,[bp+di+0x63]
0000146F  68656D            push word 0x6d65
00001472  61                popaw
00001473  732D              jnc 0x14a2
00001475  6D                insw
00001476  6963726F73        imul sp,[bp+di+0x72],word 0x736f
0000147B  6F                outsw
0000147C  66742D            o32 jz 0x14ac
0000147F  636F6D            arpl [bx+0x6d],bp
00001482  3A6173            cmp ah,[bx+di+0x73]
00001485  6D                insw
00001486  2E7631            cs jna 0x14ba
00001489  2220              and ah,[bx+si]
0000148B  6D                insw
0000148C  61                popaw
0000148D  6E                outsb
0000148E  6966657374        imul sp,[bp+0x65],word 0x7473
00001493  56                push si
00001494  657273            gs jc 0x150a
00001497  696F6E3D22        imul bp,[bx+0x6e],word 0x223d
0000149C  312E3022          xor [0x2230],bp
000014A0  3E0D0A20          ds or ax,0x200a
000014A4  203C              and [si],bh
000014A6  7472              jz 0x151a
000014A8  7573              jnz 0x151d
000014AA  7449              jz 0x14f5
000014AC  6E                outsb
000014AD  666F              outsd
000014AF  20786D            and [bx+si+0x6d],bh
000014B2  6C                insb
000014B3  6E                outsb
000014B4  733D              jnc 0x14f3
000014B6  227572            and dh,[di+0x72]
000014B9  6E                outsb
000014BA  3A7363            cmp dh,[bp+di+0x63]
000014BD  68656D            push word 0x6d65
000014C0  61                popaw
000014C1  732D              jnc 0x14f0
000014C3  6D                insw
000014C4  6963726F73        imul sp,[bp+di+0x72],word 0x736f
000014C9  6F                outsw
000014CA  66742D            o32 jz 0x14fa
000014CD  636F6D            arpl [bx+0x6d],bp
000014D0  3A6173            cmp ah,[bx+di+0x73]
000014D3  6D                insw
000014D4  2E7633            cs jna 0x150a
000014D7  223E0D0A          and bh,[0xa0d]
000014DB  2020              and [bx+si],ah
000014DD  2020              and [bx+si],ah
000014DF  3C73              cmp al,0x73
000014E1  65637572          arpl [gs:di+0x72],si
000014E5  6974793E0D        imul si,[si+0x79],word 0xd3e
000014EA  0A20              or ah,[bx+si]
000014EC  2020              and [bx+si],ah
000014EE  2020              and [bx+si],ah
000014F0  203C              and [si],bh
000014F2  7265              jc 0x1559
000014F4  7175              jno 0x156b
000014F6  657374            gs jnc 0x156d
000014F9  656450            fs push ax
000014FC  7269              jc 0x1567
000014FE  7669              jna 0x1569
00001500  6C                insb
00001501  656765733E        gs jnc 0x1544
00001506  0D0A20            or ax,0x200a
00001509  2020              and [bx+si],ah
0000150B  2020              and [bx+si],ah
0000150D  2020              and [bx+si],ah
0000150F  203C              and [si],bh
00001511  7265              jc 0x1578
00001513  7175              jno 0x158a
00001515  657374            gs jnc 0x158c
00001518  656445            fs inc bp
0000151B  7865              js 0x1582
0000151D  637574            arpl [di+0x74],si
00001520  696F6E4C65        imul bp,[bx+0x6e],word 0x654c
00001525  7665              jna 0x158c
00001527  6C                insb
00001528  206C65            and [si+0x65],ch
0000152B  7665              jna 0x1592
0000152D  6C                insb
0000152E  3D2261            cmp ax,0x6122
00001531  7349              jnc 0x157c
00001533  6E                outsb
00001534  766F              jna 0x15a5
00001536  6B657222          imul sp,[di+0x72],byte +0x22
0000153A  207569            and [di+0x69],dh
0000153D  41                inc cx
0000153E  636365            arpl [bp+di+0x65],sp
00001541  7373              jnc 0x15b6
00001543  3D2266            cmp ax,0x6622
00001546  61                popaw
00001547  6C                insb
00001548  7365              jnc 0x15af
0000154A  223E3C2F          and bh,[0x2f3c]
0000154E  7265              jc 0x15b5
00001550  7175              jno 0x15c7
00001552  657374            gs jnc 0x15c9
00001555  656445            fs inc bp
00001558  7865              js 0x15bf
0000155A  637574            arpl [di+0x74],si
0000155D  696F6E4C65        imul bp,[bx+0x6e],word 0x654c
00001562  7665              jna 0x15c9
00001564  6C                insb
00001565  3E0D0A20          ds or ax,0x200a
00001569  2020              and [bx+si],ah
0000156B  2020              and [bx+si],ah
0000156D  203C              and [si],bh
0000156F  2F                das
00001570  7265              jc 0x15d7
00001572  7175              jno 0x15e9
00001574  657374            gs jnc 0x15eb
00001577  656450            fs push ax
0000157A  7269              jc 0x15e5
0000157C  7669              jna 0x15e7
0000157E  6C                insb
0000157F  656765733E        gs jnc 0x15c2
00001584  0D0A20            or ax,0x200a
00001587  2020              and [bx+si],ah
00001589  203C              and [si],bh
0000158B  2F                das
0000158C  7365              jnc 0x15f3
0000158E  637572            arpl [di+0x72],si
00001591  6974793E0D        imul si,[si+0x79],word 0xd3e
00001596  0A20              or ah,[bx+si]
00001598  203C              and [si],bh
0000159A  2F                das
0000159B  7472              jz 0x160f
0000159D  7573              jnz 0x1612
0000159F  7449              jz 0x15ea
000015A1  6E                outsb
000015A2  666F              outsd
000015A4  3E0D0A3C          ds or ax,0x3c0a
000015A8  2F                das
000015A9  61                popaw
000015AA  7373              jnc 0x161f
000015AC  656D              gs insw
000015AE  626C79            bound bp,[si+0x79]
000015B1  3E50              ds push ax
000015B3  41                inc cx
000015B4  50                push ax
000015B5  41                inc cx
000015B6  44                inc sp
000015B7  44                inc sp
000015B8  49                dec cx
000015B9  4E                dec si
000015BA  47                inc di
000015BB  58                pop ax
000015BC  58                pop ax
000015BD  50                push ax
000015BE  41                inc cx
000015BF  44                inc sp
000015C0  44                inc sp
000015C1  49                dec cx
000015C2  4E                dec si
000015C3  47                inc di
000015C4  50                push ax
000015C5  41                inc cx
000015C6  44                inc sp
000015C7  44                inc sp
000015C8  49                dec cx
000015C9  4E                dec si
000015CA  47                inc di
000015CB  58                pop ax
000015CC  58                pop ax
000015CD  50                push ax
000015CE  41                inc cx
000015CF  44                inc sp
000015D0  44                inc sp
000015D1  49                dec cx
000015D2  4E                dec si
000015D3  47                inc di
000015D4  50                push ax
000015D5  41                inc cx
000015D6  44                inc sp
000015D7  44                inc sp
000015D8  49                dec cx
000015D9  4E                dec si
000015DA  47                inc di
000015DB  58                pop ax
000015DC  58                pop ax
000015DD  50                push ax
000015DE  41                inc cx
000015DF  44                inc sp
000015E0  44                inc sp
000015E1  49                dec cx
000015E2  4E                dec si
000015E3  47                inc di
000015E4  50                push ax
000015E5  41                inc cx
000015E6  44                inc sp
000015E7  44                inc sp
000015E8  49                dec cx
000015E9  4E                dec si
000015EA  47                inc di
000015EB  58                pop ax
000015EC  58                pop ax
000015ED  50                push ax
000015EE  41                inc cx
000015EF  44                inc sp
000015F0  44                inc sp
000015F1  49                dec cx
000015F2  4E                dec si
000015F3  47                inc di
000015F4  50                push ax
000015F5  41                inc cx
000015F6  44                inc sp
000015F7  44                inc sp
000015F8  49                dec cx
000015F9  4E                dec si
000015FA  47                inc di
000015FB  58                pop ax
000015FC  58                pop ax
000015FD  50                push ax
000015FE  41                inc cx
000015FF  44                inc sp
00001600  0010              add [bx+si],dl
00001602  0000              add [bx+si],al
00001604  2401              and al,0x1
00001606  0000              add [bx+si],al
00001608  053013            add ax,0x1330
0000160B  301D              xor [di],bl
0000160D  3024              xor [si],ah
0000160F  302A              xor [bp+si],ch
00001611  302F              xor [bx],ch
00001613  3034              xor [si],dh
00001615  3039              xor [bx+di],bh
00001617  303E3044          xor [0x4430],bh
0000161B  304C30            xor [si+0x30],cl
0000161E  60                pushaw
0000161F  306D30            xor [di+0x30],ch
00001622  7A30              jpe 0x1654
00001624  8E30              mov segr6,[bx+si]
00001626  97                xchg ax,di
00001627  30B230BC          xor [bp+si-0x43d0],dh
0000162B  30CF              xor bh,cl
0000162D  30D9              xor cl,bl
0000162F  30DE              xor dh,bl
00001631  30E3              xor bl,ah
00001633  3005              xor [di],al
00001635  310A              xor [bp+si],cx
00001637  3113              xor [bp+di],dx
00001639  3118              xor [bx+si],bx
0000163B  3125              xor [di],sp
0000163D  3136313C          xor [0x3c31],si
00001641  314331            xor [bp+di+0x31],ax
00001644  57                push di
00001645  315C31            xor [si+0x31],bx
00001648  6231              bound si,[bx+di]
0000164A  6A31              push byte +0x31
0000164C  7031              jo 0x167f
0000164E  7631              jna 0x1681
00001650  833189            xor word [bx+di],byte -0x77
00001653  319231B1          xor [bp+si-0x4ecf],dx
00001657  31B931C2          xor [bx+di-0x3dcf],di
0000165B  31C8              xor ax,cx
0000165D  31D0              xor ax,dx
0000165F  31DC              xor sp,bx
00001661  31EE              xor si,bp
00001663  31F9              xor cx,di
00001665  31FF              xor di,di
00001667  3111              xor [bx+di],dx
00001669  3219              xor bl,[bx+di]
0000166B  3224              xor ah,[si]
0000166D  3230              xor dh,[bx+si]
0000166F  3236323F          xor dh,[0x3f32]
00001673  324532            xor al,[di+0x32]
00001676  4A                dec dx
00001677  324F32            xor cl,[bx+0x32]
0000167A  54                push sp
0000167B  325B32            xor bl,[bp+di+0x32]
0000167E  61                popaw
0000167F  327332            xor dh,[bp+di+0x32]
00001682  7B32              jpo 0x16b6
00001684  81328D32          xor word [bp+si],0x328d
00001688  98                cbw
00001689  32B632BC          xor dh,[bp-0x43ce]
0000168D  32C2              xor al,dl
0000168F  32C8              xor cl,al
00001691  32CE              xor cl,dh
00001693  32D4              xor dl,ah
00001695  32DB              xor bl,bl
00001697  32E2              xor ah,dl
00001699  32E9              xor ch,cl
0000169B  32F0              xor dh,al
0000169D  32F7              xor dh,bh
0000169F  32FE              xor bh,dh
000016A1  3205              xor al,[di]
000016A3  330D              xor cx,[di]
000016A5  3315              xor dx,[di]
000016A7  331D              xor bx,[di]
000016A9  3329              xor bp,[bx+di]
000016AB  3332              xor si,[bp+si]
000016AD  3337              xor si,[bx]
000016AF  333D              xor di,[di]
000016B1  334733            xor ax,[bx+0x33]
000016B4  50                push ax
000016B5  335B33            xor bx,[bp+di+0x33]
000016B8  67336C337C        xor bp,[dword ebx+esi+0x7c]
000016BD  33813387          xor ax,[bx+di-0x78cd]
000016C1  338D33A3          xor cx,[di-0x5ccd]
000016C5  33AA33F3          xor bp,[bp+si-0xccd]
000016C9  33F9              xor di,cx
000016CB  3302              xor ax,[bp+si]
000016CD  3409              xor al,0x9
000016CF  3414              xor al,0x14
000016D1  341A              xor al,0x1a
000016D3  342D              xor al,0x2d
000016D5  3442              xor al,0x42
000016D7  344D              xor al,0x4d
000016D9  3463              xor al,0x63
000016DB  347B              xor al,0x7b
000016DD  3485              xor al,0x85
000016DF  34C2              xor al,0xc2
000016E1  34C7              xor al,0xc7
000016E3  34E8              xor al,0xe8
000016E5  34ED              xor al,0xed
000016E7  340C              xor al,0xc
000016E9  35A835            xor ax,0x35a8
000016EC  AD                lodsw
000016ED  35BF35            xor ax,0x35bf
000016F0  DD35              fnsave [di]
000016F2  F1                int1
000016F3  35F735            xor ax,0x35f7
000016F6  5E                pop si
000016F7  3664367136        ss jno 0x1732
000016FC  8E36DB36          mov segr6,[0x36db]
00001700  E036              loopne 0x1738
00001702  2237              and dh,[bx]
00001704  45                inc bp
00001705  37                aaa
00001706  52                push dx
00001707  37                aaa
00001708  5E                pop si
00001709  37                aaa
0000170A  6637              o32 aaa
0000170C  6E                outsb
0000170D  37                aaa
0000170E  7A37              jpe 0x1747
00001710  A337AB            mov [0xab37],ax
00001713  37                aaa
00001714  B637              mov dh,0x37
00001716  BC37C2            mov sp,0xc237
00001719  37                aaa
0000171A  C837CE37          enter 0xce37,0x37
0000171E  D437              aam 0x37
00001720  DA37              fidiv dword [bx]
00001722  E037              loopne 0x175b
00001724  0020              add [bx+si],ah
00001726  0000              add [bx+si],al
00001728  2000              and [bx+si],al
0000172A  0000              add [bx+si],al
0000172C  A830              test al,0x30
0000172E  B430              mov ah,0x30
00001730  B830DC            mov ax,0xdc30
00001733  30E0              xor al,ah
00001735  3024              xor [si],ah
00001737  3128              xor [bx+si],bp
00001739  31DC              xor sp,bx
0000173B  31E0              xor ax,sp
0000173D  3100              xor [bx+si],ax
0000173F  321C              xor bl,[si]
00001741  3220              xor ah,[bx+si]
00001743  3200              xor al,[bx+si]
00001745  0000              add [bx+si],al
00001747  0000              add [bx+si],al
00001749  0000              add [bx+si],al
0000174B  0000              add [bx+si],al
0000174D  0000              add [bx+si],al
0000174F  0000              add [bx+si],al
00001751  0000              add [bx+si],al
00001753  0000              add [bx+si],al
00001755  0000              add [bx+si],al
00001757  0000              add [bx+si],al
00001759  0000              add [bx+si],al
0000175B  0000              add [bx+si],al
0000175D  0000              add [bx+si],al
0000175F  0000              add [bx+si],al
00001761  0000              add [bx+si],al
00001763  0000              add [bx+si],al
00001765  0000              add [bx+si],al
00001767  0000              add [bx+si],al
00001769  0000              add [bx+si],al
0000176B  0000              add [bx+si],al
0000176D  0000              add [bx+si],al
0000176F  0000              add [bx+si],al
00001771  0000              add [bx+si],al
00001773  0000              add [bx+si],al
00001775  0000              add [bx+si],al
00001777  0000              add [bx+si],al
00001779  0000              add [bx+si],al
0000177B  0000              add [bx+si],al
0000177D  0000              add [bx+si],al
0000177F  0000              add [bx+si],al
00001781  0000              add [bx+si],al
00001783  0000              add [bx+si],al
00001785  0000              add [bx+si],al
00001787  0000              add [bx+si],al
00001789  0000              add [bx+si],al
0000178B  0000              add [bx+si],al
0000178D  0000              add [bx+si],al
0000178F  0000              add [bx+si],al
00001791  0000              add [bx+si],al
00001793  0000              add [bx+si],al
00001795  0000              add [bx+si],al
00001797  0000              add [bx+si],al
00001799  0000              add [bx+si],al
0000179B  0000              add [bx+si],al
0000179D  0000              add [bx+si],al
0000179F  0000              add [bx+si],al
000017A1  0000              add [bx+si],al
000017A3  0000              add [bx+si],al
000017A5  0000              add [bx+si],al
000017A7  0000              add [bx+si],al
000017A9  0000              add [bx+si],al
000017AB  0000              add [bx+si],al
000017AD  0000              add [bx+si],al
000017AF  0000              add [bx+si],al
000017B1  0000              add [bx+si],al
000017B3  0000              add [bx+si],al
000017B5  0000              add [bx+si],al
000017B7  0000              add [bx+si],al
000017B9  0000              add [bx+si],al
000017BB  0000              add [bx+si],al
000017BD  0000              add [bx+si],al
000017BF  0000              add [bx+si],al
000017C1  0000              add [bx+si],al
000017C3  0000              add [bx+si],al
000017C5  0000              add [bx+si],al
000017C7  0000              add [bx+si],al
000017C9  0000              add [bx+si],al
000017CB  0000              add [bx+si],al
000017CD  0000              add [bx+si],al
000017CF  0000              add [bx+si],al
000017D1  0000              add [bx+si],al
000017D3  0000              add [bx+si],al
000017D5  0000              add [bx+si],al
000017D7  0000              add [bx+si],al
000017D9  0000              add [bx+si],al
000017DB  0000              add [bx+si],al
000017DD  0000              add [bx+si],al
000017DF  0000              add [bx+si],al
000017E1  0000              add [bx+si],al
000017E3  0000              add [bx+si],al
000017E5  0000              add [bx+si],al
000017E7  0000              add [bx+si],al
000017E9  0000              add [bx+si],al
000017EB  0000              add [bx+si],al
000017ED  0000              add [bx+si],al
000017EF  0000              add [bx+si],al
000017F1  0000              add [bx+si],al
000017F3  0000              add [bx+si],al
000017F5  0000              add [bx+si],al
000017F7  0000              add [bx+si],al
000017F9  0000              add [bx+si],al
000017FB  0000              add [bx+si],al
000017FD  0000              add [bx+si],al
000017FF  00                db 0x00
