function installed --description 'List installed packages from XBPS repositories'
    xbps-query -s "$1*" | sed 's/^... \([^ ]*\)-.* .*/\1/'
end
