.data
.text
li $v0, 5
syscall
move $t0, $v0
li $t1, 0
addi $t2, $0, 16
add $t4, $0, $0
loop:
blt $t0,0,back
beq $t0,0,back
rem $s0,$t0,2
div $t0,$t0,2
bne $s0,1,cont
add $t4,$t4,1
cont:
j loop
back:
li $v0,1
move $a0,$t4
syscall

