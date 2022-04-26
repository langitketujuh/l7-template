function autoclean --description 'Remove orphan packages from local cache'
    if [ (id -u) -ne 0 ]
        doas xbps-remove -Oov
    else
        xbps-remove -Oov
    end
end
