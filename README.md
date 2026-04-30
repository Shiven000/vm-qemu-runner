# Instructions

Make a directory for your ISO file, and specify the path to your ISO file as the ISO variable in the makefile. Then set your IMAGE variable to the path for your virtual disk storage (.qcow2). Then run QEMU with make, install the OS onto the disk, then go into the makefile and remove the ISO flag and boot the OS from the qcow2 virtual disk. If you already have a preloaded disk you want to load, just remove the ISO flag entirely and just pass in the path to your virtual disk.
