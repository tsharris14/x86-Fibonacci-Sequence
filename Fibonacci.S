# ----------------------------------------------------------------------------------------
# TaCoya S. Harris
# CSC220
# Prof. Nwanze
# 22 April 2020
# Fibonacci Sequence Calculator in Assembly code 
#
#     gcc -no-pie sum.s && ./a.out
#
# ----------------------------------------------------------------------------------------
	.global main


format:
	.asciz  "%5ld\n"

	.text
main:
    push    %rbx			# we have to save this since we use it
    
    mov     $12, %r15       # NUMBER OF TERMS 
	mov     $0, %r13		# sum1 variable
	mov     $0, %r10	    # temp variable
	mov     $1, %r11        # sum2 variable
	mov     $0, %r12        # sum3 variable

printandadd:

    push    %r13            # push sum1
    push    %r10            # push temp
    push    %r13            # push sum1
    push    %r11            # push sum2
    push    %r12            # push sum3
    push    %r13            # push sum1
    push    %r11            # push sum2
   
    push    %rbx            # caller-save register
   
    lea format(%rip), %rdi	# set 1st parameter (format)
	
	mov %r12, %rsi			# set 2nd parameter (current_number)
	xor %r12b, %r12b		# clear AL
	
	# Stack is already aligned because we pushed three 8 byte registers
	call    printf		  	# printf(format, current_number)
   
    pop     %r12            # pop sum3
    pop     %r13            # pop sum1
	pop     %r10			# pop temp
    mov     %r13, %r10      # temp = sum1
	
	pop     %r13            # pop sum1
	pop     %r11            # pop sum2
	add     %r11, %r13      # sum1 = sum1 + sum2
	
	pop     %r12            # pop sum3
	mov     %r13, %r12      # sum3 = sum1
	    
	pop     %r13            # pop sum1       
	mov     %r12, %r13      # sum1 = sum3
	
	pop     %r11            # pop temp
	mov     %r11, %r10     # sum2 = temp

    dec     %r15            # decrement num. of terms
	cmp $0, %r15            # compare num. of terms to 0
	jGE  printandadd	   	# if num. of terms is >= 0, go to printandadd

	pop     %rbx			# restore rbx before returning
    
	ret     
    
    

