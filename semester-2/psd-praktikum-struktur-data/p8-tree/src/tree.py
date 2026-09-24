# tree.py
class Tree:
    def __init__(self, data: str):
        self.data = data
        self.children: list[Tree] = []

    def add_child(self, child):
        self.children.append(child)
        return self

    def remove_child(self, child):
        if child in self.children:
            self.children.remove(child)

        return self

    def print_children(self):
        if len(self.children) <= 0:
            return
        children_str = ", ".join(child.data for child in self.children)
        print(self.data, "->", children_str)
        for child in self.children:
            child.print_children()


def main():
    grandparent = Tree("Kakek--Nenek")
    parent = Tree("Ayah--Ibu")
    big_bro = Tree("Mas")
    big_sis = Tree("Mbak")
    me = Tree("Barra")
    lil_bro = Tree("Adik")

    grandparent.add_child(parent)
    parent.add_child(big_bro).add_child(big_sis).add_child(me).add_child(lil_bro)

    grandparent.print_children()


if __name__ == "__main__":
    main()
