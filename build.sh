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
  XBPS_HOSTDIR="$HOST_DIR" ./xbps-src -m $MASTER_DIR pkg ${f}
  # add signed by
  XBPS_TARGET_ARCH=$ARCH xbps-rindex --privkey ~/.ssh/privkey.pem --sign --signedby "LangitKetujuh Linux" $HOST_DIR/binpkgs/main
  # generate signature
  XBPS_TARGET_ARCH=$ARCH xbps-rindex --privkey ~/.ssh/privkey.pem --sign-pkg $HOST_DIR/binpkgs/main/${f}*.xbps
}

generate_repodata(){
  XBPS_TARGET_ARCH=$ARCH xbps-rindex -a $HOST_DIR/binpkgs/main/*.xbps -f
}

if [ "$ARCH" = x86_64 ]; then
  for f in $PACKAGES; do
    MASTER_DIR="masterdir-x86_64"
    HOST_DIR="$PWD/hostdir-x86_64"
    build_xbps
  done
  generate_repodata
elif [ "$ARCH" = x86_64-musl ]; then
  for f in $PACKAGES; do
    MASTER_DIR="masterdir-x86_64-musl"
    HOST_DIR="$PWD/hostdir-x86_64-musl"
    build_xbps
  done
  generate_repodata
elif [ "$ARCH" = i686 ]; then
  for f in $PACKAGES; do
    MASTER_DIR="masterdir-i686"
    HOST_DIR="$PWD/hostdir-i686"
    build_xbps
  done
  generate_repodata
elif [ "$ARCH" = all ]; then
  for a in x86_64 x86_64-musl i686; do
    for f in $PACKAGES; do
      MASTER_DIR="masterdir-${a}"
      HOST_DIR="$PWD/hostdir-${a}"
      build_xbps
    done
  done
  generate_repodata
else
  echo "Architecture not support"
fi
