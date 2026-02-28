with open("hyprland/etc/skel/.config/hypr/config/colors.conf", "r") as f:
    colors = f.read()

# Replace green tones with pink/magenta tones similar to the screenshot
colors = colors.replace('rgba(82dcccff)', 'rgba(e85a84ff)') # light pink
colors = colors.replace('rgba(00aa84ff)', 'rgba(c7426eff)') # magenta
colors = colors.replace('rgba(007d6fff)', 'rgba(962a4dff)') # dark magenta
colors = colors.replace('rgba(01ccffff)', 'rgba(f28fb0ff)') # lighter pink/cyan replace

with open("hyprland/etc/skel/.config/hypr/config/colors.conf", "w") as f:
    f.write(colors)
