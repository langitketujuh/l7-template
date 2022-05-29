#!/usr/bin/env sh

# Make sure we don't inherit these from env.

while getopts "a:p:h:" opt; do
case $opt in
	a) ARCH="$OPTARG";;
	p) PACKAGES="$OPTARG";;
	h) echo "${0#/*}: [-a i686|x86_64|x86_64-musl|all] [-p packages]" >&2; exit 1;;
esac
done
shift $((OPTIND - 1))

[ ! -x build.sh ] && exit 0

build_xbps(){
  # clean
  XBPS_TARGET_ARCH=$ARCH ./xbps-src clean
  # build packages
  ./xbps-src -m $MASTER_DIR pkg ${f}
  # add signed by
  XBPS_TARGET_ARCH=$ARCH xbps-rindex --sign --signedby "LangitKetujuh Linux" --privkey ~/.ssh/privkey.pem $PWD/hostdir/binpkgs/main
  # generate signature
  XBPS_TARGET_ARCH=$ARCH xbps-rindex --sign-pkg --privkey ~/.ssh/privkey.pem $PWD/hostdir/binpkgs/main/${f}*.xbps
}

if [ "$ARCH" = i686 ]; then
  # build packages
  for f in $PACKAGES; do
    MASTER_DIR="masterdir-i686"
    build_xbps
  done
  # generate repodata
  XBPS_TARGET_ARCH=$ARCH xbps-rindex -a $PWD/hostdir/binpkgs/main/*.xbps -f
  chmod --preserve-root 644 $PWD/hostdir/binpkgs/main/${f}*.sig
elif [ "$ARCH" = x86_64 ]; then
  # build packages
  for f in $PACKAGES; do
    MASTER_DIR="masterdir-x86_64"
    build_xbps
  done
  # generate repodata
  XBPS_TARGET_ARCH=$ARCH xbps-rindex -a $PWD/hostdir/binpkgs/main/*.xbps -f
  chmod --preserve-root 644 $PWD/hostdir/binpkgs/main/${f}*.sig
elif [ "$ARCH" = x86_64-musl ]; then
  # build packages
  for f in $PACKAGES; do
    MASTER_DIR="masterdir-x86_64-musl"
    build_xbps
  done
  chmod --preserve-root 644 $PWD/hostdir/binpkgs/main/${f}*.sig
  # moving to musl dir
  mkdir -pv $PWD/hostdir/binpkgs/main/musl
  for m in $(ls $PWD/hostdir/binpkgs/main/ | grep "x86_64-musl" | xargs); do
    mv $PWD/hostdir/binpkgs/main/${m} $PWD/hostdir/binpkgs/main/musl
  done
  # generate repodata
  XBPS_TARGET_ARCH=$ARCH xbps-rindex -a $PWD/hostdir/binpkgs/main/musl/*.xbps -f
else
  echo "Architecture not support"
fi
