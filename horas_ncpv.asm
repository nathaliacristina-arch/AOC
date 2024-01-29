#Programa que imprime que horas são
.data 
	pergunta: .asciiz "Entre com as horas: "
	inválido: .asciiz "Valor inválido para horas. Esperando número entre 0 e 23. "
	minutos: .asciiz "Entre com os minutos: "
	errado: .asciiz "Valor invélido para minutos. Esperando número entre 0 e 59."
	segundos: .asciiz "Entre com os segundos: "
	erro: .asciiz "Valor inválido para segundos. Esperando número entre 0 e 59."
	horário: .asciiz "Horário digitado: "
	espaço: .byte ':'
	
.text
	
	laçohoras:
	#imprimindo a pergunta sobre horas
	li $t1,23
	li, $v0, 4
	la, $a0, pergunta 
	syscall
	
	#ler o número
	li, $v0, 5
	syscall 
	
	move $t0, $v0
	
	blt $t0, $zero,  horasinválido #t1=23 ou menor, executa o laço
	bgt $t0, $t1, horasinválido
	
	
	minutoslaço:
	
	#imprimindo a pergunta sobre minutos
	li $t1, 60
	li, $v0, 4
	la, $a0, minutos 
	syscall
	
	#ler os minutos 
	li, $v0, 5
	syscall 
	 
	move $t2, $v0
	
	
	blt $t2, $zero, minutosinválido #t3=59 ou menor, executa a hora
	bgt $t2, $t1, minutosinválido
	
	
	
	laçoseg:	
	
	#imprimindo a pergunta sobre segundos
	li $t1,60
	li, $v0, 4
	la, $a0, segundos
	syscall
	
	#ler o número
	li, $v0, 5
	syscall 
	
	move $t3, $v0
	
	blt $t3, $zero, segundosinválido #t1=59 ou menor, executa a hora
	bgt $t3, $t1, segundosinválido
	

	
	li, $v0, 4
	la, $a0, horário 
	syscall
	
	
	
	li $v0,1
	move $a0, $t0
	syscall
	
	li $v0,4
	la $a0, espaço
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0,4
	la $a0, espaço
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	
	
	li $v0, 10
	syscall
	

									
	horasinválido: 
	li, $v0, 4
	la, $a0, inválido  
	syscall
	j laçohoras
	
	
	minutosinválido:
	li, $v0, 4
	la, $a0, errado  
	syscall
	j minutoslaço
	
	
	
	segundosinválido: 
	li, $v0, 4
	la, $a0, erro 
	syscall
	j laçoseg
	
	 
	 
	 
	syscall
	
