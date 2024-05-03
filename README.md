## The LangitKetujuh Linux source packages

### Build boostrap every architecture (x86_64-musl & x86_64)

- x86_64-musl

```
./xbps-src binary-bootstrap -A x86_64-musl
```

- x86_64

```
./xbps-src binary-bootstrap -A x86_64
```

### Generate privat key to signature xbps packages (one time)

```
ssh-keygen -t rsa -b 4096 -m PEM -f ~/.ssh/privkey.pem
```

Skip/empty your private password.

### Compile packages (all architecture)

```
./build.sh -p "<pkg>"
```

If build more packages.

```
./build.sh -p "<pkg1> <pkg2>"
```

Examples:

```
./build.sh -p "l7-tools l7-export"
```

### Update boostrap (optional)

- x86_64-musl

```
./xbps-src bootstrap-update -m masterdir-x86_64-musl
```

- x86_64

```
./xbps-src bootstrap-update -m masterdir-x86_64
```

### Thanks to

- [Void Linux & Contributor](https://github.com/void-linux/void-packages)
