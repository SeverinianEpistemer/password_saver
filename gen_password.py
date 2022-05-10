import string
import random
import pyperclip
import pyautogui
import tkinter as tk

def writing_function():
    with open("your path","a") as file:
        file.write("Service: " + entry.get()+"\nEmail: "+entry1.get()+"\nPassword: "+password+"\n\n")
    window.destroy()
characters = string.ascii_letters+"1234567890"
special_characters = "@-_!+"

password = ""
for x in range(12):
    password+=random.choice(characters)

password+=random.choice(special_characters)
password+=random.choice(special_characters)

pyperclip.copy(password)
pyautogui.hotkey('ctrl', 'v')

window = tk.Tk()
lbl = tk.Label(text="Insert the service name and the password")
entry = tk.Entry()
entry1 = tk.Entry()

btn = tk.Button(text ="Save", command = writing_function)
lbl.pack()
entry.pack()
entry1.pack()
btn.pack()
window.mainloop()

