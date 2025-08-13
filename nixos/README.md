sudo cp -f configuration.nix /etc/nixos/configuration.nix && sudo nixos-rebuild switch

to check all current symlinks here
sudo find / -type l -exec readlink -f {} \; -exec echo {} \; 2>/dev/null | awk -v d="$HOME/dotfiles" '
  NR % 2 == 1 { target = $0 }
  NR % 2 == 0 { if (target ~ d) print $0 " -> " target }
'
