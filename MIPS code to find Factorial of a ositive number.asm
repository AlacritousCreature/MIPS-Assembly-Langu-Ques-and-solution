.data
.text
main:
li $v0,5
syscall
move $a0,$v0
jal loop 
     
move $t0,$v0       
li $v0,1        
move $a0,$t0       
syscall               
li $v0,10        
syscall

.text
loop:
addi $sp,$sp,-8
sw $s0,4($sp)
sw $ra,0($sp)
bne $a0,0,go
addi $v0,$zero, 1   
j fact

go:
move $s0,$a0
addi $a0,$a0,-1 
jal loop
multu $s0,$v0 
mflo $v0

fact:
lw $s0,4($sp)
lw $ra,0($sp)
addi $sp,$sp,8
jr $ra

