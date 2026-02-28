#!/usr/bin/env bash

# Interrompe o script se ocorrer algum erro crítico
set -e

echo "🚀 Iniciando instalação do CachyOS Openbox Custom (Sakura Mágica 2026)..."

# Busca pelo pacote gerado no diretório
PACKAGE=$(ls *.pkg.tar.zst 2>/dev/null | head -n 1)

if [ -z "$PACKAGE" ]; then
    echo "📦 Construindo o pacote (makepkg)..."
    # Adiciono --noconfirm para ser automático e -si para instalar
    makepkg -si --noconfirm
    PACKAGE=$(ls *.pkg.tar.zst | head -n 1)
else
    echo "📦 Pacote pré-compilado encontrado ($PACKAGE). Instalando..."
    sudo pacman -U --needed --noconfirm "$PACKAGE"
fi

echo "⚙️ Configurando o ambiente para o usuário: $USER..."
# Garantir que as pastas existam
mkdir -p ~/.config/openbox
mkdir -p ~/.config/picom

# Copiar os arquivos diretamente do repositório/clonado para a home do usuário
cp -rf etc/skel/.config/openbox/* ~/.config/openbox/
cp -rf etc/skel/.config/picom/* ~/.config/picom/

# Garantir permissão de execução
chmod +x ~/.config/openbox/autostart.sh

echo "✅ Tudo pronto! O Sakura de fundo e o novo Picom foram configurados para o usuário $USER."
echo "➡️  Para ver o resultado: Faça Logout e, na tela de login, selecione a sessão 'Openbox'."
