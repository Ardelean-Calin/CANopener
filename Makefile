.DEFAULT_GOAL := all
.PHONY: directories elf clean

MKDIR_P = mkdir -p

# Make does not offer a recursive wildcard function, so here's one:
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-gcc

OUT_NAME = OpenCAN.elf
OUT_DIR = build

CFLAGS = -Wall \
		 -DSTM32F303xC \
		 -DUSE_HAL_DRIVER \
		 '-D__weak=__attribute__((weak))' \
		 '-D__packed=__attribute__((__packed__))' \
		 -mcpu=cortex-m4 \
		 -mthumb \
		 -mfloat-abi=hard \
		 -mfpu=fpv4-sp-d16 \
		 -g3 \
		 -Og

LDFLAGS = -T"STM32F303CBTx_FLASH.ld" -Wl,-Map,OpenCAN.map -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -specs=nosys.specs -specs=nano.specs -Wl,--gc-sections

# Includes
CFLAGS += -I.
CFLAGS += -IInc
CFLAGS += -IDrivers/STM32F3xx_HAL_Driver/Inc
CFLAGS += -IDrivers/STM32F3xx_HAL_Driver/Inc/Legacy
CFLAGS += -IMiddlewares/ST/STM32_USB_Device_Library/Core/Inc
CFLAGS += -IMiddlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc
CFLAGS += -IMiddlewares/Third_Party/FreeRTOS/Source/include
CFLAGS += -IMiddlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS
CFLAGS += -IMiddlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F
CFLAGS += -IDrivers/CMSIS/Include
CFLAGS += -IDrivers/CMSIS/Device/ST/STM32F3xx/Include
CFLAGS += -ITracealyzerLib/include

ASFLAGS = -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -g -o

# These are all the sources that need to be compiled for ulterior linking
SOURCES = $(call rwildcard,Drivers,*.c) \
		  $(call rwildcard,Middlewares,*.c) \
		  $(call rwildcard,Src,*.c) \
		  $(call rwildcard,TracealyzerLib,*.c)

OBJECTS = $(patsubst %.c,%.o, $(SOURCES))
OBJECTS += startup/startup_stm32f303xc.o

all: directories program

# Create output directory(s) if it doesn't exist
directories: $(OUT_DIR)
$(OUT_DIR):
	$(MKDIR_P) $(OUT_DIR)

# Program will just generate an .elf in the given output folder
program: $(OUT_DIR)/$(OUT_NAME)

# The main .elf file depends on the objects and on the linker file
%.elf: $(OBJECTS) STM32F303CBTx_FLASH.ld
	$(LD) $(LDFLAGS) -o $@ $(OBJECTS) -lm

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@


%.o: %.s
	$(AS) $(ASFLAGS) $@ $<

clean:
	rm -f $(OBJECTS)
	rm -f $(OUT_DIR)/$(OUT_NAME)