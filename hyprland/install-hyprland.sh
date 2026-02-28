#!/usr/bin/env bash
set -e

# ==============================================================================
# Cores para o Terminal (Estilo end-4)
# ==============================================================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # Sem Cor

# ==============================================================================
# Cabeçalho Estilizado
# ==============================================================================
clear
echo -e "${MAGENTA}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║      🚀 CACHYOS HYPRLAND CUSTOM INSTALLER (End-4 Style)      ║"
echo "║          Desenvolvido com Sakura & Sombras Dinâmicas         ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# 1. Checagem de ROOT (makepkg falha se rodar como root)
if [ "$EUID" -eq 0 ]; then
  echo -e "${RED}[ERRO] Por favor, não rode este script como root (sudo). O makepkg lidará com isso!${NC}"
  exit 1
fi

sleep 1

# ==============================================================================
# Passo 1: Sistema de Backup Seguro
# ==============================================================================
echo -e "${CYAN}[*] Passo 1: Verificando instalações anteriores...${NC}"
if [ -d "$HOME/.config/hypr" ]; then
    BACKUP_DIR="$HOME/.config/hypr.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${YELLOW}[!] Detectamos uma pasta Hyprland existente no seu usuário.${NC}"
    echo -e "${YELLOW}[!] Criando um backup seguro em: ${BACKUP_DIR}${NC}"
    mv "$HOME/.config/hypr" "$BACKUP_DIR"
    echo -e "${GREEN}[✔] Backup concluído!${NC}\n"
else
    echo -e "${BLUE}[+] Nenhuma configuração anterior detectada. Caminho livre!${NC}\n"
fi

sleep 1

# ==============================================================================
# Passo 2: Empacotamento / Dependências via Pacman
# ==============================================================================
echo -e "${CYAN}[*] Passo 2: Resolvendo dependências e construindo o pacote Wayland...${NC}"
PACKAGE=$(ls *.pkg.tar.zst 2>/dev/null | head -n 1 || true)

if [ -z "$PACKAGE" ]; then
    echo -e "${BLUE}[+] Arquivo pré-compilado não encontrado. Rodando makepkg...${NC}"
    # O makepkg vai pedir a senha sudo nativamente para instalar os requirements
    makepkg -si --noconfirm
    PACKAGE=$(ls *.pkg.tar.zst | head -n 1)
else
    echo -e "${GREEN}[+] Encontramos um pacote local novinho: ${PACKAGE}${NC}"
    echo -e "${YELLOW}[!] O pacman pedirá sua senha para instalá-lo no sistema:${NC}"
    sudo pacman -U --needed --noconfirm "$PACKAGE"
fi
echo -e "${GREEN}[✔] Pacote Base Instalado!${NC}\n"

sleep 1

# ==============================================================================
# Passo 3: Deploy das Configurações ("A Mágica")
# ==============================================================================
echo -e "${CYAN}[*] Passo 3: Injetando configs do Sakura Mágico + Atalhos do End-4...${NC}"
mkdir -p "$HOME/.config/hypr"

# Copia os arquivos ignorando a raiz de sistema e jogando direto na Home do usuário
cp -rf etc/skel/.config/hypr/* "$HOME/.config/hypr/"

echo -e "${GREEN}[✔] Configurações aplicadas na sua Home!${NC}\n"

# ==============================================================================
# Finalização
# ==============================================================================
echo -e "${MAGENTA}================================================================${NC}"
echo -e "${GREEN}🎉 TUDO PRONTO! INSTALAÇÃO BEM-SUCEDIDA! 🎉${NC}"
echo -e "${MAGENTA}================================================================${NC}"
echo -e "O Hyprland com Sakura vivo no fundo já está alocado para o usuário ${CYAN}$USER${NC}."
echo -e "➡️  Para ver a mágica, encerre sua sessão atual, mude para 'Hyprland' no seu Gerenciador de Login, e aproveite!"
echo ""

