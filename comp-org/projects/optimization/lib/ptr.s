	.text
	.globl	opt_ptr
opt_ptr:
.LFB0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4000016, %esp
	leal	-4000004(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	.L2
.L3:
	movl	-4(%ebp), %eax
	movl	$0, (%eax)
	addl	$4, -4(%ebp)
.L2:
	leal	-4000004(%ebp), %eax
	addl	$4000000, %eax
	cmpl	%eax, -4(%ebp)
	jb	.L3
	leave
	ret
