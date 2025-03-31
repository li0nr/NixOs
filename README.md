

# li0nr NixOs config.

Using gnome :
to dump the gnome extensions 
 - dconf dump /org/gnome/shell/extensions/ > shell-extensions.gnome
 - dconf load /org/gnome/shell/extensions/ < shell-extensions.gnome

this does not include the keyboard shortcuts.

