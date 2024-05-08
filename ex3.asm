.radix 16
.model small
.stack 100h
	
.data
	s db 1, 5, 3, 8, 2, 9
	l equ $-s
	d1 db l dup(?)
	d2 db l dup(?)
.code 

start:

	mov ax, @data
	mov ds, ax


	mov cx, l
	mov di, 0
	mov si, 0
	mov bx, 0
	
	jcxz final	;daca cx = 0 jump
	
	repeta:
		mov al, s[si]	;pentru al=8: dx=3 -> si=3 -> si=poz=0 -> d1[si]=8 -> poz=1
		
		mov ah, al
		and ah, 01h	;pune 0 in al daca al este par
		jz este_par	;jump daca al este 0, adica este par
		
		mov d2[di], al
		inc di
		jmp dupa_if
		
		este_par:
			mov d1[bx], al
			inc bx
			
		dupa_if:
			inc si
	loop repeta
	
	final:
	mov ah, 4ch
	int 21h

end start