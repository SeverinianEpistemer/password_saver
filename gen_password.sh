#!/usr/bin/python3
import string
import random
import pyperclip
import tkinter as tk
import pysftp
import time
from pynput.keyboard import Key, Controller

def writing_function():
    with open("/home/chris/Documenti/script/passwords.txt","a") as file:
        file.write("Service name: " + entry.get("1.0","end-1c")+"\nEmail: "+entry1.get("1.0","end-1c")+"\nPassword: "+password+"\n\n")
    window.destroy()
    cnopts = pysftp.CnOpts()
    cnopts.hostkeys = None
    myHostname = "x"
    myUsername = "x"
    myPassword = "x"
    with pysftp.Connection(host=myHostname, username=myUsername, 
    password=myPassword, cnopts=cnopts) as sftp:
        localFilePath = '/home/chris/Documenti/script/passwords.txt'
        remoteFilePath = 'password'
        sftp.put(localFilePath, remoteFilePath)
    


characters = string.ascii_letters+"1234567890"
special_characters = "@[](/#*+"

password = ""
for x in range(12):
    password+=random.choice(characters)

password+=random.choice(special_characters) 
password+=random.choice(special_characters)

pyperclip.copy(password)
keyboard = Controller()
keyboard.press(Key.ctrl)
keyboard.press("v")
keyboard.release(Key.ctrl)
keyboard.release("v")

time.sleep(1/2)
window = tk.Tk()
bg = tk.PhotoImage(file = "/home/chris/Documenti/script/background.png")
labelf = tk.Label(window,image = bg)
labelf.place(x = 0,y = 0)
lbl = tk.Label(window,text="Insert the service name and the correlated email",padx = 15,pady =15,font="Verdana 12 bold",fg="white",bg="black").place(relx = 0.5,
                   rely = 0.4,
                   anchor = 'center')

entry = tk.Text(window,width = 20,height = 2,borderwidth= 1,relief="solid")
entry.place(relx = 0.5,
                   rely = 0.45,
                   anchor = 'center')
entry1 = tk.Text(window,width = 30,height = 2,borderwidth= 1,relief="solid")
entry1.place(relx = 0.5,
                   rely = 0.50,
                   anchor = 'center')

btn = tk.Button(window,text ="Salva", command = writing_function).place(relx = 0.5,
rely = 0.54,anchor="center")

window.mainloop()
