sudo cp -f nixos/configuration.nix /etc/nixos/configuration.nix && \
cp -f tmux/.tmux.conf ~/.tmux.conf && \
mkdir -p ~/.config/nvim && cp -f nvim/init.lua ~/.config/nvim/ && \
sudo nixos-rebuild switch

