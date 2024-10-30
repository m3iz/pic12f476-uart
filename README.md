# PIC UART GPIO Control Project

This project implements UART communication on a PIC12F675 microcontroller, allowing control and monitoring of GPIO pins through a serial interface. The firmware facilitates reading the states of GPIO pins and setting their states (high or low) based on received commands.

## Features

- **UART Communication:** Handles serial communication with customizable baud rates.
- **GPIO Control:** Read the states of GPIO pins (GP2 to GP5) and set their states to high or low.
- **Command Processing:** Processes simple commands for GPIO control, ensuring efficient performance suitable for PIC microcontrollers.
- **Error Handling:** Returns meaningful messages for invalid commands and data formats.

## Hardware Requirements

- PIC12F675 microcontroller
- An LED or other output device connected to GP2 to GP5 for testing
- A UART-compatible interface (USB-to-serial adapter) for communication with a computer
- Optional: Push buttons or other input devices to test GPIO functionality

## Setup Instructions

1. **Microcontroller Setup:**
   - Connect the PIC12F675 to your programming device.
   - Ensure that the necessary libraries for XC8 are installed.
   - Include the `xc.h` header for the PIC compiler.

2. **Programming:**
   - Load the provided firmware into the PIC12F675 using a compatible programmer.
   - Modify the `_XTAL_FREQ` macro as per your crystal oscillator frequency if needed.

3. **Serial Communication:**
   - Use a terminal program (like PuTTY, Tera Term, or a custom Python application) to communicate with the PIC via UART.
   - Set the baud rate to match the one defined in the firmware (default is 1200 bps).

## Command Format

The following commands are supported for GPIO control:

- **Read GPIO States:** 
  - Command: `0`
  - Response: `{1/0,1/0,0/1,1/0,1/0}` where each digit corresponds to the state of GP2 to GP5.
  
- **Set GPIO High:**
  - Command: `X` (replace `X` with the pin number 2-5)
  - Example: `3` sets GP3 high.

- **Set GPIO Low:**
  - Command: `X` (replace `X` with the pin number 2-5 minus 4)
  - Example: `9` sets GP5 low.

## Example Usage

1. **Open the serial port** using your terminal application or custom GUI.
2. **Send Commands** using the input field or terminal:
   - To read GPIO states, send: `0`.
   - To set a GPIO pin high, send pin number: `2`-`5`.
   - To set a GPIO pin low, send number accourding to pin - : `6` - `9`.
3. **Receive and process responses** from the microcontroller.

## Troubleshooting

- Ensure that the baud rate matches on both the PIC firmware and the terminal program.
- Check wiring connections to ensure GPIO pins are correctly set up.
- Monitor the output for any invalid command responses and adjust commands as needed.
- 
## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Microchip Technology for the PIC microcontroller.
- Open-source libraries for UART and GPIO handling.
