function autoclean --description 'Remove orphan packages from local cache'
    if [ (id -u) -ne 0 ]
        if command -v doas >/dev/null && [ -f /etc/doas.conf ]
            set SUDO 'doas'
        else
            command -v sudo >/dev/null
            set SUDO 'sudo'
        end
        $SUDO xbps-remove -Oov
    else
        xbps-remove -Oov
    end
end
