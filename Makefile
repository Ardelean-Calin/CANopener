.DEFAULT_GOAL := all
.PHONY: directories elf clean

# User defined functions
MKDIR_P = mkdir -p
# Make does not offer a recursive wildcard function, so here's one:
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

# Executables for compiler, assembler and linker
CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy

# Output file name and location
OUT_NAME = OpenCAN
OUT_DIR = build

ELF = $(OUT_DIR)/$(OUT_NAME).elf
HEX = $(OUT_DIR)/$(OUT_NAME).hex
BIN = $(OUT_DIR)/$(OUT_NAME).bin

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

# Linker flags, here we specify the .ld script
LDFLAGS = -T"STM32F303CBTx_FLASH.ld" -Wl,-Map,$(OUT_NAME).map -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -specs=nosys.specs -specs=nano.specs
# Assembler flags needed for startup_stm32f303xc.s
ASFLAGS = -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16

# Debug flags. By default, debug is disabled
CFLAGS_DEBUG = -g3 -Og -DDEBUG
CFLAGS_RELEASE = -Os -fdata-sections -ffunction-sections # Separate code into different sections/functions
LDFLAGS_DEBUG =
LDFLAGS_RELEASE = -Wl,--gc-sections
ASFLAGS_DEBUG = -g
ASFLAGS_RELEASE =

DEBUG ?= 0
ifeq ($(DEBUG), 1)
    CFLAGS += $(CFLAGS_DEBUG)
else
	CFLAGS += $(CFLAGS_RELEASE)
endif
ifeq ($(DEBUG), 1)
    LDFLAGS += $(LDFLAGS_DEBUG)
else
	LDFLAGS += $(LDFLAGS_RELEASE)
endif
ifeq ($(DEBUG), 1)
    ASFLAGS += $(ASFLAGS_DEBUG)
else
	ASFLAGS += $(ASFLAGS_RELEASE)
endif

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
		  $(call rwildcard,TracealyzerLib,*.c) \
		  startup/startup_stm32f303xc.s
INCLUDES = $(call rwildcard,Inc,*.h) \
		   $(call rwildcard,Middlewares,*.h)
# And the equivalend object files to be created
OBJECTS = $(patsubst %.s,%.o,$(patsubst %.c,%.o,$(SOURCES)))

# Now we start with the rules
# To generate an .elf we need to:
# 	1. Compile all required .o files (for our code and the libraries used)
#	2. Link all the object files into one .elf file using the liker script
all: directories elf hex bin

# Create output directory(s) if it doesn't exist
directories: $(OUT_DIR)
$(OUT_DIR):
	$(MKDIR_P) $(OUT_DIR)

# Program will just generate an .elf in the given output folder
# Depends on SOURCES and INCLUDES so that any change to those will prompt rebuild
elf: directories $(ELF) $(SOURCES) $(INCLUDES)

# Hex will generate an .hex from the .elf
hex: $(ELF)
	$(OBJCOPY) -O ihex $^ $(HEX)

# Bin will generate an .bin from the .elf
bin: $(ELF)
	$(OBJCOPY) -O binary $^ $(BIN)

# The main .elf file depends on the objects and on the linker file
%.elf: $(OBJECTS) STM32F303CBTx_FLASH.ld
	$(LD) $(LDFLAGS) -o $@ $(wildcard $(OUT_DIR)/*.o) -lm
	rm -f $(wildcard $(OUT_DIR)/*.o)

# Objects will be output in the build directory. Just leave $@ if we don't want that
%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $(OUT_DIR)/$(notdir $@)

# Create assembly file (.s)
%.o: %.s
	$(AS) $(ASFLAGS) -o $(OUT_DIR)/$(notdir $@) $<

# Clean as ice
clean:
	rm -f $(OUT_DIR)/*
	rm -f $(OUT_NAME).map
