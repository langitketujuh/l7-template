function list --description 'List of file installed packages from XBPS repositories'
    xbps-query --regex -Rf $argv
end
