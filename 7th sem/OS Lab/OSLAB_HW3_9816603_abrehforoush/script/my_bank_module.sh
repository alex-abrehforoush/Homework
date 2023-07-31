!/bin/bash

make

insmod char_device.ko

major_code=$(cat /proc/devices | grep my_bank_module | sed 's/[^0-9]*//g')

mknod /dev/banknode c $major_code 0

./user.out /tst1 t,1,2,1000

rm /dev/tst1
rmmod my_bank_module

make clean