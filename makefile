# ---- configuration ----
# IMAGE := disk/archlinux.qcow2
# IMAGE := disk/fedoralinux.qcow2
# IMAGE := disk/kalilinux.qcow2
	IMAGE := disk/freebsd.qcow2

# ISO := distros/Fedora/Fedora-Workstation-Live-43-1.6.x86_64.iso
# ISO := distros/arch_linux/archlinux-2026.01.01-x86_64.iso
# ISO := distros/kali/kali-linux-2025.4-installer-amd64.iso
	ISO := distros/FreeBSD/FreeBSD-15.0-RELEASE-amd64-disc1.iso

MEM   := 8192 # 8 gigs # 1024 bytes per gig
CPUS  := 4
SIZE  := 20G

# ---- default target ----
.PHONY: run
run: $(IMAGE)
	./scripts/run-qemu.sh \
		--image $(IMAGE) \
		--iso $(ISO) \
		--mem $(MEM) \
		--cpus $(CPUS)

# ---- image creation ----
$(IMAGE):
	./scripts/create-image.sh \
		--image $(IMAGE) \
		--size $(SIZE)

# ---- housekeeping ----
.PHONY: clean
clean:
	rm -f $(IMAGE)
