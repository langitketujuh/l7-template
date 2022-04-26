function update --description 'Syncron repodata packages from XBPS repositories'
    if [ (id -u) -ne 0 ]
        doas xbps-install -S
    else
        xbps-install -S
    end
end
