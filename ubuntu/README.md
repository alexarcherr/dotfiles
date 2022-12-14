# Ubuntu-specific settings

```
git clone https://github.com/holman/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
ubuntu/all.sh
```

## Docker Setup

A Dockerfile exists in the repository as a testing ground for linux support. To set
up the image, make sure you have Docker installed and then run the following command.

```bash
docker build -t dotfiles --force-rm --build-arg PRIVATE_KEY="$(cat ~/.ssh/id_rsa)" --build-arg PUBLIC_KEY="$(cat ~/.ssh/id_rsa.pub)" .
```

This should create a `dotfiles` image which will set up the base environment with the
dotfiles repo cloned. To run, execute the following command.

```bash
docker run -it --rm dotfiles
```

This will open a bash shell in the container which can then be used to manually test
the dotfiles installation process with linux.
