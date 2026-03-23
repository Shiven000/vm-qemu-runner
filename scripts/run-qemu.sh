#!/bin/sh
set -eu

# defaults
MEM=4096
CPUS=4
IMAGE=
ISO=

while [ $# -gt 0 ]; do
	case "$1" in
	--image)
		IMAGE="$2"
		shift 2
		;;
	--iso)
		ISO="$2"
		shift 2
		;;
	--mem)
		MEM="$2"
		shift 2
		;;
	--cpus)
		CPUS="$2"
		shift 2
		;;
	*)
		echo "Unknown argument: $1" >&2
		exit 1
		;;
	esac
done

[ -n "$IMAGE" ] || {
	echo "IMAGE not set" >&2
	exit 1
}

[ -f "$IMAGE" ] || {
	echo "Missing image: $IMAGE" >&2
	exit 1
}

[ -n "$ISO" ] && [ ! -f "$ISO" ] && {
	echo "Missing ISO: $ISO" >&2
	exit 1
}

KVM_FLAGS=""
if [ -e /dev/kvm ]; then
	KVM_FLAGS="-enable-kvm -cpu host"
fi

exec qemu-system-x86_64 \
	$KVM_FLAGS \
	-m "$MEM" \
	-smp "$CPUS" \
	-drive file="$IMAGE",format=qcow2 \
	${ISO:+-cdrom "$ISO" -boot order=d} \
	-device virtio-net-pci,netdev=net0 \
	-netdev user,id=net0 \
	-device virtio-rng-pci
