#!/usr/bin/env sh

# Make sure we don't inherit these from env.

while getopts "p:h:" opt; do
case $opt in
	p) PACKAGES="$OPTARG";;
	h) echo "${0#/*}: [-a x86_64|x86_64-musl] [-p packages]" >&2; exit 1;;
esac
done
shift $((OPTIND - 1))

[ ! -x build.sh ] && exit 0

for arch in x86_64 x86_64-musl; do

  # clean masterdir
  XBPS_TARGET_ARCH=${arch} ./xbps-src clean -m masterdir-${arch}

  # new masterdir
  ./xbps-src -m masterdir-${arch} binary-bootstrap ${arch}

  # build packages xbps
  for pkgs in $PACKAGES; do

    ver_pkgs=$(grep 'version=' $PWD/srcpkgs/${pkgs}/template | sed -e 's/version=//g')
    rev_pkgs=$(grep 'revision=' $PWD/srcpkgs/${pkgs}/template | sed -e 's/revision=//g')
    basename_pkgs="${pkgs}-${ver_pkgs}_${rev_pkgs}.${arch}.xbps"

    # build xbps
    ./xbps-src -m masterdir-${arch} pkg ${pkgs}

    if [ $arch = "x86_64-musl" ]; then
      main_dir="main/musl"
    else
      main_dir="main"
    fi

    # moving to musl dir if musl pkgs
    if [ $arch = "x86_64-musl" ]; then
      mkdir -pv $PWD/hostdir/binpkgs/main/musl
      for musl_pkgs in $(ls $PWD/hostdir/binpkgs/main/ | grep "x86_64-musl" | xargs); do
        mv $PWD/hostdir/binpkgs/main/${musl_pkgs} $PWD/hostdir/binpkgs/main/musl/
      done
    fi

    # add signed by
    XBPS_TARGET_ARCH=${arch} xbps-rindex --privkey ~/.ssh/privkey.pem --sign --signedby "LangitKetujuh Linux" $PWD/hostdir/binpkgs/$main_dir/

    # generate signature
    XBPS_TARGET_ARCH=${arch} xbps-rindex --privkey ~/.ssh/privkey.pem --sign-pkg $PWD/hostdir/binpkgs/$main_dir/${basename_pkgs}

    # generate x86_64 repodata
    XBPS_TARGET_ARCH=${arch} xbps-rindex -a $PWD/hostdir/binpkgs/$main_dir/*.xbps
    chmod --preserve-root 644 $PWD/hostdir/binpkgs/$main_dir/${basename_pkgs}.sig

  done

done
