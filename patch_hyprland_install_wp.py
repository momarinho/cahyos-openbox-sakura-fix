with open("hyprland/install-hyprland.sh", "r") as f:
    script = f.read()

script = script.replace(
    'cp -rf etc/skel/.config/* "$HOME/.config/"',
    'cp -rf etc/skel/.config/* "$HOME/.config/"\ncp -rf etc/skel/.wallpapers "$HOME/" 2>/dev/null || true'
)

with open("hyprland/install-hyprland.sh", "w") as f:
    f.write(script)
