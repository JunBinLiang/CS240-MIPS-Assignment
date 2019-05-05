#############################################################################
# Name: JunBin Liang
# Date: Nov 26 2018
# Program name: HW2
# 
# Pesudo Code below
#########################################################################
#   int main(){
#       int a[10];  int num; int sum=0; int min;
#       cout<<"Please enter 10 numers into the array"<<endl;
#
#   for(int i=0;i<10;i++){
#      cin>>num;
#      a[i]=num;
#
#      if(i==0){
#          min=a[0];  //min for the first time
#          sum+=num;
#          continue;
#              }
#
#      if(a[i]<min){  //current term less than the min
#                min=a[i];   //update
#                  }
#          
#             sum+=num;
#
#                         } // for loop for enter 10 numer, calculating the sum and min at the same time
#     
#      cout<<"The sum is "<<sum<<endl;
#      cout<<"The min is "<<min<<endl;
#      for(int i=9;i>=0;i--){ //reverse order
#          cout<<a[i]<<endl;
#       }
#               return 0;
#                        } // end of the program
###################################################################
#  
#  Data Representation:
#  $s0: 10 loop counter    $s1:9 reverse order loop counter  $s2:min    $s3:sum  
#  $s4: base address      $s5 : reverse address
#  
#  $t0: condition check
#
#



        .data
startMessage:    .asciiz      "Please enter 10 numers into the array\n"
Array       :    .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
endP        :    .asciiz   "Please give me the full score\n"  
sumIs       :    .asciiz   "the sum is  "  
minIs       :    .asciiz   "the min is  "  
newline     :    .asciiz   "\n  " 
reverse     :    .asciiz   "the reverse is \n  " 
        .text
main: 
      li $s0,0   #loop1 counter
      li $s1,0    #loop2 counter(for reversing)
	  li $s3,0    #sum is zero
	  la $s4,Array       #s4 is the base address of the array
	  la $s5,Array 
	  addi $s5,$s5,36    #s5 is the last address  (40/4)-1  0to9
	   
	   la $a0,startMessage  #load the string for asking to entering
       li $v0,4
       syscall

loop:
	 li $v0,5
     syscall         #get integer from user
	 sll $t5, $s0,2
	 add $t8,$t5,$s4
	 sw $v0, 0($t8)  #put the value into the array
	 add $s3,$s3,$v0 # sum+=num
	 
	 bne $s0,$zero,normalFlow     # min=array[0] for the first
	 move $s2,$v0                 # min=array[0]
 normalFlow:       

     slt $t0, $v0,$s2                    #minimum assignment, num<min
	 beq $t0, $zero,normalFlow2          # equal zero, not less than, keep min same
	 move $s2,$v0                                     #update min
	 
normalFlow2:
	 addi $s0, $s0,1    # i+1
	 slti $t0, $s0,10   #t0=1  if s0(i)<10
	 
	 bne $t0,$zero,loop	 

	 
	 la $a0,reverse  #load the string for asking to entering
     li $v0,4
     syscall

	 
loop2:
     sll $t6 $s1,2
	 sub $t7,$s5,$t6
     lw $a0, 0($t7) 
	 li $v0,1
	 syscall
	 la $a0,newline  #load the string for asking to entering
     li $v0,4
     syscall
	 
     addi $s1, $s1,1    # i+1
   	 slti $t0, $s1,10   #t0=1  if s0(i)<10
	 
   
     bne $t0,$zero,loop2	 





     la $a0,sumIs  #load the string for asking to entering
     li $v0,4
     syscall
     add $a0,$s3,$zero
	 li $v0,1
	 syscall
	 la $a0,newline  #load the string for asking to entering
     li $v0,4
     syscall
	 la $a0,minIs  #load the string for asking to entering
     li $v0,4
     syscall
	 add $a0,$s2,$zero
	 li $v0,1
	 syscall
     la $a0,newline  #load the string for asking to entering
     li $v0,4
     syscall
	 
	 
Done:
     la $a0,endP  #load the string for asking to entering
     li $v0,4
     syscall

     li $v0,10    #system terminate
     syscall


   




