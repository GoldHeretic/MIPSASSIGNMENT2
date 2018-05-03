.data 
 king :   .asciiz "\nMister Man/Woman Input A:"
 king_1 : .asciiz "\nAbeg Do for B too:"
 king_2 : .asciiz "\nWe Need C too PLEASE, EHN BIKONO:"
 king_3 : .asciiz "\nComplex roots why did you do that"
 king_4 : .float 4.0
 king_5 : .float 2.0
 king_6 : .float 0.0
.text
  main:
 la $a0, king
 li $v0, 4
 syscall 
 li $v0, 6
 syscall #enter a
 mov.s  $f1, $f0
 
 #input  b
 
 la $a0, king_1
 li $v0, 4
 syscall
 li $v0, 6
 syscall
 mov.s   $f2, $f0
 
 #input c
 
 la $a0, king_2
 li $v0, 4
 syscall 
 li $v0, 6
 syscall
 mov.s  $f3, $f0

 
 
 
 # calculate Discriminant
 l.s $f4, king_4
 mul.s $f7, $f2, $f2
 mul.s $f5, $f4, $f1
 mul.s $f14, $f5,$f3
 sub.s $f6, $f7, $f14
 mtc1 $t1, $f6 
 l.s $f8, king_6
 #compare d<=0
 blez $t1, Complex_roots
 #calculate x1 and x2
 l.s $f9, king_5
 Compute_X1_X2:
 #calcute x1
 neg.s $f2, $f2 #am converting the value in $f2 to negative
 sqrt.s $f13, $f6
 add.s $f10, $f2, $f13
 mul.s $f9, $f9, $f1
 div.s $f10, $f10, $f9
 #compute x2
 sub.s $f11, $f2, $f13
 div.s $f11, $f11, $f9
 #output roots
 #output X1
 mov.s $f12, $f10
 li $v0, 2
 syscall
 #output X2 
 mov.s $f12, $f11
 li $v0, 2
 syscall 
 b exit
 Complex_roots:
 la $a0, king_3
 li $v0, 4
 syscall
 exit:
 li $v0,10
 syscall 	
 
