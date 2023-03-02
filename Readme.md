# AlmaLinux 9.1 etc. and VMs with Spice

RedHat has decided to 
[drop Spice](https://bugzilla.redhat.com/show_bug.cgi?id=2030592)
from the packages shipped with RHEL. As discussed in various places
(e.g. 
[here](https://www.reddit.com/r/redhat/comments/ux38f3/why_was_spice_qxl_removed_from_rhel_9/)),
this is bad news for anybody who does serious work with VMs that run on
RHEL 9.1 (in whatever flavour). Without support for cut & paste, performant
access over the internet and USB redirection the VMs aren't usable any
more for many use cases.

Nevertheless, there are good reasons why I want to stick to running
a RHEL 9.1 based system on my server. So I need a solution.

One approach is to replace the libvirt/qemu packages with the
[Fedora packages](https://github.com/ladar/qemu-spice-el9) 
on the server. This works. But with several hundred packages
being replaced, I do have some concerns regarding the stability of
my server.

Luckily, another approach has already been pioneered in the
context of ProjectAtomic: run libvirt 
[in a Container](https://github.com/projectatomic/docker-image-examples/blob/master/rhel-libvirt/libvirtd/Dockerfile).
I've taken this as a starting point and made some adaptions. 
I've put everything in directory [fedora-base](fedora-base) because
it is a Fedora-based container for libvirt. In case
RedHat drops Spice support from Fedora as well, it shouldn't be
too difficult to create a sibling directory with e.g. an Arch
based container for libvirt.