import re

with open("hyprland/PKGBUILD", "r") as f:
    pkg = f.read()

# remove usr from source array and md5sums
pkg = re.sub(r"source=\('etc' 'usr'\)", "source=('etc')", pkg)
pkg = re.sub(r"sha512sums=\('SKIP' 'SKIP'\)", "sha512sums=('SKIP')", pkg)
pkg = re.sub(r"cp -rf \"\$startdir/usr\"/\* \"\$pkgdir/usr/\"", "", pkg)

# update depends array to make sure mako, wofi, swaylock and waybar are there
pkg = re.sub(r"depends=\(.*?\)", "depends=('hyprland' 'waybar' 'rofi-wayland' 'sakura' 'swaybg' 'swayidle' 'gtklock' 'polkit-gnome' 'qt5-wayland' 'qt6-wayland' 'xdg-desktop-portal-hyprland' 'mako' 'wofi' 'swaylock')", pkg)

with open("hyprland/PKGBUILD", "w") as f:
    f.write(pkg)
