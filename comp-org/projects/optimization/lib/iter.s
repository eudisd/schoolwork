	.file	"iter.c"
	.text
.globl _iter
	.def	_iter;	.scl	2;	.type	32;	.endef
_iter:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	L2
L3:
	leal	-14(%ebp), %eax
	addl	-4(%ebp), %eax
	movb	$0, (%eax)
	addl	$1, -4(%ebp)
L2:
	cmpl	$9, -4(%ebp)
	jle	L3
	leave
	ret
