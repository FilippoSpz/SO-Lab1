# Address Book Script

This project is a Bash script that implements a simple address book management system. It allows you to view, search,
insert, and delete entries in a CSV file.

---

## Features

1. **View (`view`)**
   Displays all entries in the address book sorted by email in a tabular format.

2. **Search (`search <string>`)**
   Searches for a string in all fields of the address book and prints matching entries. If no results are found, it
   prints "Not found."

3. **Insert (`insert`)**
   Allows adding a new entry to the address book. If the provided email already exists, the script does not insert the
   entry and prints an error message.

4. **Delete (`delete <mail>`)**
   Deletes the entry associated with the provided email. If the email is not found, it prints "Cannot find any record."

---

## Usage

Make the script executable:

    chmod +x address-book.sh

--- 

## Features

1. **View (`view`)**  
   Displays all entries in the address book sorted by email in a tabular format. If the file does not exist, it prints
   an error message.

2. **Search (`search <string>`)**  
   Searches for a string in all fields of the address book and prints matching entries. If no results are found, it
   prints "Not found." The search is case-insensitive.

3. **Insert (`insert`)**  
   Allows adding a new entry to the address book. The script prompts the user to input the following fields:
    - Name
    - Surname
    - Phone
    - Email
    - City
    - Address

   If the provided email already exists in the address book, the script does not insert the entry and prints an error
   message.

4. **Delete (`delete <mail>`)**  
   Deletes the entry associated with the provided email. If the email is found, the corresponding entry is removed while
   keeping the header intact. If the email is not found, it prints "Cannot find any record."

---

## License

This project is intended for educational purposes only and is not meant for commercial use.

---

## Author

- **Name**: [Filippo Spazzali]
- **School**: [Università degli Studi di Trieste]
- **Course**: [Computer Science]
