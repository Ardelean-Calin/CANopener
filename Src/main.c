
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * This notice applies to any and all portions of this file
  * that are not between comment pairs USER CODE BEGIN and
  * USER CODE END. Other portions of this file, whether 
  * inserted by the user or by software development tools
  * are owned by their respective copyright owners.
  *
  * Copyright (c) 2018 STMicroelectronics International N.V. 
  * All rights reserved.
  *
  * Redistribution and use in source and binary forms, with or without 
  * modification, are permitted, provided that the following conditions are met:
  *
  * 1. Redistribution of source code must retain the above copyright notice, 
  *    this list of conditions and the following disclaimer.
  * 2. Redistributions in binary form must reproduce the above copyright notice,
  *    this list of conditions and the following disclaimer in the documentation
  *    and/or other materials provided with the distribution.
  * 3. Neither the name of STMicroelectronics nor the names of other 
  *    contributors to this software may be used to endorse or promote products 
  *    derived from this software without specific written permission.
  * 4. This software, including modifications and/or derivative works of this 
  *    software, must execute solely and exclusively on microcontroller or
  *    microprocessor devices manufactured by or for STMicroelectronics.
  * 5. Redistribution and use of this software other than as permitted under 
  *    this license is void and will automatically terminate your rights under 
  *    this license. 
  *
  * THIS SOFTWARE IS PROVIDED BY STMICROELECTRONICS AND CONTRIBUTORS "AS IS" 
  * AND ANY EXPRESS, IMPLIED OR STATUTORY WARRANTIES, INCLUDING, BUT NOT 
  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
  * PARTICULAR PURPOSE AND NON-INFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY
  * RIGHTS ARE DISCLAIMED TO THE FULLEST EXTENT PERMITTED BY LAW. IN NO EVENT 
  * SHALL STMICROELECTRONICS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
  * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
  * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
  * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
  * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
  * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "stm32f3xx_hal.h"
#include "cmsis_os.h"
#include "usb_device.h"
#include "usbd_cdc_if.h"
#include "RTE.h"

/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private variables ---------------------------------------------------------*/

osThreadId defaultTaskHandle;

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_CAN_Init(void);

void USB_DEVICE_MasterHardReset(void);

// Tasks
void vUSBRxDecoderTask(void* const pvParameters);
void vCANRxEncoderTask(void* const pvParameters);
void vCANTransmitTask(void* const pvParameters);
void vCANReceiveTask(void* const pvParameters);

/* USER CODE BEGIN PFP */
/* Private function prototypes -----------------------------------------------*/

/* USER CODE END PFP */

/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  *
  * @retval None
  */
int main(void)
{

    /* MCU Configuration----------------------------------------------------------*/

    /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
    HAL_Init();

    /* Configure the system clock */
    SystemClock_Config();

    /* Initialize all configured peripherals */
    MX_GPIO_Init();
    MX_CAN_Init();

    /* init code for USB_DEVICE */
    USB_DEVICE_MasterHardReset();
    MX_USB_DEVICE_Init();

    vTraceEnable(TRC_START);

    cRingBufferIndex = 0;

    /* USER CODE BEGIN RTOS_THREADS */
    xTaskCreate(vUSBRxDecoderTask, "USB_RX_DECODER", 128, NULL, 1, NULL);
//    xTaskCreate(vCANRxEncoderTask, "CAN_RX_ENCODER", 128, NULL, 1, NULL);
    xTaskCreate(vCANTransmitTask, "CAN_TRANSMIT", 128, NULL, 3, NULL);
    xTaskCreate(vCANReceiveTask, "CAN_RECEIVE", 128, NULL, 1, NULL);
    /* USER CODE END RTOS_THREADS */

    /* USER CODE BEGIN RTOS_QUEUES */
    xUSBReceiveQueue  = xQueueCreate(USB_RX_BUFFER_SIZE, sizeof(USB_RX_Message_t *));
//    xUSBTransmitQueue = xQueueCreate(USB_TX_BUFFER_SIZE, sizeof(USB_TX_Message_t *));
//    xCANReceiveQueue  = xQueueCreate(CAN_RX_BUFFER_SIZE, sizeof(CanRxMsgTypeDef *));
    xCANTransmitQueue = xQueueCreate(CAN_TX_BUFFER_SIZE, sizeof(CanTxMsgTypeDef *));
    /* USER CODE END RTOS_QUEUES */

    /* Start scheduler */
    vTaskStartScheduler();

    /* We should never get here as control is now taken by the scheduler */

    /* USER CODE BEGIN WHILE */
    while (1){}
    /* USER CODE END 3 */
}

void vUSBRxDecoderTask(void* const pvParameters)
{
    USB_RX_Message_t* xUSBMessage;
    CanTxMsgTypeDef *xTXMessage;

    for (;;)
    {
        xQueueReceive(xUSBReceiveQueue, &(xUSBMessage), portMAX_DELAY);

        // TODO: Ring buffer of X elements (10 maybe for starters?)
        xTXMessage = &xCANTransmitBuffer[0];

        uint8_t cCmd = xUSBMessage->cCmd;
        uint8_t *cData = xUSBMessage->cData;

        switch (cCmd)
        {
        case CAN_SEND:
            xTXMessage->StdId = (uint32_t)GET_CAN_ADDRESS(cData);
            xTXMessage->DLC = (uint32_t)GET_CAN_DLC(cData);
            xTXMessage->IDE = (uint32_t)CAN_ID_STD;
            xTXMessage->RTR = (uint32_t)CAN_RTR_DATA;
            memcpy(&xTXMessage->Data[0], GET_CAN_DATA_PTR(cData), 8);
            xQueueSend(xCANTransmitQueue, (void *)&xTXMessage, 0);
            break;
        default:
            break;
        }
    }
}

/*
 * This task encodes the received CAN frame into an USB message and sends it to
 * the USB transmit queue.
 */
void vCANRxEncoderTask(void* const pvParameters)
{
	for (;;){}
}
/*
 * This task transmits the CAN messages scheduled for transmission.
 * TODO: Have the ringbuffer index get locked and unlocked using a binary semaphore or something
 */
void vCANTransmitTask(void* const pvParameters)
{
    CanTxMsgTypeDef *xCANTxMessage = hcan.pTxMsg;
    for (;;)
    {
        xQueueReceive(xCANTransmitQueue, &(xCANTxMessage), portMAX_DELAY);
        hcan.pTxMsg = xCANTxMessage;
        // TODO: What timeout should I put?
        HAL_CAN_Transmit(&hcan, 0);
    }
}


void vCANReceiveTask(void* const pvParameters)
{
    volatile HAL_StatusTypeDef status;
    // TODO: Maybe also monitor FIFO overrun errors? HAL_CAN_ERROR_FOV0
    CanRxMsgTypeDef *xCANRxMessage = &xCANReceiveBuffer[0];
    // Basically set in which structure to receive the CAN message
    hcan.pRxMsg = xCANRxMessage;
    for (;;)
    {
        status = HAL_CAN_Receive(&hcan, CAN_FIFO0, 10U);
        if(status == HAL_OK){
        	status = HAL_OK;
        }
    }
}

void USB_DEVICE_MasterHardReset(void)
{
    GPIO_InitTypeDef GPIO_InitStruct;
    GPIO_InitStruct.Pin = GPIO_PIN_12;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_PULLDOWN;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_12, 0);
    HAL_Delay(1000);
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{

    RCC_OscInitTypeDef RCC_OscInitStruct;
    RCC_ClkInitTypeDef RCC_ClkInitStruct;
    RCC_PeriphCLKInitTypeDef PeriphClkInit;

    /**Initializes the CPU, AHB and APB busses clocks 
    */
    RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
    RCC_OscInitStruct.HSEState = RCC_HSE_BYPASS;
    RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV2;
    RCC_OscInitStruct.HSIState = RCC_HSI_ON;
    RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
    RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
    RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL9;
    if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
    {
        _Error_Handler(__FILE__, __LINE__);
    }

    /**Initializes the CPU, AHB and APB busses clocks 
    */
    RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
    RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
    RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
    RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
    RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

    if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
    {
        _Error_Handler(__FILE__, __LINE__);
    }

    PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USB;
    PeriphClkInit.USBClockSelection = RCC_USBCLKSOURCE_PLL_DIV1_5;
    if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
    {
        _Error_Handler(__FILE__, __LINE__);
    }

    /**Configure the Systick interrupt time 
    */
    HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq() / 1000);

    /**Configure the Systick 
    */
    HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

    /* SysTick_IRQn interrupt configuration */
    HAL_NVIC_SetPriority(SysTick_IRQn, 15, 0);
}

/* CAN init function */
static void MX_CAN_Init(void)
{
    CAN_FilterConfTypeDef  sFilterConfig;

    hcan.Instance = CAN;
    hcan.Init.Prescaler = 9;
    hcan.Init.Mode = CAN_MODE_NORMAL;
    hcan.Init.SJW = CAN_SJW_1TQ;
    hcan.Init.BS1 = CAN_BS1_6TQ;
    hcan.Init.BS2 = CAN_BS1_1TQ;
    hcan.Init.TTCM = DISABLE;
    hcan.Init.ABOM = DISABLE;
    hcan.Init.AWUM = DISABLE;
    hcan.Init.NART = DISABLE;
    hcan.Init.RFLM = DISABLE;
    hcan.Init.TXFP = DISABLE;
    if (HAL_CAN_Init(&hcan) != HAL_OK)
    {
        _Error_Handler(__FILE__, __LINE__);
    }

     sFilterConfig.FilterNumber = 0;
     sFilterConfig.FilterMode = CAN_FILTERMODE_IDMASK;
     sFilterConfig.FilterScale = CAN_FILTERSCALE_32BIT;
     sFilterConfig.FilterIdHigh = 0x0000;
     sFilterConfig.FilterIdLow = 0x0000;
     sFilterConfig.FilterMaskIdHigh = 0x0000;
     sFilterConfig.FilterMaskIdLow = 0x0000;
     sFilterConfig.FilterFIFOAssignment = CAN_FILTER_FIFO0;
     sFilterConfig.FilterActivation = ENABLE;
     sFilterConfig.BankNumber = 0;

    if (HAL_CAN_ConfigFilter(&hcan, &sFilterConfig) != HAL_OK)
    {
        /* Filter configuration Error */
        _Error_Handler(__FILE__, __LINE__);
    }
}

/** Configure pins as 
        * Analog 
        * Input 
        * Output
        * EVENT_OUT
        * EXTI
*/
static void MX_GPIO_Init(void)
{

    /* GPIO Ports Clock Enable */
    __HAL_RCC_GPIOF_CLK_ENABLE();
    __HAL_RCC_GPIOA_CLK_ENABLE();
    __HAL_RCC_GPIOB_CLK_ENABLE();
}


/* USER CODE BEGIN 4 */

/* USER CODE END 4 */


/**
  * @brief  Period elapsed callback in non blocking mode
  * @note   This function is called  when TIM3 interrupt took place, inside
  * HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
  * a global variable "uwTick" used as application time base.
  * @param  htim : TIM handle
  * @retval None
  */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
    /* USER CODE BEGIN Callback 0 */

    /* USER CODE END Callback 0 */
    if (htim->Instance == TIM3)
    {
        HAL_IncTick();
    }
    /* USER CODE BEGIN Callback 1 */

    /* USER CODE END Callback 1 */
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @param  file: The file name as string.
  * @param  line: The line in file as a number.
  * @retval None
  */
void _Error_Handler(char *file, int line)
{
    /* USER CODE BEGIN Error_Handler_Debug */
    /* User can add his own implementation to report the HAL error return state */
    while (1)
    {
    }
    /* USER CODE END Error_Handler_Debug */
}

#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
    /* USER CODE BEGIN 6 */
    /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
    /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
