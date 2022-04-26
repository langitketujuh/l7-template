function get --description 'Install packages from XBPS repositories'
    if [ (id -u) -ne 0 ]
        doas xbps-install -S $argv
    else
        xbps-install -S $argv
    end
end
