#include <linux/kernel.h>
#include <linux/syscalls.h>
#include <linux/sched.h>
#include <linux/string.h>

SYSCALL_DEFINE2(getRunningProcesses, struct pr *, p, int *, s)
{
    struct task_struct *task;
    int i = 0;
    for_each_process(task)
    {
        strcpy(p[i].name, task->comm);
        p[i].pid = task->pid;
        i++;
    }
    *s = i;
    printk("Successfully copied\n");
    return i;
}