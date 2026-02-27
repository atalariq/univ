# Input: Dua buah matrix 2x2
# Output: Hasil perkalian matrix

# ========== Input value
m1_1 = input().split()                  # Matrix 1, line 1
m1_2 = input().split()                  # Matrix 1, line 2
print("")                               # Create newline to separate first and second matrix
m2_1 = input().split()                  # Matrix 2, line 1
m2_2 = input().split()                  # Matrix 2, line 2

# ========== Create matrix
m1 = [list(map(int, m1_1)), list(map(int, m1_2))]
m2 = [list(map(int, m2_1)), list(map(int, m2_2))]

# ========== Do multiplication
result = [[0, 0], [0, 0]]               # to save answer

# First row
result[0][0] = m1[0][0] * m2[0][0] + m1[0][1] * m2[1][0]
result[0][1] = m1[0][0] * m2[0][1] + m1[0][1] * m2[1][1]

# Second row
result[1][0] = m1[1][0] * m2[0][0] + m1[1][1] * m2[1][0]
result[1][1] = m1[1][0] * m2[0][1] + m1[1][1] * m2[1][1]

# ========== Print answer
print(f"\nResult:\n{result[0][0]} {result[0][1]}\n{result[1][0]} {result[1][1]}")
