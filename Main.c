#include <xc.h>
#include <string.h>
#define _XTAL_FREQ 4000000  // ?????????? ??????? ????????? ?????????? (????????, 4 ???)

#define Baudrate       1200                      // ???????? ???????? ?????? (???/?)
#define OneBitDelay    (1000000 / Baudrate)      // ???????? ??? ?????? ???? ? ?????????????
#define DataBitCount   8                         // ?????????? ??? ??????

#define UART_TX        GP0                       // TX ??? ??? ???????? ??????
#define UART_TX_DIR    TRISIO0                   // ??????????? ????? ??? TX
#define UART_RX        GP1                         // RX ??? ??? ?????? ??????
#define UART_RX_DIR    TRISIO1                     // ??????????? ????? ??? RX

// ???????????? ??? PIC12F675
__CONFIG(FOSC_INTRCIO & WDTE_OFF & PWRTE_ON & MCLRE_OFF & BOREN_ON & CP_OFF & CPD_OFF);

void InitSoftUART(void) {
    UART_TX = 1;          // ?????????? TX ??? ? ??????? ??????? ? ?????? ????????
    UART_TX_DIR = 0;      // ?????????? TX ??? ?????
    UART_RX_DIR = 1;      // ?????????? RX ??? ????
}

char UART_Receive(void) {
    char ReceivedValue = 0;

    // ???? ?????? ???????? (????????? ???)
    while (UART_RX == 1);  // ????????, ???? ????? RX ?? ?????? ?????? (????????? ???)

    __delay_us(OneBitDelay); // ?????????? ????? ??? ???????????? ???????

    // ?????? ?????? ??????? (LSB ??????)
    for (unsigned char i = 0; i < DataBitCount; i++) {
        ReceivedValue |= (UART_RX << i);  // ????????? ??????? ???
        __delay_us(OneBitDelay);
    }

    // ???? ????????? ???????? (???????? ???)
    __delay_us(OneBitDelay);

    return ReceivedValue;
}

void UART_Transmit(const char DataValue) {
    // ???????? ?????????? ????
    UART_TX = 0;
    __delay_us(OneBitDelay);

    // ???????? ?????? ??????? (LSB ??????)
    for (unsigned char i = 0; i < DataBitCount; i++) {
        UART_TX = (DataValue >> i) & 0x1;  // ?????????? TX ? ???????????? ? ?????
        __delay_us(OneBitDelay);
    }

    // ???????? ????????? ????
    UART_TX = 1;
    __delay_us(OneBitDelay);
}

void UART_SendString(const char* str) {
    while (*str) {            // ???? ?? ????????? ????? ??????
        UART_Transmit(*str);   // ???????? ??????? ??????
        str++;                 // ??????? ? ?????????? ???????
    }
}

void SetGPIOToInput(void) {
    // ??????? ????? GP2 - GP5 ? ????? ?????
    TRISIO3 = 1;
    TRISIO4 = 1;
    TRISIO5 = 1;
}

void ReadAndSendGPIOStates(void) {
    // ?????? ????????? ????? GP3 - GP5
    char gpioStates[5] = {0};
    gpioStates[0] = '0' + GP2;
    gpioStates[1] = '0' + GP3;  
    gpioStates[2] = '0' + GP4;  
    gpioStates[3] = '0' + GP5;  
    gpioStates[4] = '\0';       

    // ???????? ????????? ????? ??? ??????
    UART_SendString(gpioStates);
}

void SetGPIOToOutput(int pin) {
    // ????????? ??????????? ???? ??? ?????
    switch (pin) {
        case 2:
            TRISIO2 = 0;
            break;
        case 3:
            TRISIO3 = 0;
            break;
        case 4:
            TRISIO4 = 0;
            break;
        case 5:
            TRISIO5 = 0;
            break;
        default:
            break;
    }
}

void SetGPIOState(int pin, int state) {
    // ????????? ????????? ???? (0 - ??????, 1 - ???????)
    switch (pin) {
        case 2:
            GP2 = state;
            break;
        case 3:
            GP3 = state;
            break;
        case 4:
            GP4 = state;
            break;
        case 5:
            GP5 = state;
            break;
        default:
            break;
    }
}

void actions(char act){ //
    switch(act){
        case '0':   //read pins
            SetGPIOToInput();
            ReadAndSendGPIOStates();
            break;
        default:
            if((act > '1')&&(act < '6')){ //Set high state
                SetGPIOToOutput(act - '0');
                SetGPIOState(act - '0', 1);
                UART_SendString("Set to high");
            }
            else { //Set low state
                SetGPIOToOutput(act - '4');
                SetGPIOState(act - '4', 0);
                UART_SendString("Set to low");
            }
            break;
    }
}
void main() {
    // ????????? ????? ? UART
    char ch;
    ANSEL = 0x00;       // ?????????? ????? ??? ????????
    CMCON = 0x07;       // ????????? ??????????
    InitSoftUART();     // ???????????????? UART
    
    while (1) {
        ch = UART_Receive();
        actions(ch);
        __delay_ms(1000);          // ???????? ????? ????????? ?????????
    }
}
