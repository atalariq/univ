n = int(input())
arr = [int(x) for x in input().split()]

arr = [4, 5, 6, 5, 4, 3, 2, 2]


def solution_1():
    global arr
    cnt = [[0, int(x)] for x in range(1, 10)]
    for x in arr:
        cnt[x - 1][0] += 1
    cnt.sort()
    for x in cnt:
        c = x[0]
        if c == 0:
            continue
        while c > 0:
            print(x[1], end=" ")
            c -= 1


def solution_2():
    global arr
    freq_sort = sorted(arr, key=lambda x: (arr.count(x), x))

    for x in freq_sort:
        print(x, end=" ")


# solution_1()
solution_2()

# Example Input:
# 8
# 4 5 6 5 4 3 2 2
#
# Example Output:
# 3 6 2 2 4 4 5 5
