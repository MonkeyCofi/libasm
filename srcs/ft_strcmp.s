; int ft_strcmp(const char *s1, const char *s2)

section .text
	global ft_strcmp

ft_strcmp:
	mov al, dil			; move character from first string into al register
	cmp byte al, 0		; check if the first string char is nul
	je .return			; go to return if it is
	mov bl, sil			; move character from second string into bl register
	cmp byte bl, 0		; check if second string char is nul
	je .return			; go to return if it is
	cmp byte al, bl		; compare the two characters
	jne .return			; if they are not equal, go to return
	inc rdi
	inc rsi				; otherwise increment both string pointers
	jmp ft_strcmp		; re-run the loop

.return:	
	ret