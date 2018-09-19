################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.c 

OBJS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.o 

C_DEPS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/%.o: ../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32F303xC -I"C:/Users/Ardelean Calin/OneDrive/Programming_Embedded/OpenCAN/Inc" -I"C:/Users/Ardelean Calin/OneDrive/Programming_Embedded/OpenCAN/TracealyzerLib/include" -I"C:/Users/Ardelean Calin/OneDrive/Programming_Embedded/OpenCAN/Drivers/STM32F3xx_HAL_Driver/Inc" -I"C:/Users/Ardelean Calin/OneDrive/Programming_Embedded/OpenCAN/Drivers/STM32F3xx_HAL_Driver/Inc/Legacy" -I"C:/Users/Ardelean Calin/OneDrive/Programming_Embedded/OpenCAN/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F" -I"C:/Users/Ardelean Calin/OneDrive/Programming_Embedded/OpenCAN/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"C:/Users/Ardelean Calin/OneDrive/Programming_Embedded/OpenCAN/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"C:/Users/Ardelean Calin/OneDrive/Programming_Embedded/OpenCAN/Drivers/CMSIS/Device/ST/STM32F3xx/Include" -I"C:/Users/Ardelean Calin/OneDrive/Programming_Embedded/OpenCAN/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/Users/Ardelean Calin/OneDrive/Programming_Embedded/OpenCAN/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS" -I"C:/Users/Ardelean Calin/OneDrive/Programming_Embedded/OpenCAN/Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


