function configure --description 'Reconfigure installed packages from repositories'
    if [ (id -u) -ne 0 ]
        doas xbps-reconfigure -v $argv
    else
        xbps-reconfigure -v $argv
    end
end
