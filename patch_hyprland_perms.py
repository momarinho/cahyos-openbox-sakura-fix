with open("hyprland/install-hyprland.sh", "a") as f:
    f.write("\nchmod +x ~/.config/waybar/*.sh ~/.config/waybar/*.py 2>/dev/null || true\n")
