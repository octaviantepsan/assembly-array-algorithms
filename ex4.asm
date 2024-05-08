.radix 16
.model small
.stack 100h
	
.data
	s db 1, 2, 3, 4, 5, 6, 7, 8
	l equ $-s
	d db l dup(?)
.code 

start:

	mov ax, @data
	mov ds, ax

	mov cx, l/2
	mov si, 0 
	mov di, 0 
	
	jcxz final	;daca cx = 0 jump
	
	repeta:
		mov al, s[si]
		mov d[di], al
		
		add si, 2
		inc di
	loop repeta	
	
	and si, 01h
	jnz final
	
	mov si, 1
	mov cx, l/2
	
	jmp repeta
	
	final:
	mov ah, 4ch
	int 21h

end start