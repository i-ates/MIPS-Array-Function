#$s0=a,  $s1=b, $s2=result 
#$a0= argüment a, $a1= argüment b
#$v0= return value 
#$t1= check , $t0=a+b or a-b 

main:	addi $s0, $0, 5  	#a=5
	addi $s1, $0, 3		#b=3
	addi $s2, $0, 0		#result=0
	addi $a0, $s0, 0	#argümentA=a
	addi $a1, $s1, 0	#argümentB=b
	bne $s0, $s1, compare	#if a!=b go compare
	add $s2, $s0,$s1	#else result=a+b
	addi $v0, $s2, 0	#returnValue=result
	j finish
compare: slt $t1, $a0, $a1	#if a<b go punish else go award
	beq $t1, 1, punish
	beq $t1, 0, award
	
award:  add $t0, $a0, $a1       #t0=a+b
	sll $t0, $t0, 1		#t0=t0*2
	addi $v0, $t0, 0	#returnValue=t0
	j finish 

punish: sub $t0, $a0, $a1	#t0=a-b
	sll $t0, $t0, 1		#t0=t0*2
	addi $v0, $t0, 0	#returnValue=t0
	j finish
finish:
	
