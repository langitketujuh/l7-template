function remove --description 'Remove packages from XBPS repositories'
    if [ (id -u) -ne 0 ]
        doas xbps-remove -R $argv
    else
        xbps-remove -R $argv
    end
end
