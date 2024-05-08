.radix 16
.model small
.stack 100h
	
.data
	s1 db 1, 3, 5, 7
	l1 equ $-s1
	s2 db 2, 6, 9, 4
	l2 equ $-s2
	d db l1+l2 dup(?)
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
	mov di, 0
	
	jcxz final	;daca cx = 0 jump
	
	repeta1:
		mov al, s1[si]
		mov d[di], al
		inc di
		
		mov al, s2[si]
		mov d[di], al
		inc di
		
		inc si
	loop repeta1	;d este 'abcd'
	
	final:
	mov ah, 4ch
	int 21h

end start