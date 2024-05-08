.radix 16
.model small
.stack 100h
	;EX7
.data
	s1 db 'abcd'
	l1 equ $-s1
	s2 db 'efg'
	l2 equ $-s2
	d db l1+l2 dup(?)
.code 

start:

	mov ax, @data
	mov ds, ax

	mov cx, l1
	
	jcxz final
	
	repeta1:
		mov al, s1[si]
		mov d[si], al
		inc si
	loop repeta1	;d este 'abcd'
	
	mov cx, l2
	mov di, l2-1	;vrem 'gfe', l2 = 3 dar s2[3] nu exista
	
	repeta2
		mov al, s2[di]
		mov d[si], al
		inc si
		dec di
	loop repeta2
	
	final:
	mov ah, 4ch
	int 21h

end start