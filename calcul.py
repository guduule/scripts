#!/usr/bin/python
import random

i=0
total=0

while i<10:
    A=random.randint(1,30)
    B=random.randint(1,30)
    print "\n\033[35mQuestion #", i+1
    print '\033[37mCalculez = ', A,'+',B
    answer=input("Votre reponse : ")
    if answer == A+B:
        print "Resultat : ", A+B,"=> \033[32mOK\033[37m\n"
        total+=1
        i+=1
        continue
    else:
        print "Resultat : ", A+B,"=> \033[31mFAUX\033[37m\n" 
        i+=1
        continue
           
if total==10:
    print "\n""\033[36mTotal : ", total,"/10"
    print "CONGRATULATIONS !\033[37m\n"
else:
    print "\n""\033[36mTotal : ", total,"/10\n"
    


    
