# CachyOS Custom Monorepo 🚀

Este repositório contém configurações customizadas (com o terminal Sakura preso no fundo da tela rodando `top` e sombras/arredondamentos luxuosos) para duas interfaces diferentes: **Openbox** (X11) e **Hyprland** (Wayland).

## 📋 Checklist de Transformação para o Hyprland

### 📦 Fase 1: Estrutura do Monorepo
- [x] Criar a pasta base `hyprland/` e `openbox/` no repositório atual.
- [x] Mover os arquivos atuais do Openbox (PKGBUILD, install.sh, etc e usr) para dentro da pasta `openbox/`.
- [x] Atualizar o git para refletir essa nova organização limpa.

### 🐧 Fase 2: Clonando a Base do CachyOS Hyprland
- [x] Baixar os arquivos padrão de configuração do CachyOS Hyprland diretamente na pasta `hyprland/`.
- [x] Preparar um `PKGBUILD` específico dentro da pasta `hyprland` com as dependências do ecossistema Wayland (ex: `hyprland`, `waybar`, `rofi-wayland`, `sakura`).

### 🎨 Fase 3: Puxando o Visual (Refazendo o Picom no Wayland)
- [x] Editar o `hyprland.conf` base do CachyOS para ficar com o mesmo visual do Picom:
  - [x] Arredondamento (Rounding) = 12
  - [x] Sombra ativada (Drop Shadow) = true
  - [x] Alcance/Raio da Sombra (Shadow Range) = 12
  - [x] Offset da sombra = Dando aquele efeito 3D (-15, -15).

### 🌸 Fase 4: O Sakura no Fundo ("A Mágica")
- [x] Configurar no `hyprland.conf` para iniciar o terminal automaticamente: `exec-once = sakura -e "top; bash" &`
- [x] **Criar as Regras de Janela (Window Rules) precisas para o Sakura:**
  - [x] `windowrulev2 = float, class:^(sakura)$`
  - [x] `windowrulev2 = size 100% 100%, class:^(sakura)$`
  - [x] `windowrulev2 = center, class:^(sakura)$`
  - [x] `windowrulev2 = noborder, class:^(sakura)$`
  - [x] `windowrulev2 = noshadow, class:^(sakura)$`
  - [x] `windowrulev2 = pin, class:^(sakura)$` (prender em todas as workspaces)
  - [x] Colocar o Sakura atrás de tudo (layer de fundo).
  - [x] `windowrulev2 = nofocus, class:^(sakura)$`

### ⚙️ Fase 5: Script de Instalação Automática
- [x] Criar um script `install-hyprland.sh` paralelo, para compilar e instalar o ambiente num clique.

### ⌨️ Fase 6: Integração de Atalhos do End-4 (Opcional)
- [x] Fazer backup do `keybinds.conf` original do CachyOS.
- [x] Baixar os atalhos do repositório *end-4* dotfiles e filtrar os comandos.
- [x] Mesclar atalhos de janelas do End-4 com as chamadas de aplicativos nativos do nosso pacote CachyOS (rofi, waybar, sakura).
- [x] Remover dependências "fantasmas" (scripts customizados do End-4 que não existem na nossa ISO, como menus em ags ou scripts de volume.sh).

### 🚨 Fase 7: Revisão Arquitetural do Wayland (Conflitos e Camadas)
- [ ] **Corrigir o Z-Index do Sakura:** Encontrar uma forma de forçar a janela flutuante 100% do Sakura a ficar na camada do papel de parede real (Desktop Layer), para não sobrepor janelas *tiling* convencionais.
- [x] **Desativar Wallpaper Padrão:** Procurar e remover inicializações do `hyprpaper` ou `swaybg` no `autostart.conf` (já que o Sakura rodando `top` é o nosso wallpaper vivo, poupando muita CPU do sistema).
