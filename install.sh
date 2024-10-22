#!/usr/bin/env sh

set -eu

backup_and_link() {
    src="$1"
    dest="$2"

    if [ -L "$dest" ]; then
        echo "Removing symlink $dest"
        rm "$dest"
    elif [ -e "$dest" ]; then
        echo "File $dest already exists and will be backed up to $dest.bak"
        mv "$dest" "$dest.bak"
    fi

    echo "Creating symlink $dest → $src"
    ln -s "$src" "$dest"
    echo
}

backup_and_link "$(pwd)/.gitconfig" "$HOME/.gitconfig"
backup_and_link "$(pwd)/.gitignore" "$HOME/.gitignore"
backup_and_link "$(pwd)/.gitconfig.user" "$HOME/.gitconfig.user"

backup_and_link "$(pwd)/.editorconfig" "$HOME/.editorconfig"
