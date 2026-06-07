N: int = 8
matrix: list[list[int]] = [[0] * N] * N

for i in range(N):
    matrix[i] = [int(j) for j in input().split()]

for i in range(N):
    for j in range(N):
        print(matrix[N-1-i][N-1-j], end=" ")
    print() # Newline
