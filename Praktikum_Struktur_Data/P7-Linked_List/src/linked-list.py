class Node:
    def __init__(self, data = None, next = None):
        self.data = data
        self.next = next

class LinkedList:
    def __init__(self):
        self.head = Node()
        self.tail = self.head
        self.__size = 0

    def append(self, data):
        new_node = Node(data)
        self.tail.next = new_node
        self.tail = new_node
        self.__size += 1

    def remove(self, data):
        if self.__size == 0:
            return False

        cur = self.head.next
        prev = self.head
        while cur:
            if cur.data == data:
                prev.next = cur.next
                if cur == self.tail:
                    self.tail = prev
                self.__size -= 1
                return True
            prev = cur
            cur = cur.next
        return False

    def find(self, data):
        cur = self.head.next
        while cur:
            if cur.data == data:
                return data
            cur = cur.next
        return None

    def __len__(self):
        return self.__size

    def __iter__(self):
        cur = self.head.next
        while cur:
            yield cur.data
            cur = cur.next

    def __str__(self):
        items = [str(item) for item in self]
        return " -> ".join(items) if items else "List Kosong"


if __name__ == "__main__":
    ll = LinkedList()

    ll.append(1)
    ll.append(3)
    ll.append(2)

    print(ll)
    print(len(ll))


    ll.append(10)
    ll.append(5)

    print(ll)
    print(len(ll))

    ll.find(3)
    ll.find(2)
    ll.remove(3)
    ll.find(3)


    print(ll)
    print(len(ll))
