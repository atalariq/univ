def faktorial(n: int):
    if(n <= 1):
        return 1
    return n * faktorial(n-1)

def fibonacci(n: int):
    dp = [0] * (n+1)
    dp[0] = 0
    dp[1] = 1
    for i in range (2, n+1):
        dp[i] = dp[i-1] + dp[i-2]
    return dp[n]

# def solve(n: int):
#     # #1 Pakai Rekursif
#     # if n <= 1:
#     #     return 1
#     # return n + solve(n-1)

#     # #2 Pakai DP
#     # dp = [0] * (n+1)
#     # dp[0] = 0
#     # dp[1] = 1
#     # for i in range (2, n+1):
#     #     dp[i] = i + dp[i-1]
#     # return dp[n]

#     # #3 Pakai Rumus
#     # return n * (n + 1) // 2


# print(fibonacci(5))
# for i in range (1, 11):
#     print(solve(i))