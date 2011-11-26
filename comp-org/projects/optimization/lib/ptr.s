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
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	ptr, .-ptr
	.ident	"GCC: (Ubuntu/Linaro 4.6.1-9ubuntu3) 4.6.1"
	.section	.note.GNU-stack,"",@progbits
