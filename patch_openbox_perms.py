with open("openbox/install.sh", "r") as f:
    script = f.read()

script = script.replace(
    "chmod +x ~/.config/openbox/autostart.sh", 
    "chmod +x ~/.config/openbox/autostart.sh\n# Garantindo execucao nos scripts auxiliares\nchmod +x ~/.joyfuld 2>/dev/null || true\nfind ~/.scripts -type f -exec chmod +x {} \\; 2>/dev/null || true"
)

with open("openbox/install.sh", "w") as f:
    f.write(script)
