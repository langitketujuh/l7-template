function update --description 'Syncron repodata packages from XBPS repositories'
    if [ (id -u) -ne 0 ]
        if command -v doas >/dev/null && [ -f /etc/doas.conf ]
            set SUDO 'doas'
        else
            command -v sudo >/dev/null
            set SUDO 'sudo'
        end
        $SUDO xbps-install -S
    else
        xbps-install -S
    end
end
