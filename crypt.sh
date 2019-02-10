#####EDIT THIS#####
DIR="/path/to/folder"
bytes="16"
###################
if [[ $(findmnt -M "$DIR") ]]; then
	echo "Folder is mounted!"
	sleep 0.5
	echo "Dismounting it..." 
	sudo umount -l "$DIR"
	sleep 0.5
else
	echo "Folder is not mounted!"
	sleep 0.5
	read -s -p "Enter password to mount it: " pass
	echo
	sudo mount -t ecryptfs "$DIR" "$DIR" -o key=passphrase,ecryptfs_cipher=aes,ecryptfs_key_bytes=$bytes,ecryptfs_passthrough=no,ecryptfs_enable_filename_crypto=no,passphrase_passwd=$pass
fi
