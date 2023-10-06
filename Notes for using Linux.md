Linux notes
================
Notes for some common problems in Linux

**1. How to mount**
- Start by creating the mount point, it can be any location you want:
```
sudo mkdir /mnt/iso
```
- Mount the ISO file to the mount point by typing the following mount command:
```
sudo mount /path/to/image.iso /mnt/iso -o loop
```
- Unmount the ISO file by using the umount command followed by the directory where the image has been mounted:
```
sudo umount /mnt/iso
```
**2.  USB drive**
- List usb devices: ```lsusb```
- List usb drive: ```lsblk ```
- Format usb:
	```
	sudo mkfs.exfat /dev/sda1
	```

- Create a bootable usb
	- Use ```fdisk``` to partition the usb, if it's not partitioned yet (only show ```/dev/sda```, no ```/dev/sda1```)
	- Unmount the usb:
	```
		umount /dev/sda1
	```
	- Use ```dd``` and then ```sync``` to create bootable usb:
	```
		sudo dd if=path/to/input.iso of=/dev/sda status=progress && sync
	```

**3. Keyboard shortcuts**
- Command to open speedtest-cli in another terminal window in Xfce4:
```
xfce4-terminal -x sh -c "speedtest; bash"
```

**4. Fix Ibus can’t work in offices**
- Creat a ~/.xprofile file, then paste the following:
```
	export GTK_IM_MODULE=ibus	
	export QT_IM_MODULE=ibus
	export XMODIFIERS=@im=ibus
	# Dành cho những phần mềm dựa trên qt4
	export QT4_IM_MODULE=ibus
	# Dành cho những phần mềm dùng thư viện đồ họa clutter/OpenGL
	export CLUTTER_IM_MODULE=ibus
	export GLFW_IM_MODULE=ibus
	#chịu:
	export XIM_PROGRAM=/usr/bin/ibus-daemon
```

**5. Port**
- See all port: ```ss -tulw```
- See a specific port, e.g. port 5000: ```lsof -i:5000```

**6. LightDM remember user**
- Try to modify in ```/etc/lightdm/lightdm.conf```:
	```
	greeter-hide-users=false
	```

**7. No Windows in Grub***
- Grub does not use os-prober per default anymore and you will need to enable it in grub configuration to have other OS’s listed in the grub boot menu. Modify in ```/etc/default/grub```:
	```
	/etc/default/grub
	---------------------
	GRUB_DISABLE_OS_PROBER=false
	```
	Then run ```sudo update-grub```
	
**8. .desktop files**
- Global desktop files are in: ```/usr/local/share/applications```
- Local desktop files are in: ```~/.local/share/applications/```
- Flatpak desktop files are inside folders located in: ```/var/lib/flatpak/app/```

**9. Import .ssh files**
- Make the private readable only by you: 
```chmod 600 ~/.ssh/id_rsa```
- Then add it to the system: 
```ssh-add``` 
Confirm with ```ssh-add -l``` 

**10. Change host name**
Change in 2 files:
- ```/etc/hostname```: Edit host name
- ```/etc/hosts```: Add alias for localhost, on the 127.0.0.1 line. Or else some applications (such as Firefox) will take a long time to open 

**11. Chrome driver**
- Download and add chrome driver to ```/usr/bin/chromedriver/```
- Add path to ```.profile```: 
	```export PATH=$PATH:/usr/bin/chromedriver```
