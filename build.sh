#!/usr/bin/env sh
#-
# Copyright (c) 2020-2021 Hervy Qurrotul Ainur Rozi <hervyqa@pm.me>.
#
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#-

# Make sure we don't inherit these from env.

while getopts "a:p:h:" opt; do
case $opt in
	a) ARCH="$OPTARG";;
	p) PACKAGES="$OPTARG";;
	h) echo "${0#/*}: [-a x86_64|x86_64-musl] [-p packages]" >&2; exit 1;;
esac
done
shift $((OPTIND - 1))

[ ! -x build.sh ] && exit 0

if [ "$ARCH" = x86_64 ]; then
  MASTER_DIR="masterdir-x86_64"
  HOST_DIR="$PWD/hostdir-x86_64"
  rm -rfv $HOST_DIR/binpkgs/$PACKAGES{*.xbps,*.sig}
  XBPS_HOSTDIR="$HOST_DIR" ./xbps-src -m $MASTER_DIR pkg $PACKAGES
  xbps-rindex --privkey ~/.ssh/private.pem --sign --signedby "LangitKetujuh Linux" $HOST_DIR/binpkgs/
  xbps-rindex --privkey ~/.ssh/private.pem --sign-pkg $HOST_DIR/binpkgs/$PACKAGES*.xbps
  xbps-rindex -af $HOST_DIR/binpkgs/$PACKAGES*.xbps
elif [ "$ARCH" = x86_64-musl ]; then
  MASTER_DIR="masterdir-x86_64-musl"
  HOST_DIR="$PWD/hostdir-x86_64-musl"
  rm -rfv $HOST_DIR/binpkgs/$PACKAGES{*.xbps,*.sig}
  XBPS_HOSTDIR="$HOST_DIR" ./xbps-src -m $MASTER_DIR pkg $PACKAGES
  xbps-rindex --privkey ~/.ssh/private.pem --sign --signedby "LangitKetujuh Linux" $HOST_DIR/binpkgs/
  xbps-rindex --privkey ~/.ssh/private.pem --sign-pkg $HOST_DIR/binpkgs/$PACKAGES*.xbps
  xbps-rindex -af $HOST_DIR/binpkgs/$PACKAGES*.xbps
elif [ "$ARCH" = i686 ]; then
  MASTER_DIR="masterdir-x86"
  HOST_DIR="$PWD/hostdir-x86"
  rm -rfv $HOST_DIR/binpkgs/$PACKAGES{*.xbps,*.sig}
  XBPS_HOSTDIR="$HOST_DIR" ./xbps-src -m $MASTER_DIR pkg $PACKAGES
  xbps-rindex --privkey ~/.ssh/private.pem --sign --signedby "LangitKetujuh Linux" $HOST_DIR/binpkgs/
  xbps-rindex --privkey ~/.ssh/private.pem --sign-pkg $HOST_DIR/binpkgs/$PACKAGES*.xbps
  xbps-rindex -af $HOST_DIR/binpkgs/$PACKAGES*.xbps
else
  echo "Architecture not support"
fi
