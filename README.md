# Personal dotfiles and scripts

For read-only access:

```sh
git clone https://github.com/fredrikfoss/dot.git
cd dot
make
```

For read-write access (requires existing SSH key pair):

```sh
git clone git@github.com:fredrikfoss/dot.git
cd dot
make
```

For read-write access on remote system, generate extra SSH key pair with long but memorable passphrase, add to GitHub account and copy to remote (or generate on remote):

```sh
ssh-keygen -f /tmp/somekey -t ed25519 -a 100 -C "remotesystem"
# give a passphrase when prompted
# add key to GitHub account
scp /tmp/somekey username@remote_host:~/.ssh/somekey
```
