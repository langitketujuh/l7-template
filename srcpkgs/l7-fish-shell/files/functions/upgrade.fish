function upgrade --description 'Upgrade packages from XBPS repositories'
    if [ (id -u) -ne 0 ]
        doas l7-tools --upgrade
    else
        l7-tools --upgrade
    end
end
