/*  Name     : main.c
 *  Purpose  : Main file for software UART code for PIC12F675.
 *  Author   : Saveliev.N.R
 *  Date     : 29.10.2024
 *  Revision : None
 */
#include "Includes.h"

// Config word
__CONFIG(FOSC_INTRCIO & WDTE_OFF & PWRTE_ON & MCLRE_OFF & BOREN_ON & CP_OFF & CPD_OFF);


// Define CPU Frequency
// This must be defined, if __delay_ms() or 
// __delay_us() functions are used in the code
#define _XTAL_FREQ   20000000    


// Main function
void main()
{	
	unsigned char ch = 0;

	ANSEL  = 0x00;       // Set ports as digital I/O, not analog input
	ADCON0 = 0x00;		 // Shut off the A/D Converter
	CMCON  = 0x07;		 // Shut off the Comparator
	VRCON  = 0x00;	     // Shut off the Voltage Reference
	TRISIO = 0x08;       // GP3 input, rest all output
	GPIO   = 0x00;       // Make all pins 0
	
	InitSoftUART();		 // Intialize Soft UART

	while(1)
	{
		//ch = UART_Receive();	// Receive a character from UART
		UART_Transmit('A');		// Echo back that character
	}
}

