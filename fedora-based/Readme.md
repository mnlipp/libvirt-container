```
./run-setup.sh
```

```
cd /etc
podman cp libvirt-fedora:/etc/libvirt .
```

```
cd /var/lib
podman cp libvirt-fedora:/etc/libvirt .
```

```
cd /usr/lib/firewalld/zones/
podman cp libvirt-fedora:/usr/lib/firewalld/zones/libvirt.xml
```
