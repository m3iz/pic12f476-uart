opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	12F675
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 10 "C:\Users\Saeed\Desktop\PIC12F675 Soft UART Code\Code\Main.c"
	psect config,class=CONFIG,delta=2 ;#
# 10 "C:\Users\Saeed\Desktop\PIC12F675 Soft UART Code\Code\Main.c"
	dw 0x31FC & 0x31F7 & 0x31EF & 0x31DF & 0x31FF & 0x31FF & 0x31FF ;#
	FNCALL	_main,_InitSoftUART
	FNCALL	_main,_UART_Receive
	FNCALL	_main,_UART_Transmit
	FNROOT	_main
	global	_ADCON0
psect	text97,local,class=CODE,delta=2
global __ptext97
__ptext97:
_ADCON0	set	31
	global	_CMCON
_CMCON	set	25
	global	_GPIO
_GPIO	set	5
	global	_GP0
_GP0	set	40
	global	_GP1
_GP1	set	41
	global	_ANSEL
_ANSEL	set	159
	global	_TRISIO
_TRISIO	set	133
	global	_VRCON
_VRCON	set	153
	global	_TRISIO0
_TRISIO0	set	1064
	global	_TRISIO1
_TRISIO1	set	1065
	file	"SoftUART.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_InitSoftUART
??_InitSoftUART:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_InitSoftUART
?_InitSoftUART:	; 0 bytes @ 0x0
	global	??_UART_Receive
??_UART_Receive:	; 0 bytes @ 0x0
	global	?_UART_Transmit
?_UART_Transmit:	; 0 bytes @ 0x0
	global	??_UART_Transmit
??_UART_Transmit:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_UART_Receive
?_UART_Receive:	; 1 bytes @ 0x0
	ds	1
	global	UART_Receive@DataValue
UART_Receive@DataValue:	; 1 bytes @ 0x1
	global	UART_Transmit@DataValue
UART_Transmit@DataValue:	; 1 bytes @ 0x1
	ds	1
	global	UART_Receive@i
UART_Receive@i:	; 1 bytes @ 0x2
	global	UART_Transmit@i
UART_Transmit@i:	; 1 bytes @ 0x2
	ds	1
	global	main@ch
main@ch:	; 1 bytes @ 0x3
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           62      4       4

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_UART_Receive
;;   _main->_UART_Transmit

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0     206
;;                                              3 BANK0      1     1      0
;;                       _InitSoftUART
;;                       _UART_Receive
;;                      _UART_Transmit
;; ---------------------------------------------------------------------------------
;; (1) _UART_Transmit                                        3     3      0      90
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _UART_Receive                                         3     3      0      92
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _InitSoftUART                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _InitSoftUART
;;   _UART_Receive
;;   _UART_Transmit
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            0      0       0       0        0.0%
;;EEDATA              80      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;COMMON               0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;BITBANK0            3E      0       0       3        0.0%
;;BANK0               3E      4       4       4        6.5%
;;ABS                  0      0       0       5        0.0%
;;DATA                 0      0       0       6        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 21 in file "C:\Users\Saeed\Desktop\PIC12F675 Soft UART Code\Code\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ch              1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       1
;;      Temps:          0       0
;;      Totals:         0       1
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_InitSoftUART
;;		_UART_Receive
;;		_UART_Transmit
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Saeed\Desktop\PIC12F675 Soft UART Code\Code\Main.c"
	line	21
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	22
	
l1566:	
	line	24
;Main.c: 24: ANSEL = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	25
;Main.c: 25: ADCON0 = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(31)	;volatile
	line	26
	
l1568:	
;Main.c: 26: CMCON = 0x07;
	movlw	(07h)
	movwf	(25)	;volatile
	line	27
	
l1570:	
;Main.c: 27: VRCON = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(153)^080h	;volatile
	line	28
;Main.c: 28: TRISIO = 0x08;
	movlw	(08h)
	movwf	(133)^080h	;volatile
	line	29
	
l1572:	
;Main.c: 29: GPIO = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	31
	
l1574:	
;Main.c: 31: InitSoftUART();
	fcall	_InitSoftUART
	line	35
	
l1576:	
;Main.c: 34: {
;Main.c: 35: ch = UART_Receive();
	fcall	_UART_Receive
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ch)
	line	36
	
l1578:	
;Main.c: 36: UART_Transmit(ch);
	movf	(main@ch),w
	fcall	_UART_Transmit
	goto	l1576
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	38
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_UART_Transmit
psect	text98,local,class=CODE,delta=2
global __ptext98
__ptext98:

;; *************** function _UART_Transmit *****************
;; Defined at:
;;		line 55 in file "C:\Users\Saeed\Desktop\PIC12F675 Soft UART Code\Code\Software_UART.c"
;; Parameters:    Size  Location     Type
;;  DataValue       1    wreg     const unsigned char 
;; Auto vars:     Size  Location     Type
;;  DataValue       1    1[BANK0 ] const unsigned char 
;;  i               1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       2
;;      Temps:          0       1
;;      Totals:         0       3
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text98
	file	"C:\Users\Saeed\Desktop\PIC12F675 Soft UART Code\Code\Software_UART.c"
	line	55
	global	__size_of_UART_Transmit
	__size_of_UART_Transmit	equ	__end_of_UART_Transmit-_UART_Transmit
	
_UART_Transmit:	
	opt	stack 7
; Regs used in _UART_Transmit: [wreg+status,2+status,0]
;UART_Transmit@DataValue stored from wreg
	line	65
	movwf	(UART_Transmit@DataValue)
	
l1544:	
;Software_UART.c: 65: GP0 = 0;
	bcf	(40/8),(40)&7
	line	66
	
l1546:	
;Software_UART.c: 66: _delay((unsigned long)(((1000000/1200))*(4000000/4000000.0)));
	opt asmopt_off
movlw	208
movwf	(??_UART_Transmit+0)+0,f
u177:
	clrwdt
decfsz	(??_UART_Transmit+0)+0,f
	goto	u177
opt asmopt_on

	line	68
	
l1548:	
;Software_UART.c: 68: for ( unsigned char i = 0; i < 8; i++ )
	bcf	status, 5	;RP0=0, select bank0
	clrf	(UART_Transmit@i)
	line	71
	
l1554:	
;Software_UART.c: 69: {
;Software_UART.c: 71: if( ((DataValue>>i)&0x1) == 0x1 )
	movf	(UART_Transmit@DataValue),w
	movwf	(??_UART_Transmit+0)+0
	incf	(UART_Transmit@i),w
	goto	u144
u145:
	clrc
	rrf	(??_UART_Transmit+0)+0,f
u144:
	addlw	-1
	skipz
	goto	u145
	btfss	0+(??_UART_Transmit+0)+0,(0)&7
	goto	u151
	goto	u150
u151:
	goto	l713
u150:
	line	73
	
l1556:	
;Software_UART.c: 72: {
;Software_UART.c: 73: GP0 = 1;
	bsf	(40/8),(40)&7
	line	74
;Software_UART.c: 74: }
	goto	l1558
	line	75
	
l713:	
	line	77
;Software_UART.c: 75: else
;Software_UART.c: 76: {
;Software_UART.c: 77: GP0 = 0;
	bcf	(40/8),(40)&7
	line	80
	
l1558:	
;Software_UART.c: 78: }
;Software_UART.c: 80: _delay((unsigned long)(((1000000/1200))*(4000000/4000000.0)));
	opt asmopt_off
movlw	208
movwf	(??_UART_Transmit+0)+0,f
u187:
	clrwdt
decfsz	(??_UART_Transmit+0)+0,f
	goto	u187
opt asmopt_on

	line	68
	
l1560:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(UART_Transmit@i),f
	
l1562:	
	movlw	(08h)
	subwf	(UART_Transmit@i),w
	skipc
	goto	u161
	goto	u160
u161:
	goto	l1554
u160:
	
l712:	
	line	84
;Software_UART.c: 81: }
;Software_UART.c: 84: GP0 = 1;
	bsf	(40/8),(40)&7
	line	85
	
l1564:	
;Software_UART.c: 85: _delay((unsigned long)(((1000000/1200))*(4000000/4000000.0)));
	opt asmopt_off
movlw	208
movwf	(??_UART_Transmit+0)+0,f
u197:
	clrwdt
decfsz	(??_UART_Transmit+0)+0,f
	goto	u197
opt asmopt_on

	line	86
	
l715:	
	return
	opt stack 0
GLOBAL	__end_of_UART_Transmit
	__end_of_UART_Transmit:
;; =============== function _UART_Transmit ends ============

	signat	_UART_Transmit,4216
	global	_UART_Receive
psect	text99,local,class=CODE,delta=2
global __ptext99
__ptext99:

;; *************** function _UART_Receive *****************
;; Defined at:
;;		line 16 in file "C:\Users\Saeed\Desktop\PIC12F675 Soft UART Code\Code\Software_UART.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    2[BANK0 ] unsigned char 
;;  DataValue       1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       2
;;      Temps:          0       1
;;      Totals:         0       3
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text99
	file	"C:\Users\Saeed\Desktop\PIC12F675 Soft UART Code\Code\Software_UART.c"
	line	16
	global	__size_of_UART_Receive
	__size_of_UART_Receive	equ	__end_of_UART_Receive-_UART_Receive
	
_UART_Receive:	
	opt	stack 7
; Regs used in _UART_Receive: [wreg+status,2+status,0]
	line	20
	
l1518:	
;Software_UART.c: 20: unsigned char DataValue = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(UART_Receive@DataValue)
	line	23
;Software_UART.c: 23: while(GP1==1);
	
l700:	
	btfsc	(41/8),(41)&7
	goto	u91
	goto	u90
u91:
	goto	l700
u90:
	line	25
	
l1520:	
;Software_UART.c: 25: _delay((unsigned long)(((1000000/1200))*(4000000/4000000.0)));
	opt asmopt_off
movlw	208
movwf	(??_UART_Receive+0)+0,f
u207:
	clrwdt
decfsz	(??_UART_Receive+0)+0,f
	goto	u207
opt asmopt_on

	line	26
;Software_UART.c: 26: _delay((unsigned long)(((1000000/1200)/2)*(4000000/4000000.0)));
	opt asmopt_off
movlw	138
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_UART_Receive+0)+0,f
u217:
decfsz	(??_UART_Receive+0)+0,f
	goto	u217
	clrwdt
opt asmopt_on

	line	28
	
l1522:	
;Software_UART.c: 28: for ( unsigned char i = 0; i < 8; i++ )
	bcf	status, 5	;RP0=0, select bank0
	clrf	(UART_Receive@i)
	line	29
	
l703:	
	line	30
;Software_UART.c: 29: {
;Software_UART.c: 30: if ( GP1 == 1 )
	btfss	(41/8),(41)&7
	goto	u101
	goto	u100
u101:
	goto	l1530
u100:
	line	32
	
l1528:	
;Software_UART.c: 31: {
;Software_UART.c: 32: DataValue += (1<<i);
	movlw	(01h)
	movwf	(??_UART_Receive+0)+0
	incf	(UART_Receive@i),w
	goto	u114
u115:
	clrc
	rlf	(??_UART_Receive+0)+0,f
u114:
	addlw	-1
	skipz
	goto	u115
	movf	0+(??_UART_Receive+0)+0,w
	addwf	(UART_Receive@DataValue),f
	line	35
	
l1530:	
;Software_UART.c: 33: }
;Software_UART.c: 35: _delay((unsigned long)(((1000000/1200))*(4000000/4000000.0)));
	opt asmopt_off
movlw	208
movwf	(??_UART_Receive+0)+0,f
u227:
	clrwdt
decfsz	(??_UART_Receive+0)+0,f
	goto	u227
opt asmopt_on

	line	28
	bcf	status, 5	;RP0=0, select bank0
	incf	(UART_Receive@i),f
	
l1532:	
	movlw	(08h)
	subwf	(UART_Receive@i),w
	skipc
	goto	u121
	goto	u120
u121:
	goto	l703
u120:
	
l704:	
	line	39
;Software_UART.c: 36: }
;Software_UART.c: 39: if ( GP1 == 1 )
	btfss	(41/8),(41)&7
	goto	u131
	goto	u130
u131:
	goto	l1540
u130:
	line	41
	
l1534:	
;Software_UART.c: 40: {
;Software_UART.c: 41: _delay((unsigned long)(((1000000/1200)/2)*(4000000/4000000.0)));
	opt asmopt_off
movlw	138
movwf	(??_UART_Receive+0)+0,f
u237:
decfsz	(??_UART_Receive+0)+0,f
	goto	u237
	clrwdt
opt asmopt_on

	line	42
;Software_UART.c: 42: return DataValue;
	bcf	status, 5	;RP0=0, select bank0
	movf	(UART_Receive@DataValue),w
	goto	l707
	line	46
	
l1540:	
;Software_UART.c: 44: else
;Software_UART.c: 45: {
;Software_UART.c: 46: _delay((unsigned long)(((1000000/1200)/2)*(4000000/4000000.0)));
	opt asmopt_off
movlw	138
movwf	(??_UART_Receive+0)+0,f
u247:
decfsz	(??_UART_Receive+0)+0,f
	goto	u247
	clrwdt
opt asmopt_on

	line	47
;Software_UART.c: 47: return 0x000;
	movlw	(0)
	line	49
	
l707:	
	return
	opt stack 0
GLOBAL	__end_of_UART_Receive
	__end_of_UART_Receive:
;; =============== function _UART_Receive ends ============

	signat	_UART_Receive,89
	global	_InitSoftUART
psect	text100,local,class=CODE,delta=2
global __ptext100
__ptext100:

;; *************** function _InitSoftUART *****************
;; Defined at:
;;		line 6 in file "C:\Users\Saeed\Desktop\PIC12F675 Soft UART Code\Code\Software_UART.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text100
	file	"C:\Users\Saeed\Desktop\PIC12F675 Soft UART Code\Code\Software_UART.c"
	line	6
	global	__size_of_InitSoftUART
	__size_of_InitSoftUART	equ	__end_of_InitSoftUART-_InitSoftUART
	
_InitSoftUART:	
	opt	stack 7
; Regs used in _InitSoftUART: []
	line	7
	
l1516:	
;Software_UART.c: 7: GP0 = 1;
	bsf	(40/8),(40)&7
	line	9
;Software_UART.c: 9: TRISIO1 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1065/8)^080h,(1065)&7
	line	10
;Software_UART.c: 10: TRISIO0 = 0;
	bcf	(1064/8)^080h,(1064)&7
	line	11
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_InitSoftUART
	__end_of_InitSoftUART:
;; =============== function _InitSoftUART ends ============

	signat	_InitSoftUART,88
psect	text101,local,class=CODE,delta=2
global __ptext101
__ptext101:
	global	btemp
	btemp set 05Eh

	DABS	1,94,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
