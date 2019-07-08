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
#include "typedefs.h"

CanTxMsgTypeDef xCANTransmitBuffer[CAN_TX_BUFFER_SIZE];
CanRxMsgTypeDef xCANReceiveBuffer[CAN_RX_BUFFER_SIZE];

// Pointer to current CAN controller instance
CAN_HandleTypeDef hcan;

// Queues
QueueHandle_t xUSBReceiveQueue;
QueueHandle_t xUSBTransmitQueue;
QueueHandle_t xCANTransmitQueue;
QueueHandle_t xCANReceiveQueue;

enum
{
  RX_CAN_SEND = 0,
  TX_CAN_RECV,
  RX_PING_REQ,
  TX_PONG_SEND,
  RX_CAN_SET_BAUDRATE
};

#endif /* RTE_H_ */
