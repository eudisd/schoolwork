	.text
	.globl	iter
iter:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4000016, %esp
	movl	$0, -4(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L2
.L3:
	movl	-4(%ebp), %eax
	movl	$0, -4000004(%ebp,%eax,4)
	addl	$1, -4(%ebp)
.L2:
	cmpl	$999999, -4(%ebp)
	jle	.L3
	leave
	ret
