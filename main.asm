;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Tue Mar 31 21:04:15 2020
;--------------------------------------------------------
$name main
$optc51 --model-small
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _main
	public _soundpulse
	public _wait_timer
	public _GetPeriod
	public _waitms
	public _wait_1ms
	public _waitus
	public _wait_1us
	public _PrintNumber
	public _delay
	public _PrintNumber_PARM_3
	public _PrintNumber_PARM_2
	public _HexDigit
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_HexDigit:
	ds 17
_PrintNumber_PARM_2:
	ds 2
_PrintNumber_PARM_3:
	ds 2
_PrintNumber_j_1_11:
	ds 2
_PrintNumber_buff_1_11:
	ds 33
_main_fref_1_36:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:20: char HexDigit[]="0123456789ABCDEF";
	mov	_HexDigit,#0x30
	mov	(_HexDigit + 0x0001),#0x31
	mov	(_HexDigit + 0x0002),#0x32
	mov	(_HexDigit + 0x0003),#0x33
	mov	(_HexDigit + 0x0004),#0x34
	mov	(_HexDigit + 0x0005),#0x35
	mov	(_HexDigit + 0x0006),#0x36
	mov	(_HexDigit + 0x0007),#0x37
	mov	(_HexDigit + 0x0008),#0x38
	mov	(_HexDigit + 0x0009),#0x39
	mov	(_HexDigit + 0x000a),#0x41
	mov	(_HexDigit + 0x000b),#0x42
	mov	(_HexDigit + 0x000c),#0x43
	mov	(_HexDigit + 0x000d),#0x44
	mov	(_HexDigit + 0x000e),#0x45
	mov	(_HexDigit + 0x000f),#0x46
	mov	(_HexDigit + 0x0010),#0x00
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;dly                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:15: void delay(int dly)
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	using	0
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:17: while( dly--);
L002001?:
	mov	ar4,r2
	mov	ar5,r3
	dec	r2
	cjne	r2,#0xff,L002008?
	dec	r3
L002008?:
	mov	a,r4
	orl	a,r5
	jnz	L002001?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PrintNumber'
;------------------------------------------------------------
;Base                      Allocated with name '_PrintNumber_PARM_2'
;digits                    Allocated with name '_PrintNumber_PARM_3'
;N                         Allocated to registers r2 r3 
;j                         Allocated with name '_PrintNumber_j_1_11'
;buff                      Allocated with name '_PrintNumber_buff_1_11'
;------------------------------------------------------------
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:21: void PrintNumber(int N, int Base, int digits)
;	-----------------------------------------
;	 function PrintNumber
;	-----------------------------------------
_PrintNumber:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:26: buff[NBITS]=0;
	mov	(_PrintNumber_buff_1_11 + 0x0020),#0x00
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:29: while ( (N>0) | (digits>0) )
	mov	_PrintNumber_j_1_11,#0x1F
	clr	a
	mov	(_PrintNumber_j_1_11 + 1),a
	mov	r6,_PrintNumber_PARM_3
	mov	r7,(_PrintNumber_PARM_3 + 1)
L003003?:
	clr	c
	clr	a
	subb	a,r2
	clr	a
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	clr	a
	rlc	a
	mov	r4,a
	clr	c
	clr	a
	subb	a,r6
	clr	a
	xrl	a,#0x80
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	clr	a
	rlc	a
	mov	r5,a
	orl	a,r4
	jz	L003005?
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:31: buff[j--]=HexDigit[N%Base];
	mov	r4,_PrintNumber_j_1_11
	mov	r5,(_PrintNumber_j_1_11 + 1)
	dec	_PrintNumber_j_1_11
	mov	a,#0xff
	cjne	a,_PrintNumber_j_1_11,L003013?
	dec	(_PrintNumber_j_1_11 + 1)
L003013?:
	mov	a,r4
	add	a,#_PrintNumber_buff_1_11
	mov	r0,a
	mov	__modsint_PARM_2,_PrintNumber_PARM_2
	mov	(__modsint_PARM_2 + 1),(_PrintNumber_PARM_2 + 1)
	mov	dpl,r2
	mov	dph,r3
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	push	ar0
	lcall	__modsint
	mov	r4,dpl
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar3
	pop	ar2
	mov	a,r4
	add	a,#_HexDigit
	mov	r1,a
	mov	ar4,@r1
	mov	@r0,ar4
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:32: N/=Base;
	mov	__divsint_PARM_2,_PrintNumber_PARM_2
	mov	(__divsint_PARM_2 + 1),(_PrintNumber_PARM_2 + 1)
	mov	dpl,r2
	mov	dph,r3
	push	ar6
	push	ar7
	lcall	__divsint
	mov	r2,dpl
	mov	r3,dph
	pop	ar7
	pop	ar6
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:33: if(digits!=0) digits--;
	mov	a,r6
	orl	a,r7
	jnz	L003014?
	ljmp	L003003?
L003014?:
	dec	r6
	cjne	r6,#0xff,L003015?
	dec	r7
L003015?:
	ljmp	L003003?
L003005?:
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:35: eputs(&buff[j+1]);
	mov	a,_PrintNumber_j_1_11
	inc	a
	add	a,#_PrintNumber_buff_1_11
	mov	r2,a
	mov	r3,#0x00
	mov	r4,#0x40
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	ljmp	_eputs
;------------------------------------------------------------
;Allocation info for local variables in function 'wait_1us'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:38: void wait_1us(void) 
;	-----------------------------------------
;	 function wait_1us
;	-----------------------------------------
_wait_1us:
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:41: STK_RVR = (F_CPU/1000000L) - 1;  // set reload register, counter rolls over from zero, hence -1
	mov	dptr,#0xE014
	mov	b,#0x00
	mov	a,#0x2F
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:42: STK_CVR = 0; // load the SysTick counter
	mov	dptr,#0xE018
	clr	a
	mov	b,a
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:43: STK_CSR = 0x05; // Bit 0: ENABLE, BIT 1: TICKINT, BIT 2:CLKSOURCE
	mov	dptr,#0xE010
	mov	b,#0x00
	mov	a,#0x05
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:44: while((STK_CSR & BIT16)==0); // Bit 16 is the COUNTFLAG.  True when counter rolls over from zero.
L004001?:
	mov	dptr,#0xE010
	mov	b,#0x00
	lcall	__gptrget
	inc	dptr
	lcall	__gptrget
	clr	a
	mov	r2,a
	mov	r3,a
	orl	a,r2
	jz	L004001?
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:45: STK_CSR = 0x00; // Disable Systick counter
	mov	dptr,#0xE010
	clr	a
	mov	b,a
	lcall	__gptrput
	inc	dptr
	clr	a
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'waitus'
;------------------------------------------------------------
;len                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:48: void waitus(int len)
;	-----------------------------------------
;	 function waitus
;	-----------------------------------------
_waitus:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:50: while(len--) wait_1us();
L005001?:
	mov	ar4,r2
	mov	ar5,r3
	dec	r2
	cjne	r2,#0xff,L005009?
	dec	r3
L005009?:
	mov	a,r4
	orl	a,r5
	jz	L005004?
	push	ar2
	push	ar3
	lcall	_wait_1us
	pop	ar3
	pop	ar2
	sjmp	L005001?
L005004?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait_1ms'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:53: void wait_1ms(void)
;	-----------------------------------------
;	 function wait_1ms
;	-----------------------------------------
_wait_1ms:
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:56: STK_RVR = (F_CPU/1000L) - 1;  // set reload register, counter rolls over from zero, hence -1
	mov	dptr,#0xE014
	mov	b,#0x00
	mov	a,#0x7F
	lcall	__gptrput
	inc	dptr
	mov	a,#0xBB
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:57: STK_CVR = 0; // load the SysTick counter
	mov	dptr,#0xE018
	clr	a
	mov	b,a
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:58: STK_CSR = 0x05; // Bit 0: ENABLE, BIT 1: TICKINT, BIT 2:CLKSOURCE
	mov	dptr,#0xE010
	mov	b,#0x00
	mov	a,#0x05
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:59: while((STK_CSR & BIT16)==0); // Bit 16 is the COUNTFLAG.  True when counter rolls over from zero.
L006001?:
	mov	dptr,#0xE010
	mov	b,#0x00
	lcall	__gptrget
	inc	dptr
	lcall	__gptrget
	clr	a
	mov	r2,a
	mov	r3,a
	orl	a,r2
	jz	L006001?
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:60: STK_CSR = 0x00; // Disable Systick counter
	mov	dptr,#0xE010
	clr	a
	mov	b,a
	lcall	__gptrput
	inc	dptr
	clr	a
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;len                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:63: void waitms(int len)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:65: while(len--) wait_1ms();
L007001?:
	mov	ar4,r2
	mov	ar5,r3
	dec	r2
	cjne	r2,#0xff,L007009?
	dec	r3
L007009?:
	mov	a,r4
	orl	a,r5
	jz	L007004?
	push	ar2
	push	ar3
	lcall	_wait_1ms
	pop	ar3
	pop	ar2
	sjmp	L007001?
L007004?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetPeriod'
;------------------------------------------------------------
;n                         Allocated to registers r2 r3 
;i                         Allocated to registers r4 r5 
;saved_TCNT1a              Allocated with name '_GetPeriod_saved_TCNT1a_1_22'
;saved_TCNT1b              Allocated with name '_GetPeriod_saved_TCNT1b_1_22'
;------------------------------------------------------------
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:71: long int GetPeriod (int n)
;	-----------------------------------------
;	 function GetPeriod
;	-----------------------------------------
_GetPeriod:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:76: STK_RVR = 0xffffff;  // 24-bit counter set to check for signal present
	mov	dptr,#0xE014
	mov	b,#0x00
	mov	a,#0xFF
	lcall	__gptrput
	inc	dptr
	mov	a,#0xFF
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:77: STK_CVR = 0xffffff; // load the SysTick counter
	mov	dptr,#0xE018
	mov	b,#0x00
	mov	a,#0xFF
	lcall	__gptrput
	inc	dptr
	mov	a,#0xFF
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:78: STK_CSR = 0x05; // Bit 0: ENABLE, BIT 1: TICKINT, BIT 2:CLKSOURCE
	mov	dptr,#0xE010
	mov	b,#0x00
	mov	a,#0x05
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:79: while (PIN_PERIOD!=0) // Wait for square wave to be 0
L008003?:
	mov	dptr,#0x0010
	mov	b,#0x00
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	jnb	acc.0,L008005?
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:81: if(STK_CSR & BIT16) return 0;
	mov	dptr,#0xE010
	mov	b,#0x00
	lcall	__gptrget
	inc	dptr
	lcall	__gptrget
	clr	a
	mov	r4,a
	mov	r5,a
	orl	a,r4
	jz	L008003?
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	ret
L008005?:
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:83: STK_CSR = 0x00; // Disable Systick counter
	mov	dptr,#0xE010
	clr	a
	mov	b,a
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:85: STK_RVR = 0xffffff;  // 24-bit counter set to check for signal present
	mov	dptr,#0xE014
	mov	b,#0x00
	mov	a,#0xFF
	lcall	__gptrput
	inc	dptr
	mov	a,#0xFF
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:86: STK_CVR = 0xffffff; // load the SysTick counter
	mov	dptr,#0xE018
	mov	b,#0x00
	mov	a,#0xFF
	lcall	__gptrput
	inc	dptr
	mov	a,#0xFF
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:87: STK_CSR = 0x05; // Bit 0: ENABLE, BIT 1: TICKINT, BIT 2:CLKSOURCE
	mov	dptr,#0xE010
	mov	b,#0x00
	mov	a,#0x05
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:88: while (PIN_PERIOD==0) // Wait for square wave to be 1
L008008?:
	mov	dptr,#0x0010
	mov	b,#0x00
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	jb	acc.0,L008010?
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:90: if(STK_CSR & BIT16) return 0;
	mov	dptr,#0xE010
	mov	b,#0x00
	lcall	__gptrget
	inc	dptr
	lcall	__gptrget
	clr	a
	mov	r4,a
	mov	r5,a
	orl	a,r4
	jz	L008008?
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	ret
L008010?:
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:92: STK_CSR = 0x00; // Disable Systick counter
	mov	dptr,#0xE010
	clr	a
	mov	b,a
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:94: STK_RVR = 0xffffff;  // 24-bit counter reset
	mov	dptr,#0xE014
	mov	b,#0x00
	mov	a,#0xFF
	lcall	__gptrput
	inc	dptr
	mov	a,#0xFF
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:95: STK_CVR = 0xffffff; // load the SysTick counter to initial value
	mov	dptr,#0xE018
	mov	b,#0x00
	mov	a,#0xFF
	lcall	__gptrput
	inc	dptr
	mov	a,#0xFF
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:96: STK_CSR = 0x05; // Bit 0: ENABLE, BIT 1: TICKINT, BIT 2:CLKSOURCE
	mov	dptr,#0xE010
	mov	b,#0x00
	mov	a,#0x05
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:97: for(i=0; i<n; i++) // Measure the time of 'n' periods
	mov	r4,#0x00
	mov	r5,#0x00
L008021?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	L008024?
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:99: while (PIN_PERIOD!=0) // Wait for square wave to be 0
L008013?:
	mov	dptr,#0x0010
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	jnb	acc.0,L008018?
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:101: if(STK_CSR & BIT16) return 0;
	mov	dptr,#0xE010
	mov	b,#0x00
	lcall	__gptrget
	inc	dptr
	lcall	__gptrget
	clr	a
	mov	r6,a
	mov	r7,a
	orl	a,r6
	jz	L008013?
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	ret
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:103: while (PIN_PERIOD==0) // Wait for square wave to be 1
L008018?:
	mov	dptr,#0x0010
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	lcall	__gptrget
	mov	r7,a
	jb	acc.0,L008023?
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:105: if(STK_CSR & BIT16) return 0;
	mov	dptr,#0xE010
	mov	b,#0x00
	lcall	__gptrget
	inc	dptr
	lcall	__gptrget
	clr	a
	mov	r6,a
	mov	r7,a
	orl	a,r6
	jz	L008018?
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	ret
L008023?:
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:97: for(i=0; i<n; i++) // Measure the time of 'n' periods
	inc	r4
	cjne	r4,#0x00,L008021?
	inc	r5
	sjmp	L008021?
L008024?:
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:108: STK_CSR = 0x00; // Disable Systick counter
	mov	dptr,#0xE010
	clr	a
	mov	b,a
	lcall	__gptrput
	inc	dptr
	clr	a
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:110: return 0xffffff-STK_CVR;
	mov	dptr,#0xE018
	mov	b,#0x00
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	clr	a
	mov	r4,a
	mov	r5,a
	mov	a,#0xFF
	clr	c
	subb	a,r2
	mov	r2,a
	mov	a,#0xFF
	subb	a,r3
	mov	r3,a
	mov	a,#0xFF
	subb	a,r4
	mov	r4,a
	clr	a
	subb	a,r5
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait_timer'
;------------------------------------------------------------
;period                    Allocated to registers r2 r3 
;i                         Allocated to registers r6 r7 
;j                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:113: void wait_timer (int period)
;	-----------------------------------------
;	 function wait_timer
;	-----------------------------------------
_wait_timer:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:117: if (period <= 255)
	clr	c
	mov	a,#0xFF
	subb	a,r2
	clr	a
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jc	L009002?
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:119: waitus(period);
	mov	dpl,r2
	mov	dph,r3
	ljmp	_waitus
L009002?:
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:123: j = period / 255;
	mov	__divsint_PARM_2,#0xFF
	clr	a
	mov	(__divsint_PARM_2 + 1),a
	mov	dpl,r2
	mov	dph,r3
	push	ar2
	push	ar3
	lcall	__divsint
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:124: for (i = 0; i<j; i++)
	mov	r6,#0x00
	mov	r7,#0x00
L009004?:
	clr	c
	mov	a,r6
	subb	a,r4
	mov	a,r7
	xrl	a,#0x80
	mov	b,r5
	xrl	b,#0x80
	subb	a,b
	jnc	L009007?
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:126: waitus(255);
	mov	dptr,#0x00FF
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	_waitus
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:124: for (i = 0; i<j; i++)
	inc	r6
	cjne	r6,#0x00,L009004?
	inc	r7
	sjmp	L009004?
L009007?:
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:128: waitus(period % 255);
	mov	__modsint_PARM_2,#0xFF
	clr	a
	mov	(__modsint_PARM_2 + 1),a
	mov	dpl,r2
	mov	dph,r3
	lcall	__modsint
	mov  r3,dph
	ljmp	_waitus
;------------------------------------------------------------
;Allocation info for local variables in function 'soundpulse'
;------------------------------------------------------------
;period                    Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:132: void soundpulse (int period)
;	-----------------------------------------
;	 function soundpulse
;	-----------------------------------------
_soundpulse:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:134: GPIOA_ODR |= 0x00000001; // PA0=1
	mov	dptr,#0x0014
	mov	b,#0x00
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	orl	ar4,#0x01
	mov	dptr,#(0x14&0x00ff)
	clr	a
	mov	b,a
	mov	a,r4
	lcall	__gptrput
	inc	dptr
	mov	a,r5
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:135: wait_timer(period);
	mov	dpl,r2
	mov	dph,r3
	push	ar2
	push	ar3
	lcall	_wait_timer
	pop	ar3
	pop	ar2
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:136: GPIOA_ODR &= ~(0x00000001); // PA0=0
	mov	dptr,#0x0014
	mov	b,#0x00
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	lcall	__gptrget
	mov	r5,a
	anl	ar4,#0xFE
	mov	dptr,#(0x14&0x00ff)
	clr	a
	mov	b,a
	mov	a,r4
	lcall	__gptrput
	inc	dptr
	mov	a,r5
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:137: wait_timer(period);
	mov	dpl,r2
	mov	dph,r3
	ljmp	_wait_timer
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;count                     Allocated to registers r6 r7 r0 r1 
;countref                  Allocated to registers r2 r3 r4 r5 
;T                         Allocated to registers r2 r3 r4 r5 
;f                         Allocated to registers r2 r3 r4 r5 
;Tref                      Allocated to registers r2 r3 r4 r5 
;fref                      Allocated with name '_main_fref_1_36'
;------------------------------------------------------------
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:140: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:146: RCC_AHBENR |= 0x00020000; // peripheral clock enable for port A
	mov	dptr,#0x1014
	mov	b,#0x02
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	mov	r4,#0x00
	orl	ar4,#0x02
	mov	dptr,#0x1014
	mov	b,#0x02
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:149: GPIOA_MODER &= ~(BIT16 | BIT17); // Make pin PA8 input
	mov	dptr,#0x0000
	mov	b,#0x00
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:151: GPIOA_PUPDR |= BIT16; 
	mov	dptr,#0x000C
	mov	b,#0x00
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	mov	dptr,#(0x0C&0x00ff)
	clr	a
	mov	b,a
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:152: GPIOA_PUPDR &= ~(BIT17); 
	mov	dptr,#0x000C
	mov	b,#0x00
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	mov	dptr,#(0x0C&0x00ff)
	clr	a
	mov	b,a
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:155: RCC_AHBENR |= 0x00020000; // peripheral clock enable for port A
	mov	dptr,#0x1014
	mov	b,#0x02
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	mov	r4,#0x00
	orl	ar4,#0x02
	mov	dptr,#0x1014
	mov	b,#0x02
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:156: GPIOA_MODER |= 0x00000001; // Make pin PA0 output
	mov	dptr,#0x0000
	mov	b,#0x00
	lcall	__gptrget
	mov	r2,a
	inc	dptr
	lcall	__gptrget
	mov	r3,a
	orl	ar2,#0x01
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	mov	a,r2
	lcall	__gptrput
	inc	dptr
	mov	a,r3
	lcall	__gptrput
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:158: waitms(500); // Wait for putty to start.
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:160: "Connect signal to PA8 (pin 18).\r\n");
	mov	dptr,#__str_0
	mov	b,#0x80
	lcall	_eputs
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:162: countref=GetPeriod(100);
	mov	dptr,#0x0064
	lcall	_GetPeriod
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:163: if(countref>0)
	clr	c
	clr	a
	subb	a,r2
	clr	a
	subb	a,r3
	clr	a
	subb	a,r4
	clr	a
	xrl	a,#0x80
	mov	b,r5
	xrl	b,#0x80
	subb	a,b
	jnc	L011009?
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:165: Tref=countref/(F_CPU*100.0);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___slong2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,#0x18
	push	acc
	mov	a,#0x0D
	push	acc
	mov	a,#0x8F
	push	acc
	mov	a,#0x4F
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:166: fref=1/Tref;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x3F
	lcall	___fsdiv
	mov	_main_fref_1_36,dpl
	mov	(_main_fref_1_36 + 1),dph
	mov	(_main_fref_1_36 + 2),b
	mov	(_main_fref_1_36 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:169: while(1)
L011009?:
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:171: count=GetPeriod(100);
	mov	dptr,#0x0064
	lcall	_GetPeriod
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:172: if(count>0)
	clr	c
	clr	a
	subb	a,r6
	clr	a
	subb	a,r7
	clr	a
	subb	a,r0
	clr	a
	xrl	a,#0x80
	mov	b,r1
	xrl	b,#0x80
	subb	a,b
	jc	L011018?
	ljmp	L011006?
L011018?:
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:174: T=count/(F_CPU*100.0);
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	lcall	___slong2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,#0x18
	push	acc
	mov	a,#0x0D
	push	acc
	mov	a,#0x8F
	push	acc
	mov	a,#0x4F
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:175: f=1/T;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x3F
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:176: eputs("f=");
	mov	dptr,#__str_1
	mov	b,#0x80
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	lcall	_eputs
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:177: PrintNumber(f, 10, 7);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	lcall	___fs2sint
	mov	_PrintNumber_PARM_2,#0x0A
	clr	a
	mov	(_PrintNumber_PARM_2 + 1),a
	mov	_PrintNumber_PARM_3,#0x07
	clr	a
	mov	(_PrintNumber_PARM_3 + 1),a
	lcall	_PrintNumber
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:178: eputs("Hz, count=");
	mov	dptr,#__str_2
	mov	b,#0x80
	lcall	_eputs
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:179: PrintNumber(count, 10, 6);
	mov	dpl,r6
	mov	dph,r7
	mov	_PrintNumber_PARM_2,#0x0A
	clr	a
	mov	(_PrintNumber_PARM_2 + 1),a
	mov	_PrintNumber_PARM_3,#0x06
	clr	a
	mov	(_PrintNumber_PARM_3 + 1),a
	lcall	_PrintNumber
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:180: eputs("\r");
	mov	dptr,#__str_3
	mov	b,#0x80
	lcall	_eputs
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:182: if (f > (fref+70)) {
	clr	a
	push	acc
	push	acc
	mov	a,#0x8C
	push	acc
	mov	a,#0x42
	push	acc
	mov	dpl,_main_fref_1_36
	mov	dph,(_main_fref_1_36 + 1)
	mov	b,(_main_fref_1_36 + 2)
	mov	a,(_main_fref_1_36 + 3)
	lcall	___fsadd
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L011019?
	ljmp	L011009?
L011019?:
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:183: soundpulse(E6);
	mov	dptr,#0x02F6
	lcall	_soundpulse
	ljmp	L011009?
L011006?:
;	C:\Users\tnurs\Desktop\UBC\Year_2\ELEC291\lab7\STMexamples\Period\main.c:189: eputs("NO SIGNAL\r");
	mov	dptr,#__str_4
	mov	b,#0x80
	lcall	_eputs
	ljmp	L011009?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'Period measurement using the Systick free running counter.'
	db 0x0D
	db 0x0A
	db 'Connect signal to PA8 (pin 18).'
	db 0x0D
	db 0x0A
	db 0x00
__str_1:
	db 'f='
	db 0x00
__str_2:
	db 'Hz, count='
	db 0x00
__str_3:
	db 0x0D
	db 0x00
__str_4:
	db 'NO SIGNAL'
	db 0x0D
	db 0x00

	CSEG

end
