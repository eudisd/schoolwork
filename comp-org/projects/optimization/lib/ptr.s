	.file	"ptr.c"
	.text
.globl _ptr
	.def	_ptr;	.scl	2;	.type	32;	.endef
_ptr:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	leal	-14(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	L2
L3:
	movl	-4(%ebp), %eax
	movb	$0, (%eax)
	addl	$1, -4(%ebp)
L2:
	leal	-14(%ebp), %eax
	addl	$10, %eax
	cmpl	-4(%ebp), %eax
	ja	L3
	leave
	ret
