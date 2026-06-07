def selection_sort(arr):
    for i in range(len(arr)):
        min_id = i
        for j in range(i+1, len(arr)):
            if arr[j] < arr[min_id]:
                min_id = j
        arr[min_id], arr[i] = arr[i], arr[min_id]
    return arr

def insertion_sort(arr):
    for i in range(1, len(arr)):
        key_item = arr[i]
        j = i - 1
        while j >= 0 and arr[j] > key_item:
            arr[j+1] = arr[j]
            j -= 1
        arr[j+1] = key_item
    return arr

def bubble_sort(arr):
    for i in range(len(arr)):
        for j in range(len(arr) - i - 1):
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]
    return arr

def main():
    # arr = [24, 12, 123, 24, 23, 11, 9, 6, 3, 2, 4, 88, 67, 9, 67, 100]
    arr = [5, 3, 28, 15, 0, 35, 2]
    print(selection_sort(arr[:]))
    print(insertion_sort(arr[:]))
    print(bubble_sort(arr[:]))

if __name__ == "__main__":
    main()
