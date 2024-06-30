# Fedora

Update everything:

```sh
sudo dnf -y upgrade --refresh
```

Allow virtual machines that use fusefs to install properly with SELinux:

```sh
sudo setsebool -P virt_use_fusefs 1
```

Setup dnf5 and settings:

```sh
sudo dnf copr enable rpmsoftwaremanagement/dnf-nightly
sudo dnf -y install dnf5
echo 'fastestmirror=True' | sudo tee --append /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee --append /etc/dnf/dnf.conf
```
