#ifndef TYPEDEFS_H_
#define TYPEDEFS_H_

#include "FreeRTOS.h"

#define USB_RX_BUFFER_SIZE      10
#define USB_TX_BUFFER_SIZE      10
#define CAN_TX_BUFFER_SIZE      10
#define CAN_RX_BUFFER_SIZE      10
#define USB_RX_START_VALUE      0xDE
#define USB_RX_END_VALUE        0xAD
#define USB_TX_START_VALUE      0xBE
#define USB_TX_END_VALUE        0xEF
#define USB_RX_DATA_PACKET_SIZE 10
#define USB_TX_DATA_PACKET_SIZE 12

#define CAN_DLC_MASK            0b00001111
// MACROS
#define GET_CAN_ADDRESS(data)   ((data[0] << 4) + (data[1] >> 4))
#define GET_CAN_DLC(data)       ((data[1]) & CAN_DLC_MASK)
#define GET_CAN_DATA_PTR(data)  &data[2]

/*
 * RX message type from USB.
 *
 * In the case of a CAN_SEND command:
 *  cCmd => CAN_SEND
 *  cData => |XXXX|XYYY|DDDD|...|DDDD| where
 *    X = CAN address
 *    Y = DLC
 *    D = 8 Bytes of data
*/
typedef struct {
  uint8_t cCmd;
  uint8_t cData[USB_RX_DATA_PACKET_SIZE];
} xUSB_RX_Message_t;

/*
 * TX message type to USB Serial.
 *
 * A frame will be of the format:
 * BE | DLC+ID1 | ID0 | DATA0 | DATA1 | DATA2 | DATA3 | DATA4 | DATA5 | DATA6 | DATA7 | EF
 * 
 * |DLC + ID1| => 0bddddiiii
 * So 12 bytes long.
*/
typedef uint8_t xUSB_TX_Message_t[USB_TX_DATA_PACKET_SIZE];

#endif
