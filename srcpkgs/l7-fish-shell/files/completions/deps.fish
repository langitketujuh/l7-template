# Completions for deps
# Author: Hervy Qurrotul Ainur Rozi <hervyqa@proton.me>

set -l progname deps

set -l listall "(__fish_print_xbps_packages)"
set -l listinstalled "(__fish_print_xbps_packages -i)"

complete -c $progname -f
complete -c $progname -a "$listinstalled"
complete -c $progname -n "__fish_contains_opt -s R" -a "$listall"
