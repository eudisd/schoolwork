	.text
	.globl	ptr
ptr:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$1000016, %esp
	leal	-1000004(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	.L2
.L3:
	movl	-4(%ebp), %eax
	movb	$0, (%eax)
	addl	$1, -4(%ebp)
.L2:
	leal	-1000004(%ebp), %eax
	addl	$1000000, %eax
	cmpl	%eax, -4(%ebp)
	jb	.L3
	leave
	ret
