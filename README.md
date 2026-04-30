# Instructions

Make a directory for your ISO file, and specify the path as the ISO variable in the makefile. Then set your IMAGE variable to the path for your virtual disk storage (.qcow2). Run QEMU with make, install the OS onto the disk, then go into the makefile and remove the ISO flag to boot the OS from the qcow2 virtual disk. If you already have a preinstalled disk you want to load, just remove the ISO flag entirely and just pass in the path to your virtual disk.
