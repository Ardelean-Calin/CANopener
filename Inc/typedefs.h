#ifndef TYPEDEFS_H_
#define TYPEDEFS_H_

#include "FreeRTOS.h"

#define CAN_TX_BUFFER_SIZE 10
#define CAN_RX_BUFFER_SIZE 10

// Fixed packet size for USB messages
#define USB_DEC_PACKET_SIZE (16U)
#define USB_ENC_PACKET_SIZE (USB_DEC_PACKET_SIZE + 2)

typedef struct
{
    uint8_t ucSize;
    uint8_t pucData[USB_DEC_PACKET_SIZE];
} xUSBTxFrame_t;

#endif
