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

QueueHandle_t xUSBReceiveQueue;

// RX message type from USB.
typedef struct {
  uint8_t* pcBuffer;
  uint32_t ulLength;
} USB_RX_Message_t;

#endif /* RTE_H_ */
