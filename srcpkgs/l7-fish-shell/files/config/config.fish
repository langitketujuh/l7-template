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

abbr -ag d 'doas'
abbr -ag h 'hx'
abbr -ag l 'ls -lha'
abbr -ag r 'ranger'
abbr -ag t 'tmux'
abbr -ag g 'git'

abbr -ag ga 'git add'
abbr -ag gaa 'git add --all'
abbr -ag gb 'git branch'
abbr -ag gbl 'git blame -b -w'
abbr -ag gbr 'git branch --remote'
abbr -ag gcam 'git commit --amend'
abbr -ag gcb 'git checkout -b'
abbr -ag gcf 'git config --list'
abbr -ag gck 'git checkout main'
abbr -ag gcl 'git clone --recursive'
abbr -ag gcln 'git clean -fd'
abbr -ag gcm 'git commit -m'
abbr -ag gcp 'git cherry-pick'
abbr -ag gd 'git diff'
abbr -ag gdca 'git diff --cached'
abbr -ag gfa 'git fetch --all --prune'
abbr -ag gfg 'git fetch gh'
abbr -ag gfl 'git fetch gl'
abbr -ag gfs 'git fetch sh'
abbr -ag gignore 'git update-index --assume-unchanged'
abbr -ag glg 'git log --graph'
abbr -ag glo 'git log --oneline --decorate'
abbr -ag gls 'git log --stat'
abbr -ag glsp 'git log --stat -p'
abbr -ag gm 'git merge'
abbr -ag gmgm 'git merge gh/main'
abbr -ag gmlm 'git merge gl/main'
abbr -ag gmsm 'git merge sh/main'
abbr -ag gmt 'git mergetool --no-prompt'
abbr -ag gpgm 'git push -u gh main'
abbr -ag gplm 'git push -u gl main'
abbr -ag gpsm 'git push -u sh main'
abbr -ag gr 'git remote'
abbr -ag gra 'git remote add'
abbr -ag grh 'git reset HEAD'
abbr -ag grhh 'git reset HEAD --hard'
abbr -ag gs 'git status'
abbr -ag gsps 'git show --pretty=short --show-signature'
abbr -ag gsts 'git stash show --text'
abbr -ag gsu 'git submodule update'
abbr -ag gta 'git tag -a'
abbr -ag gts 'git tag -s'
abbr -ag gugm 'git pull gh main'
abbr -ag gulm 'git pull gl main'
abbr -ag gur 'git pull --rebase'
abbr -ag gusm 'git pull sh main'
