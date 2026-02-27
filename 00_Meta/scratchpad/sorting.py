def insertion_sort(array: list):
    for i in range(0, len(array)-1):
        min = i
        for j in range(i+1, len(array)):
            if(array[j] < array[min]):
                min = j
        array[i], array[min] = array[min], array[i]
    return array

arr = [6,1,5,12,3,69,43,70,33]

print(arr)
print(insertion_sort(arr))
