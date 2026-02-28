import re

with open("hyprland/etc/skel/.config/waybar/style.css", "r") as f:
    css_string = f.read()

# Change flex-direction for workspaces to make them stack vertically
css_string = css_string.replace('margin: 3px 5px;', 'margin: 5px 3px;')
css_string = css_string.replace('padding: 3px 5px;', 'padding: 5px 3px;')
css_string = css_string.replace('border-radius: 14px;', 'border-radius: 0px;')
css_string = css_string.replace('#workspaces {\n    background-color: #111827;', '#workspaces {\n    background-color: transparent;\n    flex-direction: column;')
css_string = css_string.replace('#waybar {\n    background-color: transparent;', '#waybar {\n    background-color: #1b1e28;\n    opacity: 0.9;')
css_string = css_string.replace('min-height: 0;', 'min-height: 0;\n    min-width: 0;')

with open("hyprland/etc/skel/.config/waybar/style.css", "w") as f:
    f.write(css_string)
