# Completions for search
# Author: Hervy Qurrotul Ainur Rozi <hervyqa@proton.me>

set -l progname search

set -l listall "(__fish_print_xbps_packages)"

function __fish_print_xbps_pkg_props
    printf 'alternatives\tList of alternatives provided by the package\n'
    printf 'architecture\tArchitecture of machine\n'
    printf 'archive-compression-type\tType of archive\'s compression format\n'
    printf 'automatic-install\tWas the package installed automatically\n'
    printf 'build-options\tOptions used to build the package\n'
    printf 'conf_files\tList of provided system configuration files\n'
    printf 'conflicts\tList of packages the package conflicts with\n'
    printf 'filename-sha256\tFilename\'s sha256\n'
    printf 'filename-size\tFilename\'s size\n'
    printf 'homepage\tHomepage of the package\n'
    printf 'install-date\tDate the package was installed\n'
    printf 'install-msg\tMessage printed during installation\n'
    printf 'install-script\tPrint the package\'s install script\n'
    printf 'installed_size\tSize of the package\n'
    printf 'license\tLicense of the package\n'
    printf 'maintainer\tMaintainer of the package\n'
    printf 'metafile-sha256\tMetafile\'s sha256\n'
    printf 'pkgver\tThe package\'s name/version tuple\n'
    printf 'preserve\tWill files be preserved after update\n'
    printf 'provides\tList of virtual packages provided by the package\n'
    printf 'remove-msg\tMessage printed during removal\n'
    printf 'remove-script\tPrint the package\'s removal script\n'
    printf 'replaces\tList of packages the package replaces\n'
    printf 'repository\tRepo where package was downloaded from\n'
    printf 'run_depends\tList of packages required to run the package\n'
    printf 'reverts\tList of versions the package reverts\n'
    printf 'shlib-provides\tList of provided shared libraries\n'
    printf 'shlib-requires\tList of required shared libraries\n'
    printf 'short_desc\tShort description of the package\n'
    printf 'source-revisions\tGit revision used to build the package\n'
    printf 'state\tState of the package\n'
end

complete -c $progname -f
complete -c $progname -a "$listall"

complete -c $progname -s C -d 'Use this XBPS configuration directory' -xa "(__fish_complete_directories)"
complete -c $progname -s c -d 'Use this cache directory to store binary packages' -xa "(__fish_complete_directories)"
complete -c $progname -s d -d 'Enable extra debugging shown to stderr'
complete -c $progname -s h -d 'Show the help message'
complete -c $progname -s i -d 'Ignore repositories defined in configuration files'
complete -c $progname -s M -d 'For remote repositories, the data is fetched and stored in memory only'
complete -c $progname -s p -d 'Match one or more package properties' -xa "(__fish_complete_list , __fish_print_xbps_pkg_props)"
complete -c $progname -l repository -d 'Append the specified repository to the top of the list'
complete -c $progname -l regex -d 'Use Extended Regular Expressions'
complete -c $progname -l fulldeptree -d 'Print a full dependency tree in the show dependencies mode'
complete -c $progname -s r -d 'Use this path for the target root directory' -xa "(__fish_complete_directories)"
complete -c $progname -s v -d 'Enables verbose messages'
complete -c $progname -s V -d 'Show the version information'
