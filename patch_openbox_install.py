import re

with open("openbox/install.sh", "r") as f:
    script = f.read()

# Replace the specific copying with a full sync of the skel directory
old_copy = r"cp -rf etc/skel/.config/openbox/\* ~/\.config/openbox/\ncp -rf etc/skel/.config/picom/\* ~/\.config/picom/"
new_copy = """# Copiar os arquivos diretamente do repositório/clonado para a home do usuário
cp -rf etc/skel/.config/* ~/.config/
cp -rf etc/skel/.local/* ~/.local/ 2>/dev/null || true
cp -rf etc/skel/.themes ~/.themes
cp -rf etc/skel/.scripts ~/.scripts
cp -rf etc/skel/.icons ~/.icons
cp -rf etc/skel/.wallpapers ~/.wallpapers
cp -f etc/skel/.gtkrc-2.0 ~/
cp -f etc/skel/.profile ~/
cp -f etc/skel/.Xresources ~/
cp -f etc/skel/.xinitrc ~/
cp -f etc/skel/.joyfuld ~/
"""

script = re.sub(old_copy, new_copy, script)

with open("openbox/install.sh", "w") as f:
    f.write(script)
