
# Programe esto medio enfermo para el parcial 2 de arqui,
# como quedo ilegible lo pase por GPT para que me lo documente

# insertion_sort.s
# Implementación del algoritmo Insertion Sort en x86-64 (AT&T syntax)
# Prototipo en C: void insertion_sort(int *a, int len);
# 
# Recibe:
#   RDI → puntero al arreglo de enteros
#   RSI → longitud del arreglo (len)
#
# Ordena el arreglo en orden ascendente, in-place.
# No retorna nada (rax = 0 al salir)

.text
.global insertion_sort

insertion_sort:
	# ---------------- PRÓLOGO ----------------
	pushq %rbp              # Guarda el puntero de base anterior
	movq %rsp, %rbp         # Establece nuevo marco de pila
	subq $32, %rsp          # Reserva 32 bytes para variables locales
	pushq %rbx              # Guarda %rbx (callee-saved)

	# Variables locales:
	# -8(%rbp)   → i
	# -16(%rbp)  → aux
	# -24(%rbp)  → j

	# ---------------- INICIALIZACIÓN ----------------
	movl $1, -8(%rbp)       # i = 1
	xorl %r10d, %r10d       # Limpia registros auxiliares
	xorl %r11d, %r11d
	xorl %ecx, %ecx

	# ---------------- BUCLE FOR PRINCIPAL ----------------
.for:
	movl -8(%rbp), %ebx             # ebx = i
	movl (%rdi, %rbx, 4), %ecx      # ecx = a[i]
	movl %ecx, -16(%rbp)            # aux = a[i]
	decl %ebx                       # ebx = i - 1
	movl %ebx, -24(%rbp)            # j = i - 1

	# Si j < 0, no hay nada que comparar
	cmpl $0, %ebx
	jl .continue

	# Comparamos el primer elemento anterior con aux
	movl -16(%rbp), %r10d           # r10 = aux
	movl (%rdi, %rbx, 4), %r11d     # r11 = a[j]
	cmpl %r10d, %r11d               # a[j] - aux
	jl .continue                    # Si a[j] < aux → no necesita mover

	# ---------------- BUCLE WHILE ----------------
	# while (j >= 0 && a[j] > aux)
.while:
	movl -24(%rbp), %ebx            # ebx = j
	movl %ebx, %edx                 # edx = j
	incl %edx                       # edx = j + 1

	# a[j+1] = a[j]
	movl (%rdi,%rbx,4), %ecx        # ecx = a[j]
	movl %ecx, (%rdi,%rdx,4)        # a[j+1] = ecx

	# j--
	decl %ebx
	movl %ebx, -24(%rbp)            # guarda nuevo j

	# Condiciones del while: j >= 0 && a[j] > aux
	cmpl $0, %ebx                   # j < 0 ?
	jl .continue                    # Si sí, salta
	movl (%rdi, %rbx,4), %r10d      # r10 = a[j]
	movl -16(%rbp), %r11d           # r11 = aux
	cmpl %r11d,%r10d                # ¿a[j] > aux?
	jge .while                      # Si sí, sigue moviendo

	# ---------------- CONTINUACIÓN ----------------
	# Coloca aux en su posición final: a[j+1] = aux
.continue:
	movl %ebx, %edx
	incl %edx                       # edx = j + 1
	movl -16(%rbp), %r11d           # r11 = aux
	movl %r11d, (%rdi, %rdx, 4)     # a[j+1] = aux

	# i++
	movl -8(%rbp), %ebx
	incl %ebx
	movl %ebx, -8(%rbp)

	# ¿i < len? si sí, repetir
	cmpl %esi, %ebx
	jl .for

	# ---------------- EPÍLOGO ----------------
	xorq %rax, %rax                 # return 0 (aunque la función es void)
	popq %rbx                       # restaura %rbx
	movq %rbp, %rsp
	popq %rbp
	ret

.section .note.GNU-stack
