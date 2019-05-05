#############################################################################
# Name: JunBin Liang
# Date: Dec 6 2018
# Program name: HW2
# 
# Pesudo Code below
#########################################################################
#     compute Func(n): if (n = 0) return 6
#     else return 4*Func(n-1) + 5*n;
#     Have n (n>= 0) be prompted from the user
#     Display a result_message together with the numeric value of the result.
#
#
###################################################################
#  
#  Data Representation:
#  
#  $a0: parameter n     $v1:function return
#  
#  


      .data
Message: .asciiz      "Please enter a number \n"
Message1: .asciiz      "\nExit\n"    
	  .text
main:
     la $a0,Message
	 li $v0,4
	 syscall
	 li $v0,5
	 syscall
	 add $a0,$v0,$zero #move v0 to argument a0 
	 jal Recursion
Done:
     move $a0,$v1
     li $v0,1 
	 syscall
	  la $a0,Message1
	 li $v0,4
	 syscall
     li $v0,10
	 syscall
	 
Recursion:	 
	 addi $sp,$sp,-8
	 sw $ra, 0($sp)
	 sw $a0, 4($sp)
     
	 beq $a0,$zero, base # if(a0==0) a0 is n
	 j changeArgument
base:
    li $v1,6	 #base case return value
	lw $a0, 4($sp)
    lw $ra, 0($sp)
	addi $sp,$sp,8
    jr $ra
	
changeArgument:	
 addi $a0,$a0,-1
	 jal Recursion  #recursive call
	 
	 
    lw $a0, 4($sp)
    lw $ra, 0($sp)
	#calculation Below
	li $t4,2
    sll $t0, $v1,$t4 # return value * 4
	li $t3, 5
	mul $t1, $a0,$t3
	
	add  $v1, $t1,$t0
    addi $sp,$sp,8
	jr $ra



	 
	 
	 
	 