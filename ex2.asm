.radix 16
.model small
.stack 100h
	;EX7
.data
	s1 db 1, 2, 3, 4
	l1 equ $-s1
	s2 db 5, 6, 7, 8
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
		mov di, si
		
		and di, 01h
		jz este_par
		
		sub al, s2[si]
		jmp dupa_if
		
		este_par:
			add al, s2[si]
			
		dupa_if:
			mov d[si], al
			inc si
	loop repeta1	;d este 'abcd'
	
	
	final:
	mov ah, 4ch
	int 21h

end start