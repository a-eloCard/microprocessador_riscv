.data
vet: .word 0:20

.text

main:
#addi a0, x0, 0
la a0, vet
addi a1, x0, 20
addi a2, x0, 1
addi a3, x0, 1
jal ra, fib
ebreak

fib:
add t1, x0, a2
add t2, x0, a3
sw t1, 0(a0)             # v[0] = 1
sw t2, 4(a0)             # v[1] = 1
addi t0, x0, 2           # i = 2

for:
bge t0, a1, fora_for 
addi t3, t0, -1          # t3 = i - 1
slli t3, t3, 2           # t3 = (i-1)*4
add t3, t3, a0           # t3 = (i-1)*4 + &v
lw t4, 0(t3)             # t4 = v[i-1]
addi t5, t0, -2          # t5 = i-2
slli t5, t5, 2           # t5 = (i-2)*4
add t5, t5, a0           # t5 = (i-2)*4 + &v
lw t6, 0(t5)             # t6 = v[i-2]
add t4, t4, t6           # t4 = v[i-1] + v[i-2]
sw t4, 4(t3)             # v[i] = t4
addi t0, t0, 1           # i++
jal x0, for

fora_for:
jalr x0, ra, 0