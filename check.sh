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

PACKAGES="isoimagewriter ardour l7-ardour ark l7-ark audacity l7-audacity baloo5 l7-baloo5 base-files l7-base-files breeze l7-breeze breeze-gtk l7-breeze-gtk breeze-icons l7-breeze-icons desktop-file-utils l7-desktop-file-utils l7-export fish-shell l7-fish-shell gimp l7-gimp godot l7-godot gwenview l7-gwenview kate5 l7-kate5 kcmutils l7-kcmutils konsole l7-konsole krita l7-krita kscreenlocker l7-kscreenlocker libreoffice l7-libreoffice obs l7-obs pipewire l7-pipewire plasma-desktop l7-plasma-desktop plasma-framework l7-plasma-framework removed-packages l7-removed-packages l7-repo runit-void l7-runit-void scribus l7-scribus sddm l7-sddm shadow l7-shadow systemsettings l7-systemsettings l7-tools"

xbps-install -S >/dev/null 2>&1

for c in $PACKAGES; do
   xbps-query -p pkgver ${c}
done | less
