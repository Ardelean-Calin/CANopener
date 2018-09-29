.DEFAULT_GOAL := all
.PHONY: directories elf clean

# User defined functions
MKDIR_P = mkdir -p
# Make does not offer a recursive wildcard function, so here's one:
# rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

# Executables for compiler, assembler and linker
CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-gcc

# Output file name and location
OUT_NAME = OpenCAN.elf
OUT_DIR = build

# Standard cflags
CFLAGS = -Wall \
		 -DSTM32F303xC \
		 -DUSE_HAL_DRIVER \
		 '-D__weak=__attribute__((weak))' \
		 '-D__packed=__attribute__((__packed__))' \
		 -mcpu=cortex-m4 \
		 -mthumb \
		 -mfloat-abi=hard \
		 -mfpu=fpv4-sp-d16 

# Debug flags. By default, debug is disabled
CFLAGS_DEBUG = -g3 -Og
DEBUG ?= 0
ifeq ($(DEBUG), 1)
    CFLAGS += $(CFLAGS_DEBUG)
endif

# Linker flags, here we specify the .ld script
LDFLAGS = -T"STM32F303CBTx_FLASH.ld" -Wl,-Map,$(basename $(OUT_NAME)).map -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -specs=nosys.specs -specs=nano.specs -Wl,--gc-sections
# Assembler flags needed for startup_stm32f303xc.s
ASFLAGS = -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -g -o

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

# These are all the sources that need to be compiled for ulterior linking
SOURCES = $(call rwildcard,Drivers,*.c) \
		  $(call rwildcard,Middlewares,*.c) \
		  $(call rwildcard,Src,*.c) \
		  $(call rwildcard,TracealyzerLib,*.c)
# And the equivalend object files to be created
OBJECTS = $(patsubst %.c,%.o, $(SOURCES))
OBJECTS += startup/startup_stm32f303xc.o

# Now we start with the rules
# To generate an .elf we need to:
# 	1. Compile all required .o files (for our code and the libraries used)
#	2. Link all the object files into one .elf file using the liker script
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

# Clean as ice
clean:
	rm -f $(OBJECTS)
	rm -f $(basename $(OUT_NAME)).map
	rm -f $(OUT_DIR)/$(OUT_NAME)