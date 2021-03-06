;; int strcmp(const char *s1, const char *s2);
;; compares the two strings s1 and s2. It returns an integer less than, equal to, or greater than zero if s1 is found, respectively, to be less than, to match, or be greater than s2.

section .text
	global strcmp:function

strcmp:
	push rbp
	mov rbp, rsp

	mov rax, 0			; rax = 0
	mov rcx, 0			; rcx = 0
cwhile:					; do {
	movzx rax, byte [rdi+rcx]	;   rax = *(s1 + rcx)
	movzx rdx, byte [rsi+rcx]	;   rdx = *(s2 + rcx)
	inc rcx				;   rcx++
while:					; } while (
	cmp al, 0			;  al != 0
	je done				;   &&
	cmp dl, 0			;  dl != 0
	je done				;   &&
	cmp al, dl			;  al == dl)
	je cwhile			; )
done:
	sub rax, rdx			; rax = rbx - rax;
return:
	leave
	ret				; return rax
