#!/usr/bin/env sh

# Make sure we don't inherit these from env.

while getopts "p:h:" opt; do
case $opt in
	p) PACKAGES="$OPTARG";;
	h) echo "${0#/*}: [-a x86_64|x86_64-musl|all] [-p packages]" >&2; exit 1;;
esac
done
shift $((OPTIND - 1))

[ ! -x build.sh ] && exit 0

# build packages
for a in x86_64 x86_64-musl; do
  for p in $PACKAGES; do
    # clean
    XBPS_TARGET_ARCH=${a} ./xbps-src clean -m masterdir-${a}
    # new masterdir
    ./xbps-src -m masterdir-${a} binary-bootstrap ${a}
    # build packages
    ./xbps-src -m masterdir-${a} pkg ${p}
    # add signed by
    XBPS_TARGET_ARCH=${a} xbps-rindex --sign --signedby "LangitKetujuh Linux" --privkey ~/.ssh/privkey.pem $PWD/hostdir/binpkgs/main
    # generate signature
    XBPS_TARGET_ARCH=${a} xbps-rindex --sign-pkg --privkey ~/.ssh/privkey.pem $PWD/hostdir/binpkgs/main/${p}*.xbps
  done
  # generate repodata
  if [ $a = "x86_64-musl" ]; then
    # moving to musl dir
    mkdir -pv $PWD/hostdir/binpkgs/main/musl
    for m in $(ls $PWD/hostdir/binpkgs/main/ | grep "x86_64-musl" | xargs); do
      mv $PWD/hostdir/binpkgs/main/${m} $PWD/hostdir/binpkgs/main/musl
    done
    # x86_64-musl
    XBPS_TARGET_ARCH=${a} xbps-rindex -a $PWD/hostdir/binpkgs/main/musl/*.xbps -f
    chmod --preserve-root 644 $PWD/hostdir/binpkgs/main/musl/${p}*.sig
  else
    # i686 x86_64
    XBPS_TARGET_ARCH=${a} xbps-rindex -a $PWD/hostdir/binpkgs/main/*.xbps -f
    chmod --preserve-root 644 $PWD/hostdir/binpkgs/main/${f}*.sig
  fi
done
