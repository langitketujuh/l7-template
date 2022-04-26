function deps --description 'Dependencies packages of XBPS repositories'
    xbps-query -vRx $argv
end
