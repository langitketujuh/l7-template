# template

Template of packages LangitKetujuh OS

## Build boostrap every architecture (x86_64-musl, x86_64 & i686)

```
./xbps-src -m masterdir-x86_64-musl binary-bootstrap x86_64-musl
./xbps-src -m masterdir-x86_64 binary-bootstrap x86_64
./xbps-src -m masterdir-i686 binary-bootstrap i686
```

## Generate privat key to signature xbps packages (one time)

```
ssh-keygen -t rsa -b 4096 -m PEM -f ~/.ssh/privkey.pem
```

Skip/empty your private password.

## Compile packages

```
./build.sh -a <arch> -p "<packages>"
```

Examples:

```
./build.sh -a x86_64 -p "l7-tools l7-export"
```

## Update boostrap (optional)

```
./xbps-src bootstrap-update
```

---
THANKS TO:

- VOID LINUX & CONTRIBUTOR - https://github.com/void-linux/void-packages
