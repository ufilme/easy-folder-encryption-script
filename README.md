# 📁 Easy Folder Encryption Script
I was wondering on how to make file on my [Raspberry Pi](https://www.raspberrypi.org/) encrypted and I ended up making a script that did it for me.             
It's based on [ecryptfs](http://ecryptfs.org/) filesystem for linux with aes cipher.

## How this script works?
📌 Basically this allows you to mount encrypted folder if it's unmounted and dismount it when you're done.      
It checks if the determinated folder is mounted, if so the script unmount it, otherwise the script will mount it with a 16 bytes aes encryption level, asking you for a password. 

📌 Running this script twice will allow you to mount encrypted folder and unmount it.

📌 You need the folder mounted to read and write file and unmounted to have them encrypted.

# Installation

**BEFORE STARTING THE SCRIPT READ ALL**

---
**First** of all you need to update the repositories and install ecryptfs

    sudo apt-get update
    sudo apt-get install -y ecryptfs-utils lsof
---
**Then** you have to create a directory: the one you want to encrypt

    mkdir ~/secret-folder
**N.B.** *before put files into the folder mount it with encryption at least one* time

---
**Finally** download the script and edit it by replacing the variable `DIR` with the path to your folder

    nano ~/crypt.sh
You can also change the bytes for the encryption level at the variable `bytes`. Possible levels: 16, 24, 32.

---
# How to Run
You need to give to the script execution privilege with this command

    chmod +x crypt.sh
The run it

    ./crypt.sh
The first time the folder is unmounted so you will prompted for the encryption password.
Then, only this time, you need to answer `yes` to both questions. 

**More Knowledge**        
*The first question warn you saying that you never used the password, that is correct from the moment that's the first time you use it, and you could have typed it wrong.        
The second one ask you if you want to avoid this warning in future everytime you insert this password*
