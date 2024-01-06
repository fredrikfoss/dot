# Personal dotfiles and scripts

Be careful with running the `./setup` scripts as they will overwrite existing files.

## Installing

For read-only access:

```sh
git clone http://github.com/fredrikfoss/dot.git
cd dot
./setup
```

For read-write access (requires existing ssh-keypair):

```sh
git clone git@github.com:fredrikfoss/dot.git
cd dot
./setup
```

For read-write access a on remote system, make extra ssh-keypair with long but memorable passphrase, add to GitHub account and put on remote system:

```sh
ssh-keygen -C mycomment -f /tmp/somekey -t ed25519
# give a passphrase when prompted
# add key to GitHub account
scp /tmp/somekey remote:~/.ssh/somekey
```
