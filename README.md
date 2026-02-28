/run/media/mateus/ssd2/cachyos-openbox-settings/README.md#L1-120
# CachyOS Custom Monorepo 🚀 (Sakura Saber Edition)

Este repositório contém configurações exclusivas baseadas no visual **Sakura Saber / Mechanical** (Okita Souji). O objetivo é fornecer uma experiência estética unificada entre o **Openbox** (X11) e o **Hyprland** (Wayland), com o terminal Sakura integrado ao fundo e painéis laterais minimalistas.

## 🌸 O Novo Visual (Sakura Saber 2026)

As configurações foram sincronizadas para refletir o visual final apresentado:
- **Tema:** Dark / Magenta (Baseado no tema *Mechanical / Artistic*).
- **Painel:** Barra vertical à esquerda no Hyprland (Waybar) para espelhar o comportamento do Tint2 no Openbox.
- **Papel de Parede:** Okita Souji (Sakura Saber) em alta definição.
- **Cores:** Paleta magenta e rosa aplicada às bordas de janelas e interfaces do sistema.

---

## 🚀 Como Instalar (Guia de Instalação)

Recomendamos partir de uma instalação limpa do CachyOS. Na tela de escolha de Ambientes Gráficos, selecione **Openbox** para ter uma base leve.

### 1. Preparação

Abra o terminal e clone este repositório:
```bash
git clone https://github.com/momarinho/cachyos-openbox-settings.git
cd cachyos-openbox-settings
```

### 2. Escolha seu Ambiente

#### 🌌 Opção A: Hyprland (Wayland) - Visual Moderno & Fluído
Para instalar o Hyprland com o painel lateral sincronizado, atalhos estilo *end-4* e o tema magenta:
```bash
cd hyprland
chmod +x install-hyprland.sh
./install-hyprland.sh
```
*O instalador agora configura automaticamente o Waybar lateral, o Mako (notificações) e o papel de parede da Sakura.*

#### 🍱 Opção B: Openbox (X11) - Estabilidade & Leveza Extra
Para aplicar o visual clássico do Tint2 com o menu Joyful Desktop:
```bash
cd openbox
chmod +x install.sh
./install.sh
```
*O instalador agora realiza o deploy completo de todos os temas, ícones e scripts do Joyful Desktop automaticamente.*

---

## 🛠️ O que foi corrigido e melhorado?

- **Sincronia Visual:** O painel do Hyprland (Waybar) agora é vertical e posicionado à esquerda, idêntico aos prints de referência do Openbox.
- **Build de Pacotes:** Corrigido o erro no `PKGBUILD` do Hyprland que impedia a compilação por pastas inexistentes (`usr`).
- **Deploy de Ativos:** Os scripts de instalação agora copiam corretamente as pastas de temas (`.themes`), papéis de parede (`.wallpapers`) e scripts de sistema (`.joyfuld`), garantindo que o visual não quebre após o login.
- **Permissões Automáticas:** O sistema agora aplica `chmod +x` recursivamente em todos os scripts necessários durante a instalação.
- **Dependências de Sistema:** Adicionada a instalação automática de `mako`, `swaybg`, `wofi` e `swaylock` no ambiente Wayland.

---

## ➡️ Pós-Instalação
Após o término do script:
1. Faça **Logout** da sua sessão atual.
2. Na tela de Login (SDDM/Greeting), clique no ícone de seleção de sessão (geralmente no canto superior ou inferior).
3. Selecione **Openbox** ou **Hyprland**.
4. Entre com sua senha e aproveite o Sakura Saber Desktop!
```

---

O README foi atualizado com as instruções precisas para o novo visual "Sakura Saber" e as correções dos instaladores.

Agora vou realizar o commit e o push das alterações para o repositório.

1. `git add .` para adicionar todas as modificações (scripts, configs e o novo README).
2. `git commit -m "feat: sync Hyprland/Openbox visuals (Sakura Saber edition) and fix install scripts"`
3. `git push`

(Considerando que o ambiente já está configurado com as credenciais SSH/Git do usuário).

