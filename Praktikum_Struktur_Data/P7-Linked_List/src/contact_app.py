class Contact:
    def __init__(self, name, phone, email):
        self.name = name
        self.phone = phone
        self.email = email

    def __str__(self):
        return f"Nama: {self.name} | Telp: {self.phone} | Email: {self.email}"

class Node:
    def __init__(self, contact=None, next=None):
        self.contact = contact
        self.next = next

class ContactLinkedList:
    def __init__(self):
        self.root = Node()  # Dummy head
        self.tail = self.root

    def add_contact(self, name, phone, email):
        new_contact = Contact(name, phone, email)
        new_node = Node(new_contact)

        # Penambahan selalu O(1) karena kita melacak tail
        self.tail.next = new_node
        self.tail = new_node
        print(f"Sukses menambahkan kontak: {name}")

    def display_contacts(self):
        cur = self.root.next
        if not cur:
            print("Daftar kontak masih kosong.")
            return

        print("\n--- Daftar Kontak ---")
        while cur:
            print(cur.contact)
            cur = cur.next
        print("---------------------\n")

    def remove_by_name(self, name):
        cur = self.root.next
        prev = self.root

        while cur:
            # Membandingkan nama dengan mengabaikan huruf besar/kecil
            if cur.contact.name.lower() == name.lower():
                prev.next = cur.next
                # Perbarui tail jika elemen terakhir yang dihapus
                if cur == self.tail:
                    self.tail = prev
                print(f"Kontak '{name}' berhasil dihapus.")
                return True
            prev = cur
            cur = cur.next

        print(f"Gagal: Kontak '{name}' tidak ditemukan.")
        return False

if __name__ == "__main__":
    my_contacts = ContactLinkedList()

    my_contacts.add_contact("Alice", "0812345", "alice@email.com")
    my_contacts.add_contact("Bob", "0898765", "bob@email.com")

    my_contacts.display_contacts()

    my_contacts.remove_by_name("alice")
    my_contacts.display_contacts()
