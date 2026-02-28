# CachyOS Custom Monorepo 🚀

Este repositório contém configurações customizadas (com o terminal Sakura preso no fundo da tela rodando `top` e sombras/arredondamentos luxuosos) para duas interfaces diferentes: **Openbox** (X11) e **Hyprland** (Wayland).

## 📋 Checklist de Transformação para o Hyprland

### 📦 Fase 1: Estrutura do Monorepo
- [x] Criar a pasta base `hyprland/` e `openbox/` no repositório atual.
- [x] Mover os arquivos atuais do Openbox (PKGBUILD, install.sh, etc e usr) para dentro da pasta `openbox/`.
- [x] Atualizar o git para refletir essa nova organização limpa.

### 🐧 Fase 2: Clonando a Base do CachyOS Hyprland
- [ ] Baixar os arquivos padrão de configuração do CachyOS Hyprland diretamente na pasta `hyprland/`.
- [ ] Preparar um `PKGBUILD` específico dentro da pasta `hyprland` com as dependências do ecossistema Wayland (ex: `hyprland`, `waybar`, `rofi-wayland`, `sakura`).

### 🎨 Fase 3: Puxando o Visual (Refazendo o Picom no Wayland)
- [ ] Editar o `hyprland.conf` base do CachyOS para ficar com o mesmo visual do Picom:
  - [ ] Arredondamento (Rounding) = 12
  - [ ] Sombra ativada (Drop Shadow) = true
  - [ ] Alcance/Raio da Sombra (Shadow Range) = 12
  - [ ] Offset da sombra = Dando aquele efeito 3D (-15, -15).

### 🌸 Fase 4: O Sakura no Fundo ("A Mágica")
- [ ] Configurar no `hyprland.conf` para iniciar o terminal automaticamente: `exec-once = sakura -e "top; bash" &`
- [ ] **Criar as Regras de Janela (Window Rules) precisas para o Sakura:**
  - [ ] `windowrulev2 = float, class:^(sakura)$`
  - [ ] `windowrulev2 = size 100% 100%, class:^(sakura)$`
  - [ ] `windowrulev2 = center, class:^(sakura)$`
  - [ ] `windowrulev2 = noborder, class:^(sakura)$`
  - [ ] `windowrulev2 = noshadow, class:^(sakura)$`
  - [ ] `windowrulev2 = pin, class:^(sakura)$` (prender em todas as workspaces)
  - [ ] Colocar o Sakura atrás de tudo (layer de fundo).
  - [ ] `windowrulev2 = nofocus, class:^(sakura)$`

### ⚙️ Fase 5: Script de Instalação Automática
- [ ] Criar um script `install-hyprland.sh` paralelo, para compilar e instalar o ambiente num clique.
