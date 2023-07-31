#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/string.h>


#define INIT_BALANCE 2000000
#define ACCOUNT_COUNT 100

#define DEVICE_NAME "my_bank_module"

MODULE_LICENSE("GPL");
static int iut_open(struct inode*, struct file*);
static int iut_release(struct inode*, struct file*);
static ssize_t iut_read(struct file*, char*, size_t, loff_t*);
static ssize_t iutmodule_write(struct file* filep, const char* buffer, size_t len, loff_t* offset);
static struct file_operations fops = {
   .open = iut_open,
   .read = iut_read,
   .write = iutmodule_write,
   .release = iut_release,
};

static int major; // device major number. driver reacts to this major number.

struct bank {
	int acc[ACCOUNT_COUNT]; 	
};
static struct bank bal;





static int __init iut_init(void) {
    major = register_chrdev(0, DEVICE_NAME, &fops); // 0: auto major ||| name is displayed in /proc/devices ||| fops.
    if (major < 0) {
        printk(KERN_ALERT "Device001 load failed!\n");
        return major;
    }
	int i = 0;
	while (i < ACCOUNT_COUNT)
	{
		bal.acc[i] = INIT_BALANCE;
		i++;
	}
    printk(KERN_INFO "iut device module has been loaded: %d\n", major);
    return 0;
}

static void __exit iut_exit(void) {
    unregister_chrdev(major, DEVICE_NAME);
    printk(KERN_INFO " iut device module has been unloaded.\n");
}

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


static int iut_open(struct inode *inodep, struct file *filep) {
   printk(KERN_INFO " iut  device opened.\n");
   return 0;
}

static int iut_release(struct inode *inodep, struct file *filep) {
   printk(KERN_INFO "iut  device closed.\n");
   return 0;
}

static ssize_t iut_read(struct file *filep, char *buffer, size_t len, loff_t *offset) {
	int errors = 0;
    char message[2048] = "";
	char acc[10];
	int i = 0;
    while (i < ACCOUNT_COUNT)
    {
		sprintf(acc, "%d,", bal.acc[i]);
		strcat(message, acc);
        // strcat(message, atoi(bal.acc[i]));
		// strcat(message, ", ");
		i++;
    }
	errors = copy_to_user(buffer, message, strlen(message));
	return errors == 0 ? strlen(message) : -EFAULT;
}

static ssize_t iutmodule_write(struct file* filep, const char* buffer, size_t len, loff_t* offset){
	
	char message[2048];
	copy_from_user(message, buffer, len);
	printk("i recived: %s\n", message);
	char type_of_transaction = message[0];
	int output[3];
	decode_input(message, output);
	int from = output[0];
	int to = output[1];
	int amount = output[2];
	printk(KERN_INFO "%s\n", message);
	if (type_of_transaction == 't')
	{
		if (amount > bal.acc[from])
		{
			printk(KERN_ALERT "more than the balance\n");
		}
		else
		{
			bal.acc[from] -= amount;
			bal.acc[to] += amount;
			printk(KERN_INFO "%d transferred from %d to %d\n", amount, from, to);
		}
	}
	else if (type_of_transaction == 'd')
	{
		bal.acc[to] += amount;
		printk(KERN_INFO "%d depositted to %d\n", amount, to);
	}
	else if (type_of_transaction == "w")
	{
		if (amount > bal.acc[from])
		{
			printk(KERN_ALERT "more than the balance\n");
		}
		else
		{
			bal.acc[from] -= amount;
			printk(KERN_INFO "%d withdrawed from %d\n", amount, from);
		}
	}
	else
	{
		printk(KERN_ALERT "input not valid\n");
	}
	return 0;
}

module_init(iut_init);
module_exit(iut_exit);
