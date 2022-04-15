	.text
	.globl	test_and_set

/**
 * test_and_set: assume it's called with test_and_set(&lock);
 * @param lock pointer to a mutex_t variable
 *
 * TODO - add a comment each line describing its action
 */
test_and_set:
	cli
	pushl	%ebx		# preserve contents of the %ebx register, which is about to be modified
	movl	8(%esp), %ebx	# copy contents of %esp (stack pointer) with an offset of 8 into %ebx
	movl	$1, %eax	# copy the value 1 into %eax
	xchg	%eax, (%ebx)	# swap the value stored in %eax and the memory address referenced by %ebx
	popl	%ebx		# pop the old value of the %ebx register off the stack and store back in %ebx
	sti
	ret			# return to caller
