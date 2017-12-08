;Nerys Jimenez Pichardo
;The College of Saint Rose
;Computer Organization
;sum.asm
;--------------------------------------------------------------------------
stacksg segment para stack 'Stack'	
	db	32 dup (0)		
stacksg ends
;---------------------------------------------------------------------------
datasg segment para 'Data'
nums db 5, 2, 4, 1, 3, 8, 0
totale db 0
totalo db 0
datasg ends
;---------------------------------------------------------------------------
codesg	segment para 'Code'	
main	proc	far		
	assume ss:stacksg, ds:datasg, cs:codesg
	mov ax, datasg	
	mov ds, ax
	mov es, ax
	
	LEA BX, nums
	MOV CH, 0
	MOV CL, 0
top:	MOV AL, [BX]
		CMP AL, 0
		JE endd
		TEST AL, 1
		JZ evenn
		ADD CL, AL
		INC BX
	
evenn: 	ADD CH, AL
		INC BX
		JMP top

endd:	MOV totale, CL
		MOV totalo, CH
		NOP


	mov ax, 4c00h
	int	21h
main	endp
codesg	ends
	end main