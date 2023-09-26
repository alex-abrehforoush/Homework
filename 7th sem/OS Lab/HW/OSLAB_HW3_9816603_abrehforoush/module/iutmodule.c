#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/uaccess.h>

#define INIT_BALANCE 2000000
#define ACCOUNT_COUNT 100

#define DEVICE_NAME "iutmodule"
MODULE_LICENSE("GPL");

/* Prototypes for device functions */
static int iutmodule_open(struct inode *, struct file *);
static int iutmodule_release(struct inode *, struct file *);
static ssize_t iutmodule_read(struct file *, char *, size_t, loff_t *);
static ssize_t iutmodule_write(struct file *, const char*, size_t, loff_t *);

static struct file_operation fops = {
	.open = iutmodule_open,
	.read = iutmodule_read,
	.write = iutmodule_write,
	.release = iutmodule_release,
};


static int major; // device major number. driver reacts to this major number.

static int __

static ssize_t iutmodule_write(struct file* filep, const char* buffer, size_t len, loff_t* offset){
	int errors = 0;
	char* message[100];
	errors = copy_to_user(buffer, message, strlen(message));
	printk(KERN_ALERT"mes: %s\n", message);
}
 

struct bank {
	int acc[ACCOUNT_COUNT]; 	
};
static struct bank bal;

int atoi(char* data){
	printk(KERN_ALERT "atoi working...\n");
	printk(KERN_ALERT "atoi input: %s\n", data);	
	int sum, i;
	sum = 0;
	for (i=0; data[i] >= '0' && data[i] <= '9' ; i++){
		sum *= 10;
		sum += (data[i] - '0');
	}
	printk(KERN_ALERT "atoi result: %d\n", sum);
	return sum;
}
int int_len(int data){
	int len = 0;
	if (!data) len++; // In case of data=0
	while(data){
		len++;
		data/=10;
	}
	return len;	
}
void decode_input(char* data, int* out){ // out: from, to, amount (-1 if '-')
	int temp;

	// from
	if (data[2] == '-') temp = -1;
	else temp = atoi(&(data[2]));
	out[0] = temp;
	printk(KERN_ALERT "out[0] set to %d and its len is %d.\n", out[0],int_len(out[0]));
	// to
	if (data[2+int_len(out[0])+1] == '-') temp = -1;
	else temp = atoi(&(data[2+int_len(out[0])+1]));
	out[1] = temp;
	printk(KERN_ALERT "out[1] set to %d and its len is %d.\n", out[1],int_len(out[1]));
	// amount
	temp = atoi(&(data[2+int_len(out[0])+1+int_len(out[1])+1]));
	out[2] = temp;
	printk(KERN_ALERT "out[2] set to %d and its len is %d.\n", out[2],int_len(out[2]));
	printk(KERN_ALERT "decoded input: %d,%d,%d\n", out[0],out[1],out[2]);
}
