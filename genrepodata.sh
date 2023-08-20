#!/usr/bin/env sh

for arch in x86_64 x86_64-musl; do

  if [ $arch = "x86_64-musl" ]; then
    main_dir="main/musl"
  else
    main_dir="main"
  fi

  for pkgs in $(ls hostdir/binpkgs/$main_dir/ | grep "\.xbps.sig2" | xargs | sed -e 's/.sig2//g') ; do

    # generate x86_64 repodata
    XBPS_TARGET_ARCH=${arch} xbps-rindex -a $PWD/hostdir/binpkgs/$main_dir/${pkgs}
    chmod --preserve-root 644 $PWD/hostdir/binpkgs/$main_dir/*.xbps.sig

  done

done
