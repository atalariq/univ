class Node:
    def __init__(self, key: int):
        self.key = key
        self.left = None
        self.right = None


class BST:
    def __init__(self):
        self.root = None

    def insert(self, key: int) -> None:
        """Menyisipkan nilai baru ke dalam BST."""
        self.root = self._insert(self.root, key)

    def _insert(self, node: Node | None, key: int) -> Node:
        if node is None:
            return Node(key)
        if key < node.key:
            node.left = self._insert(node.left, key)
        elif key > node.key:
            node.right = self._insert(node.right, key)
        return node

    def search(self, key: int) -> Node | None:
        """Mencari nilai dalam BST. Mengembalikan node jika ditemukan, None jika tidak."""
        return self._search(self.root, key)

    def _search(self, node: Node | None, key: int) -> Node | None:
        if node is None or node.key == key:
            return node
        if key < node.key:
            return self._search(node.left, key)
        return self._search(node.right, key)

    def find_min(self) -> int | None:
        """Mengembalikan nilai terkecil dalam BST."""
        if self.root is None:
            return None
        return self._find_min(self.root)

    def _find_min(self, node: Node) -> int:
        current = node
        while current.left:
            current = current.left
        return current.key

    def find_max(self) -> int | None:
        """Mengembalikan nilai terbesar dalam BST."""
        if self.root is None:
            return None
        return self._find_max(self.root)

    def _find_max(self, node: Node) -> int:
        current = node
        while current.right:
            current = current.right
        return current.key

    def inorder(self) -> list[int]:
        """Traversal inorder: kiri - akar - kanan."""
        result: list[int] = []
        self._inorder(self.root, result)
        return result

    def _inorder(self, node: Node | None, result: list[int]) -> None:
        if node:
            self._inorder(node.left, result)
            result.append(node.key)
            self._inorder(node.right, result)

    def preorder(self) -> list[int]:
        """Traversal preorder: akar - kiri - kanan."""
        result: list[int] = []
        self._preorder(self.root, result)
        return result

    def _preorder(self, node: Node | None, result: list[int]) -> None:
        if node:
            result.append(node.key)
            self._preorder(node.left, result)
            self._preorder(node.right, result)

    def postorder(self) -> list[int]:
        """Traversal postorder: kiri - kanan - akar."""
        result: list[int] = []
        self._postorder(self.root, result)
        return result

    def _postorder(self, node: Node | None, result: list[int]) -> None:
        if node:
            self._postorder(node.left, result)
            self._postorder(node.right, result)
            result.append(node.key)


if __name__ == "__main__":
    values = [50, 30, 70, 20, 40, 60, 80, 100]
    bst = BST()

    print("=== Binary Search Tree Demo ===")
    print(f"Nilai yang dimasukkan: {values}\n")

    for v in values:
        bst.insert(v)

    print(f"Nilai terkecil (min): {bst.find_min()}")
    print(f"Nilai terbesar (max): {bst.find_max()}\n")

    # Uji pencarian
    for target in [40, 90]:
        found = bst.search(target)
        status = "ditemukan" if found else "TIDAK ditemukan"
        print(f"Pencarian {target}: {status}")

    print()
    print(f"Inorder   : {bst.inorder()}")
    print(f"Preorder  : {bst.preorder()}")
    print(f"Postorder : {bst.postorder()}")
