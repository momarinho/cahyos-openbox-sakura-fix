# CachyOS Openbox Custom (Sakura + Picom Fix)

Este repositório é um fork customizado (e independente) das configurações oficiais do **Openbox do CachyOS**. Como algumas dependências originais deixaram de ser mantidas (ex: `picom-ibhagwan-git`), este projeto foi atualizado e focado em estabilidade, modernidade e um visual "ninja" no desktop.

## 🛠 O que foi alterado/adicionado?

1. **Picom Moderno:**
   - Substituição do `picom-ibhagwan-git` pelo `picom` oficial do Arch.
   - Configurações renovadas no `picom.conf` (`xrender`, sombras arredondadas, efeitos suaves de *fade in/out* e exclusão de sombras para docks/desktop).
2. **Terminal Sakura no Fundo:**
   - Troca do `rxvt-unicode` pelo moderno **Sakura**.
   - O `autostart.sh` foi configurado para lançar o Sakura fixado em 100% da tela (`-g 100%x100%`) rodando o gerenciador de tarefas `top` como papel de parede dinâmico, sempre no fundo de todas as janelas.
3. **Instalação Automatizada:**
   - Criação do script `install.sh` para compilar o `PKGBUILD` localmente (sem precisar de fontes externas), instalar as dependências necessárias via Pacman e copiar as configurações finais diretamente para o usuário atual (`~/.config`).

---

## 🚀 Como Instalar

Esta configuração é ideal se você estiver em um sistema Arch Linux, CachyOS ou em um ambiente Openbox limpo.

### 1. Clone o repositório
Abra seu terminal e rode:
```bash
git clone https://github.com/momarinho/cahyos-openbox-sakura-fix.git
cd cahyos-openbox-sakura-fix
```

### 2. Rode o Script de Instalação Automática
O repositório já conta com o script que resolve tudo com um comando:
```bash
./install.sh
```
> **O que o script faz?**
> Ele usa o `makepkg` para empacotar o ambiente usando as configurações desta pasta, pedirá sua senha de `sudo` (apenas para o `pacman` instalar o pacote gerado e as dependências visuais) e por fim aplicará o `autostart.sh` e o `picom.conf` no seu diretório de usuário (`~/.config`).

---

## 💻 Como Acessar a Sessão
Se você usa outro ambiente (como KDE Plasma ou GNOME), estas configurações não afetarão o seu uso diário lá.
Para ver o resultado:
1. Salve seu trabalho atual e faça **Logout** (Encerrar Sessão).
2. Na tela do seu Gerenciador de Login (Ex: SDDM, LightDM), clique seletor de sessões.
3. Escolha a sessão **Openbox** (ou CachyOS Openbox).
4. Insira sua senha e entre! O Sakura e o Picom customizado iniciarão automaticamente de fundo.

---

### Agradecimentos / Créditos Originais
- Base do projeto pelo [CachyOS](https://github.com/cachyos).
- Configurações incríveis por [owl4ce](https://github.com/owl4ce/dotfiles/) ❤️.
