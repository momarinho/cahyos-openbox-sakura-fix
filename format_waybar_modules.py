import re

with open("hyprland/etc/skel/.config/waybar/config", "r") as f:
    config_string = f.read()

# Using regex to replace the modules arrays
config_string = re.sub(r'"modules-left":\s*\[.*?\]', '"modules-left": [\n        "custom/rofi",\n        "custom/power"\n    ]', config_string, flags=re.DOTALL)
config_string = re.sub(r'"modules-center":\s*\[.*?\]', '"modules-center": [\n        "tray"\n    ]', config_string, flags=re.DOTALL)
config_string = re.sub(r'"modules-right":\s*\[.*?\]', '"modules-right": [\n        "hyprland/workspaces",\n        "clock"\n    ]', config_string, flags=re.DOTALL)

with open("hyprland/etc/skel/.config/waybar/config", "w") as f:
    f.write(config_string)
