podman run --name libvirt-fedora \
       --rm -ti --security-opt label=disable \
       -v /var/run/libvirt:/var/run/libvirt \
       -v /sys/fs/cgroup:/sys/fs/cgroup \
       -v /run/dbus:/run/dbus \
       --device=/dev/kvm \
       --net=host \
       --privileged \
       libvirt-fedora:latest
