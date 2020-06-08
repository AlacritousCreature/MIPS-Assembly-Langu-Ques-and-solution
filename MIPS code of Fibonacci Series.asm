.data
bar:.byte ' '
.text
li $v0,5
syscall

move $t7,$v0
addi $s1,$0,0
li $v0,1
add $a0,$0,0
syscall

addi $s2,$0,1
li $v0,1
la $a0,1
syscall

add $s0,$0,1
addi $t7, $t7,0

loop9:
beq $s0,$t7,go
move $s3,$s2 
add $s2,$s2,$s1   
li $v0,1
add $a0,$0,$s2  
syscall
li $v0,11
lb $a0,bar
syscall
move $s1,$s3   
addi $s0,$s0,1   
j loop9
go:
