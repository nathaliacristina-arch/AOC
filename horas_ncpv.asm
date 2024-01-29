.data 
	pergunta: .asciiz "Entre com as horas: "
	inv�lido: .asciiz "Valor inv�lido para horas. Esperando n�mero entre 0 e 23. "
	minutos: .asciiz "Entre com os minutos: "
	errado: .asciiz "Valor inv�lido para minutos. Esperando n�mero entre 0 e 59."
	segundos: .asciiz "Entre com os segundos: "
	erro: .asciiz "Valor inv�lido para segundos. Esperando n�mero entre 0 e 59."
	hor�rio: .asciiz "Hor�rio digitado: "
	espa�o: .byte ':'
	
.text
	
	la�ohoras:
	#imprimindo a pergunta sobre horas
	li $t1,23
	li, $v0, 4
	la, $a0, pergunta 
	syscall
	
	#ler o n�mero
	li, $v0, 5
	syscall 
	
	move $t0, $v0
	
	blt $t0, $zero,  horasinv�lido #t1=23 ou menor, executa o la�o
	bgt $t0, $t1, horasinv�lido
	
	
	minutosla�o:
	
	#imprimindo a pergunta sobre minutos
	li $t1, 60
	li, $v0, 4
	la, $a0, minutos 
	syscall
	
	#ler os minutos 
	li, $v0, 5
	syscall 
	 
	move $t2, $v0
	
	
	blt $t2, $zero, minutosinv�lido #t3=59 ou menor, executa a hora
	bgt $t2, $t1, minutosinv�lido
	
	
	
	la�oseg:	
	
	#imprimindo a pergunta sobre segundos
	li $t1,60
	li, $v0, 4
	la, $a0, segundos
	syscall
	
	#ler o n�mero
	li, $v0, 5
	syscall 
	
	move $t3, $v0
	
	blt $t3, $zero, segundosinv�lido #t1=59 ou menor, executa a hora
	bgt $t3, $t1, segundosinv�lido
	

	
	li, $v0, 4
	la, $a0, hor�rio 
	syscall
	
	
	
	li $v0,1
	move $a0, $t0
	syscall
	
	li $v0,4
	la $a0, espa�o
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0,4
	la $a0, espa�o
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	
	
	li $v0, 10
	syscall
	

									
	horasinv�lido: 
	li, $v0, 4
	la, $a0, inv�lido  
	syscall
	j la�ohoras
	
	
	minutosinv�lido:
	li, $v0, 4
	la, $a0, errado  
	syscall
	j minutosla�o
	
	
	
	segundosinv�lido: 
	li, $v0, 4
	la, $a0, erro 
	syscall
	j la�oseg
	
	 
	 
	 
	syscall
	
