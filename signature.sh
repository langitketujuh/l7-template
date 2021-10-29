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

for a in x86_64-musl x86_64 i686; do
  rm -v $PWD/hostdir-${a}/binpkgs/*.xbps.sig
  XBPS_TARGET_ARCH=${a} xbps-rindex --privkey ~/.ssh/privkey.pem --sign --signedby "LangitKetujuh Linux" $PWD/hostdir-${a}/binpkgs/
  XBPS_TARGET_ARCH=${a} xbps-rindex --privkey ~/.ssh/privkey.pem --sign-pkg $PWD/hostdir-${a}/binpkgs/*.xbps
  XBPS_TARGET_ARCH=${a} xbps-rindex -a $PWD/hostdir-${a}/binpkgs/*.xbps -f
done

