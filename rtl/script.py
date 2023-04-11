import numpy as np

pi_digits =[
    3,1,4,1,5,9,2,6,5,3,5,8,9,7,9,3,
    2,3,8,4,6,2,6,4,3,3,8,3,2,7,9,5,
    0,2,8,8,4,1,9,7,1,6,9,3,9,9,3,7,
    5,1,0,5,8,2,0,9,7,4,9,4,4,5,9,2,
    3,0,7,8,1,6,4,0,6,2,8,6,2,0,8,9,
    9,8,6,2,8,0,3,4,8,2,5,3,4,2,1,1,
    7,0,6,7,9,8,2,1,4,8,0,8,6,5,1,3,
    2,8,2,3,0,6,6,4,7,0,9,3,8,4,4,6,
    0,9,5,5,0,5,8,2,2,3,1,7,2,5,3,5,
    9,4,0,8,1,2,8,4,8,1,1,1,7,4,5,0,
    2,8,4,1,0,2,7,0,1,9,3,8,5,2,1,1,
    0,5,5,5,9,6,4,4,6,2,2,9,4,8,9,5,
    4,9,3,0,3,8,1,9,6,4,4,2,8,8,1,0,
    9,7,5,6,6,5,9,3,3,4,4,6,1,2,8,4,
    7,5,6,4,8,2,3,3,7,8,6,7,8,3,1,6,
    5,2,7,1,2,0,1,9,0,9,1,4,5,6,4,8  
]
#print(len(pi_digits))

# Define the S array
S = [[0] * 256 for i in range(4)]

# Fill S with the digits of pi
counter1 = 0
counter2 = 0
for i in range(4):
    for j in range(256):
        index = (i*256)+j
        if index < len(pi_digits):
            S[i][j] = pi_digits[index]
            
            if (counter1 < 10):
                print("S["+str(i) +"]"+"["+str(j) +"]"+"="+str(S[i][j])+"; ", end="")
            else:
                print("S["+str(i) +"]"+"["+str(j) +"]"+"="+str(S[i][j])+";")
                counter1 = 0
            counter1 = counter1 +1
        elif index >= len(pi_digits):
            index = index%len(pi_digits)
            S[i][j] = pi_digits[index]
            if (counter2 < 10):
                print("S["+str(i) +"]"+"["+str(j) +"]"+"="+str(S[i][j])+"; ", end="")
            else:
                print("S["+str(i) +"]"+"["+str(j) +"]"+"="+str(S[i][j])+";")
                counter2 = 0
            counter2 = counter2 +1
        
