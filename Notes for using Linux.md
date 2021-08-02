Linux notes
================
Notes for some common problems in Linux

1. How to mount
- Start by creating the mount point, it can be any location you want:
`
	sudo mkdir /mnt/iso
`
- Mount the ISO file to the mount point by typing the following mount command:
`	sudo mount /path/to/image.iso /mnt/iso -o loop
`
- Unmount the ISO file by using the umount command followed by the directory where the image has been mounted:
`
	sudo umount /mnt/iso
`
2. Keyboard shortcuts
- Command to open speedtest-cli in another terminal window in Xfce4:
`
	xfce4-terminal -x sh -c "speedtest; bash"
`

3. Fix Ibus can’t work in offices
- Creat a ~/.xprofile file, then paste the following:
`
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
`
