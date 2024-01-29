#programa que diz sobre horario de reunioes em assembly 
.data 
	pergunta: .asciiz "Entre com a hora de inicio(HH): "           #hora de inicio
	inválido: .asciiz "Hora invalida. "                           #hora de inicio invalida
	minutos: .asciiz "Entre o minuto de inicio (MM): "            #minuto de inicio
	errado: .asciiz "Minuto invalido."                            #minuto de inicio invalida
	duracao: .asciiz "Entre com as horas de duracao(HH):"        #horas da duracao
	erro: .asciiz "Horas invalidas."                             #horas da duracao invalida
	min: .asciiz "Entre com os minutos de duracao (MM):"         #minutos da duracao
	er: .asciiz "Minutos invalidos."                             #minutos da duracao invalida
	horário: .asciiz "Horario da reuniao: "     #horario da reuniao/horario final 
	espaco: .asciiz ":"
	a: .asciiz " a "
	zero: .asciiz "00"
	z: .asciiz "0"
	
.text
main:
	lacohoras:
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
	bgt $t0, $t1, horasinválido #hora maior que 23
	
	
	minutoslaco:
	
	#imprimindo a pergunta sobre minutos
	li $t1, 59
	li, $v0, 4
	la, $a0, minutos 
	syscall
	
	#ler os minutos 
	li, $v0, 5
	syscall 
	 
	move $t2, $v0
	
	
	blt $t2, $zero, minutosinválido #t3=59 ou menor, executa a hora
	bgt $t2, $t1, minutosinválido
	
	
	lacohorasdeduracao:
	#imprimindo a pergunta sobre hora de duracao da reuniao
	li $t3,23
	li, $v0, 4
	la, $a0, duracao 
	syscall
	
	#ler o número
	li, $v0, 5
	syscall 
	
	move $t4, $v0
	
	blt $t4, $zero,  horainvalida #t1=23 ou menor, executa o laço
	bgt $t4, $t3, horainvalida #hora maior que 23
	
	
	
	
	lacominutosdeduracao:
	
	#imprimindo a pergunta sobre minutos de duracao da reuniao
	li $t3, 59
	li, $v0, 4
	la, $a0, min 
	syscall
	
	#ler os minutos 
	li, $v0, 5
	syscall 
	 
	move $t5, $v0
	
	
	blt $t5, $zero, minutoinvalido #t3=59 ou menor, executa a hora
	bgt $t5, $t3, minutoinvalido
	
	
	############ soma das horas e dos minutos #########################
	
	add $t8, $t0, $t4 #soma de horas
	bge $t8, 24, imprimeigual #se a soma for maior ou igual a 24, imprime zero

	add $t6, $t2, $t5 #soma de minutos
	bge $t6, 60, imprimeminuto #se a soma de minutos for maior que 60 ou igual a 60
	

		
	
	################impressao###########################
	
	li, $v0, 4
	la, $a0, horário #horario da reuniao
	syscall
	li $v0,1
	move $a0, $t0  #hora inicial
	syscall
	
	
	li $v0,4
	la $a0, espaco
	syscall
	
	
	
	li $v0, 1
	move $a0, $t2 #minuto inicial
	syscall
	
	
	li $v0,4
	la $a0, a # h:m a h:m
	syscall
	

	li $t5, 10	
	blt $t8, $t5, z
	li $v0,1
	move $a0, $t8 #hora final
	syscall
	
	
	li $v0,4
	la $a0, espaco
	syscall
	

	
	li $v0, 1
	move $a0, $t6 #minuto final
	syscall
	

	li $v0, 10 #finaliza o programa principal
	syscall
	
	################## funcoes ###################			
	
												
	horasinválido: 
	li, $v0, 4
	la, $a0, inválido  
	syscall
	j lacohoras
	
	
	minutosinválido:
	li, $v0, 4
	la, $a0, errado  
	syscall
	j minutoslaco
	
	
	
	
	horainvalida: 
	li, $v0, 4
	la, $a0, erro
	syscall
	j lacohorasdeduracao
	
	
	minutoinvalido:
	li, $v0, 4
	la, $a0, er
	syscall
	j lacominutosdeduracao
	
	imprimeminuto:
	bge $t8, 24, imprimeigual #se a soma for maior ou igual a 24, imprime zero
	addi $t9, $t8, 1
	
	#soma + na hora 
	#e o que sobrar alem do 60 colocar como minuto
	
	li, $v0, 4
	la, $a0, horário #horario da reuniao
	syscall
	li $v0,1
	move $a0, $t0  #hora inicial
	syscall
	
	
	li $v0,4
	la $a0, espaco
	syscall
	
	
	
	li $v0, 1
	move $a0, $t2 #minuto inicial
	syscall
	
	
	li $v0,4
	la $a0, a # h:m a h:m
	syscall
	

	
	li $v0,1
	move $a0, $t9 #hora final
	syscall
	
	
	li $v0,4
	la $a0, espaco
	syscall
	

	
	li $v0, 4 
	la $a0, zero #minuto final
	syscall
	

	li $v0, 10 #finaliza o programa principal
	syscall
	
	imprimeigual:

	add $t6, $t2, $t5 #soma de minutos
	bge $t6, 60, imprimeminuto #se a soma de minutos for maior que 60 ou igual a 60
		
	li, $v0, 4
	la, $a0, horário #horario da reuniao
	syscall
	
	
	li $v0,1
	move $a0, $t0  #hora inicial
	syscall
	
	
	li $v0,4
	la $a0, espaco
	syscall
	
	
	
	li $v0, 1
	move $a0, $t2 #minuto inicial
	syscall
	
	
	li $v0,4
	la $a0, a # h:m a h:m
	syscall
	


	li $v0,4
	la $a0, zero
	syscall
	
	
	li $v0,4
	la $a0, espaco #dois pontos (:)
	syscall
	
	
	li $v0, 1
	move $a0, $t6 #minuto final
	syscall

	li $v0, 10 #finaliza o programa principal
	syscall
	
	syscall
	
