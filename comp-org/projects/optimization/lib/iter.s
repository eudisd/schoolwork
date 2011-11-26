	.text
	.globl	iter
iter:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$1000016, %esp
	movl	$0, -4(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L2
.L3:
	leal	-1000004(%ebp), %eax
	addl	-4(%ebp), %eax
	movb	$0, (%eax)
	addl	$1, -4(%ebp)
.L2:
	cmpl	$999999, -4(%ebp)
	jle	.L3
	leave
	ret
