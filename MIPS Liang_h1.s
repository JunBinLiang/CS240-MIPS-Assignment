#############################################################################
# Name: JunBin Liang
# Date: Nov 26 2018
# Program name: HW1
# 
# Pesudo Code below
#
# int main(){
#    int num1, num2,result,exit;
#    cout<<"Please enter 2 numbers"<<endl;
#
#    while(true){
#      while(true){
#    cin>>num1;
#    if(num1<-30 || num1>-10){cout<<"Please enter a number range from -10 to -30"<<endl;continue;}
#          break;
#                 }  //inner loop for ensuring the num1
#    while(true){
#    cin>>num2; 
#    if(num2<=5){cout<<"please enter a number larger than 5"<<endl;continue;}
#    break;
#               } // inner loop for ensuring num2
#    result=num1+32*num2-28;
#    cout<<"This is the result"<<result<<endl;
#    int exit;
#    cin>>exit; if(exit==999)break;
#    cout<<"repeating"<<endl;
#               } //big loop for the whole calculation
#
#         return 0;
#             }
#
###########################################################################
#Data representation
#   $t0:num1 $t1:num2 $t2:exit integer  $s0: result  $s1 : 999(use for compare in exit)
#   $t8: 32*int2 
#   $t7: 28
#   t6=int1+int2*32
#   $t4 small loop condition testing

       .data
start1:     .asciiz "Please enter two numbers\n"
result:    .asciiz "This is the result  "
warning1:   .asciiz "Please enter a number range from -10 to -30\n"
warning2:   .asciiz "please enter a number larger than 5\n"
warning3:   .asciiz "\n Enter number 999 for exit\n"
exit:	    .asciiz " Please give me full score !!!\n"
		.text
main: 
    
loop: 
    la $a0,start1   #load the string for asking to entering
    li $v0,4
    syscall

innerLoop1:
     la $a0,warning1   #load the string for asking to entering
     li $v0,4
     syscall
	 li $v0,5
     syscall 
     add $t0, $v0, $zero         # same as move v0(the num1 you enter) to $t0	  
	 slti $t4,$v0,-30            #if less than -30
     bne $t4, $zero,innerLoop1	 # not zero, ->>>less than -30, bad!!
	 slti $t4, $v0, -10          # less than 10, true
	 beq  $t4,$zero,innerLoop1   # t4=0, not less than 10 -->>loop 
	  
innerLoop2:
     la $a0,warning2   #load the string for asking to entering
     li $v0,4
     syscall
     li $v0,5
     syscall 
     add $t1, $v0, $zero # same as move v0(the num2 you enter) to $t1
	 slti $t4 $t1,6      # t4=1  if num2<6, which means numw must>5 caution:5 can not be entered, so set to less than 6, 6 could be entered     
	 bne $t4, $zero,innerLoop2      #  t4!=0  ->>> num is less than 6, false   
	  
	  sll $t8,$t1,5    #int2*32
	  add $t6,$t0,$t8  #t6=int1+int2*32
	  li  $t7,28       #t7=28
	  sub $s0,$t6,$t7  #s0=int1+int2*32-28
	  
	  la $a0,result   #load the string for result message
      li $v0,4
      syscall
	  
	  li $v0,1
	  add $a0,$s0,$zero    
	  syscall        #print the result
	  
	  la $a0,warning3   #load the string for result message
      li $v0,4
      syscall
	  
	  li $v0,5
      syscall 
      add $t2, $v0, $zero # same as move v0(the num2 you enter) to $t1
	  li $s1,999
	  bne $t2,$s1,loop #if not 999, go to loop

Done: 
      la $a0,exit   #load the string for result message
      li $v0,4
      syscall
      li $v0,10 #return 0
      syscall

	  
	  
	  















