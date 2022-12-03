# Completions for query
# Author: Hervy Qurrotul Ainur Rozi <hervyqa@proton.me>

set -l progname query

set -l listall "(__fish_print_xbps_packages)"
set -l listinstalled "(__fish_print_xbps_packages -i)"

complete -c $progname -f
complete -c $progname -a "$listinstalled"
complete -c $progname -n "__fish_contains_opt -s R" -a "$listall"

complete -c $progname -s h -d 'Show the help message'
complete -c $progname -s v -d 'Enables verbose messages'
complete -c $progname -s V -d 'Show the version information'
