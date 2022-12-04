# USB-C display board for Micro-controllers
This is a mini display board with a USB Type-C connector (carrying USB 2.0) and an onboard micro-controller.

The goal of this display board is to test and evaluate:
* The USB-C interface for a Micro-controller
    * This design uses ESP-WROOM-02
* (TENTATIVE) Implementation of an onboard battery to power the board when disconnected from power
* (TENTATIVE) Onboard battery charging capability using USB-C

![Assembled demo](./Hardware/USB-C-DB/real1-v0p7.jpg)

## Design overview
### Main page
![Main schematic](./Hardware/USB-C-DB/USB-C-DB.svg)
### Display controller hierarchy
![Display controller hierarchy](./Hardware/USB-C-DB/USB-C-DB-1-61B0EECC-Display-and-controller-61B0EECC.svg)

## License
The Software and firmware of this project is licensed under the the MIT license and the hardware is under the [Open Source Hardware](https://www.oshwa.org/definition/) license.
