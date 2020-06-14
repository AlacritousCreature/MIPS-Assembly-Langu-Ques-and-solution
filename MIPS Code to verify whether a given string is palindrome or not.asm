.data
string:.space 32
a:.asciiz "Yes a palindrome."
b:.asciiz "No, not a palindrome."

.text
la $a0,string
li $a1,32
li $v0,8
li $s0,'0'
syscall
move $t0,$a0
li $t9,0

loop:
lb $t8,string($t9)
beqz $t8,done
addi $t9,$t9,1
j loop

done:
addi $t9,$t9,-2
li $t8,0
while :
bge $t8,$t9,yp
lb $t3,string($t8)
lb $t4,string($t9) 
bne $t3,$t4,np
addi $t9,$t9,-1
addi $t8,$t8,1
j while
			
np: 
la $a0,b
li $v0,4
syscall
li $v0,10
syscall
		
yp:
la $a0,a
li $v0,4
syscall
li $v0,10
syscall

