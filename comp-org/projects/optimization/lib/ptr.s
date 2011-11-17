	.file	"ptr.c"
	.text
	.globl	ptr
	.type	ptr, @function
ptr:
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
	leal	-1000012(%ebp), %eax
	movl	%eax, -1000016(%ebp)
	jmp	.L2
.L3:
	movl	-1000016(%ebp), %eax
	movb	$0, (%eax)
	addl	$1, -1000016(%ebp)
.L2:
	leal	-1000012(%ebp), %eax
	addl	$1000000, %eax
	cmpl	%eax, -1000016(%ebp)
	jb	.L3
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
	.size	ptr, .-ptr
	.ident	"GCC: (Ubuntu/Linaro 4.6.1-9ubuntu3) 4.6.1"
	.section	.note.GNU-stack,"",@progbits
