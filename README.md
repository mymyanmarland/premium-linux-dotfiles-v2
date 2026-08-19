# Premium Linux Dotfiles v2

A clean, safe, and modern Linux developer shell built around **Zsh** and **Starship**.

Linux developer များအတွက် Zsh configuration, Starship prompt, Git aliases, Python/Node.js shortcuts နှင့် optional modern CLI tools များကို စနစ်တကျ စုစည်းထားသော dotfiles project ဖြစ်ပါတယ်။

## Features / အဓိကလုပ်ဆောင်ချက်များ

- Fast and clean Zsh configuration
- Beautiful Starship prompt
- Safe Git, Python နှင့် Node.js aliases
- Zsh autosuggestions နှင့် syntax highlighting support
- ရှိပြီးသား dotfiles များကို timestamp ပါ backup ပြုလုပ်ခြင်း
- Installer ကို အကြိမ်ကြိမ် run လုပ်လည်း မပျက်ခြင်း
- `dotfiles-doctor` ဖြင့် installation စစ်ဆေးခြင်း
- `eza`, `bat`, `ripgrep`, `zoxide` ရှိပါက အသုံးပြုခြင်း
- AI tools များကို ခွင့်ပြုချက်မရှိဘဲ အလိုအလျောက် install မလုပ်ခြင်း

## Linux Installation / Linux မှာ Install လုပ်နည်း

### Ubuntu / Debian

```bash
sudo apt update
sudo apt install -y git zsh bash curl
```

### Fedora

```bash
sudo dnf install -y git zsh bash curl
```

### Arch Linux

```bash
sudo pacman -Syu --needed git zsh bash curl
```

### Repository ကို Clone လုပ်ခြင်း

```bash
git clone https://github.com/mymyanmarland/premium-linux-dotfiles-v2.git ~/premium-linux-dotfiles-v2
cd ~/premium-linux-dotfiles-v2
```

### Installer ကို Run ခြင်း

```bash
chmod +x install.sh bin/dotfiles-doctor
./install.sh
exec zsh
```

Installer က ရှိပြီးသား `~/.zshrc`, `~/.aliases` နှင့် `~/.config/starship.toml` များကို timestamp ပါ backup ပြုလုပ်ပြီး symlink ချိတ်ပေးပါတယ်။ အကြိမ်ကြိမ် run လုပ်လည်း safe ဖြစ်ပါတယ်။

Zsh ကို default shell အဖြစ် သတ်မှတ်လိုပါက—

```bash
chsh -s "$(command -v zsh)"
```

ပြီးရင် logout/login ပြန်လုပ်ပါ။

## Verify / Installation စစ်ဆေးခြင်း

```bash
dotfiles-doctor
zsh -n ~/.zshrc
ls -l ~/.zshrc ~/.aliases ~/.config/starship.toml
```

## Useful aliases / အသုံးဝင်သော Shortcuts

```text
gs    git status
ga    git add -A
gc    git commit -m
gp    git push
gl    git log graph
gd    git diff
gco   git checkout
ll    ls -lah
la    ls -A
py    python3
pip   python3 -m pip
venv  python3 -m venv .venv
nd    npm run dev
nb    npm run build
```

Python virtual environment အသုံးပြုရန်—

```bash
venv
activate
```

## Optional tools / ထပ်မံထည့်သွင်းနိုင်သော Tools များ

`starship`, `zoxide`, `eza`, `bat`, `ripgrep`, `fzf`, `neovim` နှင့် `nvm` တို့ကို သီးခြား install လုပ်နိုင်ပါတယ်။ မရှိလည်း dotfiles က အလုပ်လုပ်ပါတယ်။

Ubuntu/Debian တွင်—

```bash
sudo apt install -y fzf ripgrep bat neovim
```

Starship မရှိသေးပါက—

```bash
curl -sS https://starship.rs/install.sh | sh
exec zsh
```

## Update / Update လုပ်နည်း

```bash
cd ~/premium-linux-dotfiles-v2
git pull
./install.sh
exec zsh
```

## Uninstall / ပြန်ဖျက်နည်း

```bash
rm -f ~/.zshrc ~/.aliases ~/.config/starship.toml ~/.local/bin/dotfiles-doctor
rm -rf ~/.local/share/zsh/plugins
```

Installer ဖန်တီးထားသော timestamp ပါ backup များကို မဖျက်ဘဲ ထားရှိပါမယ်။

## Troubleshooting / ပြဿနာဖြေရှင်းနည်း

```bash
chmod +x install.sh bin/dotfiles-doctor
./install.sh
source ~/.aliases
exec zsh
```

## Project Layout / Folder ဖွဲ့စည်းပုံ

```text
premium-linux-dotfiles-v2/
├── install.sh
├── README.md
├── shell/
│   ├── zshrc
│   └── aliases.zsh
├── config/
│   └── starship.toml
└── bin/
    └── dotfiles-doctor
```

## Security / လုံခြုံရေး

API keys, passwords နှင့် secrets များကို `.zshrc` သို့မဟုတ် repository ထဲ မထည့်ပါနှင့်။ Secret ဖိုင်များကို repository ပြင်ပတွင်ထားပြီး permission ကို `600` သတ်မှတ်ပါ—

```bash
chmod 600 ~/.config/dotfiles/secrets
```
```

Save ပြီးနောက် GitHub ကိုတင်ရန်—

```bash
git add README.md
git commit -m "docs: add Burmese Linux installation guide"
git push origin main
```

ပြီးရင် စစ်ရန်—

```bash
git status