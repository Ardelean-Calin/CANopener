#ifndef TYPEDEFS_H_
#define TYPEDEFS_H_

#include "FreeRTOS.h"

#define CAN_TX_BUFFER_SIZE 10
#define CAN_RX_BUFFER_SIZE 10

#define USB_TX_DEC_PACKET_SIZE (10U)
#define USB_RX_ENC_PACKET_SIZE (13U)
#define USB_RX_DEC_PACKET_SIZE (USB_RX_ENC_PACKET_SIZE - 2)
#define USB_TX_ENC_PACKET_SIZE (USB_TX_DEC_PACKET_SIZE + 2)

#define CAN_DLC_MASK 0b00001111
// MACROS
#define GET_CAN_ADDRESS(data) ((data[0] << 4) + (data[1] >> 4))
#define GET_CAN_DLC(data) ((data[1]) & CAN_DLC_MASK)
#define GET_CAN_DATA_PTR(data) &data[2]

#endif
