import json

with open("hyprland/etc/skel/.config/waybar/config", "r") as f:
    config_string = f.read()

# Try rudimentary string replacement to clean up the config instead of full json parse
# because standard json parser doesn't like the // comments in the file

config_string = config_string.replace('"position": "top",', '"position": "left",')
config_string = config_string.replace('"margin-left": 10,', '"margin-left": 0,')
config_string = config_string.replace('"margin-right": 10,', '"margin-right": 0,')
config_string = config_string.replace('"height": 20,', '"width": 45,')

with open("hyprland/etc/skel/.config/waybar/config", "w") as f:
    f.write(config_string)
