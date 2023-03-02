## libvirt running in Fedora container

### Container image

The container image can be build with the [Containerfile](Containerfile).
It's about 2 GiB, so I won't maintain a prebuild version.

### Initialze persistent storage

libvirt requires persistent storage for `/etc/libvirt` and 
`/var/lib/libvirt`. This storage is filled with a directory
structure and some files during installation.

The easiest way to transfer the initial content to the host
is to run the container without mounting the host volumes:


```sh
./run-setup.sh
```

Then, on the host, go to the directories used for persistent
storage. I simply use the directories that would be used by
ordinarily installed packages. So first initialize the persistent
storage for `/etc/libvirt`:

```sh
cd /etc
podman cp libvirt-fedora:/etc/libvirt .
```

Next, initialize persistent storage for `/usr/lib/libvirt`:

```sh
cd /var/lib
podman cp libvirt-fedora:/etc/libvirt .
```

### Initialize the firewall

Finally, create the filewall zone `libvirt` (usually done by
a post-install sript):

```sh
cd /usr/lib/firewalld/zones/
podman cp libvirt-fedora:/usr/lib/firewalld/zones/libvirt.xml
firewall-cli --reload

```

### Run the container

Create the directory `/var/run/libvirt` and test everything
with `./run.sh` or copy `libvirt-fedora.service` to
`/etc/systemd/system` and start the container as service, as
you'll do eventually anyway.

## ToDo

### Communiction and Authorization

I've kept the default communication using a unix socket 
and the user/group based authorization. However, authorization
only works for root. It this is a problem, configure something
else.

### Security

The container runs in privileged mode. This should not really 
be a problem, because this is how libvirtd also runs in an 
ordinary installation. But I may not have the whole picture.
