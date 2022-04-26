function flathub --description 'Add remote from flathub repo for flatpak'
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
end
