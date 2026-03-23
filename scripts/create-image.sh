#!/bin/sh
set -eu

IMAGE=
SIZE=20G

while [ $# -gt 0 ]; do
	case "$1" in
	--image)
		IMAGE="$2"
		shift 2
		;;
	--size)
		SIZE="$2"
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

[ -e "$IMAGE" ] && {
	echo "Image already exists: $IMAGE" >&2
	exit 1
}

exec qemu-img create -f qcow2 "$IMAGE" "$SIZE"
