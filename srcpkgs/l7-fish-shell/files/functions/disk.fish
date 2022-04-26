function disk --description 'Quick list your block devices'
    lsblk -o name,fstype,fsavail,fsused,fsuse%,size,mountpoint
end
