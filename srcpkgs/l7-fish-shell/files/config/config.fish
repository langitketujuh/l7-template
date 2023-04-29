if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -l xdg_data_home $XDG_DATA_HOME ~/.local/share ~/.nix-profile/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share:/nix/var/nix/profiles/default/share

for bindir in /var/lib/flatpak/exports/bin /nix/var/nix/profiles/default/bin ~/.local/share/flatpak/exports/bin ~/.nix-profile/bin ~/.yarn/bin ~/node_modules/.bin
    if test -d $bindir
        contains $bindir $PATH; or set -a PATH $bindir
    end
end
