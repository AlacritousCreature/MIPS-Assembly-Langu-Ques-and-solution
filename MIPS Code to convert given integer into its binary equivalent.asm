.data
line : .space 30
answer : .space 30
main:
.text
li $v0,5
syscall
move $t9,$v0
la $t1,line
move $t2,$t1
addi $a3,$0,2
addi $t5,$0,0
addi $s0,$0,0
li $t8,'0'

loop :
bnez $t9,add
j stop
add:
div $t9,$a3
mfhi $t3
mflo $t9
add $t3,$t3,$t8
sb $t3,0($t2)
addi $t2,$t2,1
addi $t5,$t5,1
addi $s0,$s0,1
j loop  
 
stop:
la $t3,answer
move $a3,$t3
addi $t5,$0,0

follow:
bgt $t5,$s0,end2
addi $t2,$t2,-1
lb $t7,0($t2)
sb $t7,0($a3)
addi $a3,$a3,1
addi $t5,$t5,1
j follow
   
end2:
addi $t6,$0,0
sb $t6,0($a3)
move $a0,$t3
li $v0,4
syscall
li $v0,10
syscall

