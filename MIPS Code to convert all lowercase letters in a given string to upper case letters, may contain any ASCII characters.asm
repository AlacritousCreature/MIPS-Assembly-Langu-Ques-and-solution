.data
space:.space 200
.text
li $v0,8
la $a0,space
li $a1,200
syscall
move $s1,$a0
li $v0,4
li $t0,0

while:
lb $t1,space($t0)
beq $t1,0,exit
blt $t1,'a',check
bgt $t1,'z',check
sub $t1,$t1,32
sb $t1,space($t0)

check:
addi $t0,$t0,1
j while

exit:
move $a0,$s1
li $v0,4
syscall 
li $v0,10
syscall
