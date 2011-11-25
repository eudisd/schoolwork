	.file	"iter.c"
	.text
	.globl	iter
	.type	iter, @function
iter:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
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
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	iter, .-iter
	.ident	"GCC: (Ubuntu/Linaro 4.6.1-9ubuntu3) 4.6.1"
	.section	.note.GNU-stack,"",@progbits
