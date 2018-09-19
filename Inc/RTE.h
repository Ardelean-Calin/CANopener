/*
 * RTE.h
 *
 *  Created on: Jun 23, 2018
 *      Author: Ardelean Calin
 */

#ifndef RTE_H_
#define RTE_H_

#include "FreeRTOS.h"
#include "queue.h"

#define USB_RX_BUFFER_SIZE      10
#define CAN_TX_BUFFER_SIZE      10
#define CAN_RX_BUFFER_SIZE      10
#define RXPROTOCOL_START_VALUE  0xDE
#define RXPROTOCOL_END_VALUE    0xAD
#define DATA_PACKET_SIZE        10

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
  uint8_t cData[DATA_PACKET_SIZE];
} USB_RX_Message_t;

USB_RX_Message_t xRxRingBuffer[USB_RX_BUFFER_SIZE];

uint8_t cRingBufferIndex;

CanTxMsgTypeDef xCANTransmitBuffer[CAN_TX_BUFFER_SIZE];
CanRxMsgTypeDef xCANReceiveBuffer[CAN_RX_BUFFER_SIZE];

enum {
  CAN_SEND = 0,
  CAN_SET_BAUDRATE
};

CAN_HandleTypeDef hcan;

// Queues
QueueHandle_t xUSBReceiveQueue;
QueueHandle_t xCANTransmitQueue;

#endif /* RTE_H_ */
