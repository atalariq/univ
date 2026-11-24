class DoubleNode:
    def __init__(self, data=None, next=None, prev=None):
        self.data = data
        self.next = next
        self.prev = prev

#TODO: Fix this!
class DoublyLinkedList:
    def __init__(self):
        self.head = DoubleNode() # Dummy head
        self.tail = DoubleNode() # Dummy tail
        # Hubungkan head dan tail di awal
        self.head.next = self.tail
        self.tail.prev = self.head
        self.__size = 0

    def append(self, data):
        # Masukkan sebelum dummy tail
        new_node = DoubleNode(data, next=self.tail, prev=self.tail.prev)
        self.tail.prev.next = new_node
        self.tail.prev = new_node
        self.__size += 1

    def remove_last(self):
        if self.__size == 0:
            return None
        last_real_node = self.tail.prev
        last_real_node.prev.next = self.tail
        self.tail.prev = last_real_node.prev
        self.__size -= 1
        return last_real_node.data
