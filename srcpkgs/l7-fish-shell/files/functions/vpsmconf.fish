function vpsmconf --description 'Install VPSM binbootstrap'
    set home (echo $HOME);
    set -Ux XBPS_DISTDIR $home/.cache/void-packages
    git clone --depth 1 https://github.com/void-linux/void-packages $XBPS_DISTDIR
    vpsm binbootstrap
    vpsm update-repo
    vpsm bootstrap-up
end
