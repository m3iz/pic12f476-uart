#include "Includes.h"

void InitSoftUART(void)		// Initialize UART pins to proper values
{
	UART_TX = 1;			// TX pin is high in idle state
	
	UART_RX_DIR = 1;		// Input
	UART_TX_DIR = 0;		// Output
}

unsigned char UART_Receive(void)
{
	// Pin Configurations
    // GP5 is UART RX Pin

	unsigned char DataValue = 0;

	// Wait for start bit
	while(UART_RX == 1);

	__delay_us(OneBitDelay);
	__delay_us(OneBitDelay / 2);   // Take sample value in the mid of bit duration

	for ( unsigned char i = 0; i < DataBitCount; i++ )
	{
		if ( UART_RX == 1 )   // If received bit is high
		{
			DataValue += (1 << i);
		}

		__delay_us(OneBitDelay);
	}

	// Check for stop bit
	if ( UART_RX == 1 )       // Stop bit should be high
	{
		__delay_us(OneBitDelay / 2);
		return DataValue;
	}
	else                      // Some error occurred!
	{
		__delay_us(OneBitDelay / 2);
		return 0x00;
	}
}

void UART_Transmit(const char DataValue)
{
	/* Basic Logic
	   
	   TX pin is usually high. A high to low bit is the starting bit and 
	   a low to high bit is the ending bit. No parity bit. No flow control.
	   BitCount is the number of bits to transmit. Data is transmitted LSB first.

	*/

	// Send Start Bit
	UART_TX = 0;
	__delay_us(OneBitDelay);

	for ( unsigned char i = 0; i < DataBitCount; i++ )
	{
		// Set Data pin according to the DataValue
		if( ((DataValue >> i) & 0x1) == 0x1 )   // If bit is high
		{
			UART_TX = 1;
		}
		else      // If bit is low
		{
			UART_TX = 0;
		}

	    __delay_us(OneBitDelay);
	}

	// Send Stop Bit
	UART_TX = 1;
	__delay_us(OneBitDelay);
}
