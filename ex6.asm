.radix 16
.model small
.stack 100h
	
.data
	s1 db 1, 3, 6, 2, 3, 7
	l1 equ $-s1
	s2 db 6, 3, 8, 1, 2, 5
	l2 equ $-s2
	d db $-s1 dup(?)
.code 

start:

	mov ax, @data
	mov ds, ax

	mov al, l1
	sub al, l2
	cmp al, 0
	jne final  ;daca sirurile au lungime diferita jump

	mov ax, 0
	mov cx, l1
	mov si, 0
	
	jcxz final	;daca cx = 0 jump
	
	repeta1:
		mov al, s1[si]
		
		cmp al, s2[si]
		jae s1Max
		
		mov al, s2[si]
		mov d[si], al
		jmp dupa_if
		
		s1Max:
			mov d[si], al
		dupa_if:
			inc si
	loop repeta1
	
	final:
	mov ah, 4ch
	int 21h

end start