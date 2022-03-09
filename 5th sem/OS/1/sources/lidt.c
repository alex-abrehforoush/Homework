#include <stdint.h>

struct IdtRecord
{
    uint16_t  limit;
    uintptr_t base;
};

int main()
{
	struct IdtRecord* x;
	__asm__("lidt %0" : : "m" (*x));
	return 0;
}