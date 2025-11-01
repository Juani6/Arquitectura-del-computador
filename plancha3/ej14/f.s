.text
format: .asciz "Cantidad de argumentos : %d\n Suma : %d"
error: .asciz "Ingrese al menos un argumento\n"
.global f

# %rdi : #args, %rsi : puntero a argv[]
f: 
