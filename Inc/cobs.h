#ifndef COBS_H_
#define COBS_H_

#include <stdint.h>
#include <stddef.h>

size_t ucStuffData(const uint8_t *ptr, size_t length, uint8_t *dst);
size_t ucUnStuffData(const uint8_t *ptr, size_t length, uint8_t *dst);

#endif