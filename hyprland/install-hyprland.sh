#!/usr/bin/env bash
set -e
echo "🚀 Iniciando instalação do CachyOS Hyprland Custom (Sakura Mágica)..."
PACKAGE=$(ls *.pkg.tar.zst 2>/dev/null | head -n 1)
if [ -z "$PACKAGE" ]; then
    echo "📦 Construindo o pacote (makepkg)..."
    makepkg -si --noconfirm
    PACKAGE=$(ls *.pkg.tar.zst | head -n 1)
else
    echo "📦 Pacote pré-compilado encontrado ($PACKAGE). Instalando..."
    sudo pacman -U --needed --noconfirm "$PACKAGE"
fi
echo "⚙️ Configurando o ambiente para o usuário: $USER..."
mkdir -p ~/.config/hypr
cp -rf etc/skel/.config/hypr/* ~/.config/hypr/
echo "✅ Tudo pronto! O Sakura de fundo (Wayland) foi configurado para o usuário $USER."
