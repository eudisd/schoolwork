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
	subl	$1000024, %esp
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	movl	$0, -1000016(%ebp)
	jmp	.L2
.L3:
	leal	-1000012(%ebp), %eax
	addl	-1000016(%ebp), %eax
	movb	$0, (%eax)
	addl	$1, -1000016(%ebp)
.L2:
	cmpl	$999999, -1000016(%ebp)
	jle	.L3
	movl	-12(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L4
	call	__stack_chk_fail
.L4:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	iter, .-iter
	.ident	"GCC: (Ubuntu/Linaro 4.6.1-9ubuntu3) 4.6.1"
	.section	.note.GNU-stack,"",@progbits
