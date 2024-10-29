#ifndef __SOFT_UART_H
#define __SOFT_UART_H

#ifndef _XTAL_FREQ
 // This definition is required to calibrate __delay_us() and __delay_ms()
 #define _XTAL_FREQ 4000000
#endif
#define Baudrate              1200                      //bps
#define OneBitDelay           (1000000/Baudrate)
#define DataBitCount          8                         // no parity, no flow control
#define UART_RX               GP5						// UART RX pin
#define UART_TX               GP0						// UART TX pin
#define UART_RX_DIR			  TRISIO5					// UART RX pin direction register
#define UART_TX_DIR			  TRISIO0					// UART TX pin direction register

//Function Declarations
void InitSoftUART(void);
unsigned char UART_Receive(void);
void UART_Transmit(const char);

#endif
