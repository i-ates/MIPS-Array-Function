# $t1= adrees of A[0]  $t2= addres of B[0]
# $a1,2= duplicated adress A  and b
# $t0=4	
# $s1= A[i], $s2= B[i] $s0=check
# $t3=i $t4=check  $t5=5 
.data
A: .word 1, 3, 3, 5, 5
B: .word 2, 2, 3, 4, 5 
.text
main:
	addi $sp, $sp, -4 #open stack 
	addi $t3, $0, 0   #define i for foorloop
	la $t1, A
	la $t2, B
	addi $t0, $0, 4	  #constant for byteset(use for adding 4 byte on array address
	addi $a1, $t1, 0  #argüment of Adrees A
	addi $a2, $t2, 0  #argümen of Adress B
	addi $t5, $0, 5   #constant for forloop
	j foorloop
	
foorloop:  
	slt $t4, $t3, $t5  #check foorloop
	beq $t4, 1, compare #if i<5 it goes compare 
	j finish
	

compare:
	addi $t3, $t3, 1   #i=i+1
	lw $s1, 0($a1)     #get s1=A[i]
	lw $s2, 0($a2)     #get s2= B[i]
	slt $s0, $s1, $s2  #check A[i]<B[i]
	beq $s0, 0, swap   #if A[i]< B[i]  go swap
	add $a1, $a1, $t0  #get adrees A[i]+4 
	add $a2, $a2, $t0  #get addres B[i]+4
	j foorloop
	
swap:
	sw $s1, 0($sp)     #stack[0]= A[i]
	sw $s2, 0($a1)     #A[i]= B[i]
	lw $s1, 0($sp)     #A[i]= stack[0]
	sw $s1, 0($a2)	   #B[i]=A[i]
	add $a1, $a1, $t0  #get adrees A[i]+4
	add $a2, $a2, $t0  #get adess B[i]+4
	j foorloop
finish: 
	addi $sp, $sp, 4  #close stack
	
