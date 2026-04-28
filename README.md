# VSCode Neovim Productivity Kit

A minimal Neovim configuration for developers who use the **VSCode Neovim** extension and want a practical Vim-style workflow inside VSCode.

The idea is simple:

- **VSCode** handles UI, search, Git, terminal, LSP and formatting.
- **Neovim** handles modal editing, Vim motions and text manipulation.
- Plugin count stays low to avoid conflicts and slowdowns.

## Features

- Vim motions inside VSCode
- Practical `Space` leader shortcuts
- Fast file and project navigation
- Code navigation shortcuts
- Git, terminal and UI shortcuts
- Surround editing with `mini.surround`
- Auto pairs handled by VSCode
- Works on Linux, macOS, WSL and Windows native

## Keybindings

The leader key is:

```txt
Space
```

So `Space s f` means: press `Space`, then `s`, then `f`.

### Search and navigation

| Shortcut | Action |
|---|---|
| `Space s f` | Find files |
| `Space s g` | Search in files |
| `Space s s` | Search symbols in current file |
| `Space s S` | Search symbols in workspace |
| `Space s p` | Show problems |
| `Space s r` | Open recent files |
| `Space e` | Open Explorer |

### Editor navigation

| Shortcut | Action |
|---|---|
| `Shift h` | Previous editor |
| `Shift l` | Next editor |
| `Space b d` | Close active editor |
| `Space b o` | Close other editors |
| `Space h` | Navigate back |
| `Space l` | Navigate forward |

### Code navigation

| Shortcut | Action |
|---|---|
| `g d` | Go to definition |
| `g r` | Go to references |
| `g i` | Go to implementation |
| `K` | Show hover documentation |
| `Space c a` | Code action |
| `Space r n` | Rename symbol |
| `] d` | Next problem |
| `[ d` | Previous problem |

### Terminal, Git and UI

| Shortcut | Action |
|---|---|
| `Space t t` | Toggle terminal |
| `Space g g` | Open source control |
| `Space z` | Toggle Zen Mode |
| `Space u` | Toggle sidebar |

### Editor splits

| Shortcut | Action |
|---|---|
| `Space w v` | Split editor right |
| `Space w s` | Split editor down |
| `Space w h` | Focus left editor group |
| `Space w l` | Focus right editor group |

## Surround usage

This config includes `mini.surround`.

### Add surround in visual mode

Select text with visual mode:

```vim
v
```

Then use:

| Command | Result |
|---|---|
| `sa}` | `{text}` |
| `sa{` | `{ text }` |
| `sa)` | `(text)` |
| `sa(` | `( text )` |
| `sa]` | `[text]` |
| `sa"` | `"text"` |
| `sa'` | `'text'` |

Example:

```txt
hello
```

Select `hello` and press:

```vim
sa}
```

Result:

```txt
{hello}
```

### Add surround around a word

Put the cursor on a word and run:

```vim
saiw}
```

Result:

```txt
{word}
```

With spaces:

```vim
saiw{
```

Result:

```txt
{ word }
```

### Delete surround

Inside or near surrounded text:

```vim
sd}
```

Example:

```txt
{word}
```

becomes:

```txt
word
```

### Replace surround

```vim
sr)}
```

This changes:

```txt
(word)
```

into:

```txt
{word}
```

## Requirements

You need:

- VSCode
- VSCode Neovim extension
- Neovim
- Git

Recommended VSCode settings:

```json
{
  "editor.autoClosingBrackets": "always",
  "editor.autoClosingQuotes": "always",
  "editor.autoSurround": "languageDefined"
}
```

## Installation

Clone the repository:

```bash
git clone https://github.com/utku-gaspak/vscode-neovim-productivity-kit.git
cd vscode-neovim-productivity-kit
```

### Linux, macOS and WSL

Run:

```bash
chmod +x install.sh
./install.sh
```

Then open Neovim:

```bash
nvim
```

Inside Neovim, run:

```vim
:Lazy sync
```

Restart VSCode after installation.

### Windows native

For native Windows, install manually.

Typical Neovim config location:

```txt
%LOCALAPPDATA%\nvim\init.lua
```

Create the folder if needed:

```powershell
mkdir $env:LOCALAPPDATA\nvim
```

Copy `init.lua` into:

```txt
%LOCALAPPDATA%\nvim\init.lua
```

Then open Neovim and run:

```vim
:Lazy sync
```

Restart VSCode after installation.

## Platform setup

### Linux

Check your Neovim path:

```bash
which nvim
```

Recommended VSCode setting:

```json
{
  "vscode-neovim.neovimExecutablePaths.linux": "/usr/bin/nvim"
}
```

### macOS

Install Neovim, for example with Homebrew:

```bash
brew install neovim
```

Check your Neovim path:

```bash
which nvim
```

Apple Silicon usually uses:

```json
{
  "vscode-neovim.neovimExecutablePaths.darwin": "/opt/homebrew/bin/nvim"
}
```

Intel Macs usually use:

```json
{
  "vscode-neovim.neovimExecutablePaths.darwin": "/usr/local/bin/nvim"
}
```

### Windows with WSL

Recommended for Windows users who develop inside WSL.

Install Neovim inside WSL:

```bash
sudo apt update
sudo apt install neovim
```

Recommended VSCode settings:

```json
{
  "vscode-neovim.useWSL": true,
  "vscode-neovim.neovimExecutablePaths.linux": "/usr/bin/nvim"
}
```

Check your WSL Neovim path:

```bash
which nvim
```

### Windows native

Check your Neovim path in PowerShell:

```powershell
where.exe nvim
```

Recommended VSCode setting:

```json
{
  "vscode-neovim.neovimExecutablePaths.win32": "C:\\Program Files\\Neovim\\bin\\nvim.exe"
}
```

Adjust the path if Neovim is installed somewhere else.

## Auto pairs

Auto pairs are handled by VSCode, not by a Neovim plugin.

Recommended VSCode settings:

```json
{
  "editor.autoClosingBrackets": "always",
  "editor.autoClosingQuotes": "always",
  "editor.autoSurround": "languageDefined"
}
```

This gives you:

| Input | Result |
|---|---|
| `{` | `{}` |
| `"` | `""` |
| Select text and type `{` | `{text}` |

## Why not use many Neovim plugins?

VSCode already provides strong support for:

- LSP
- formatting
- search
- Git
- terminal
- file explorer
- extensions
- debugging

This config avoids duplicating those features in Neovim.

The goal is:

```txt
Neovim = modal editing and text manipulation
VSCode = editor platform and project workflow
```

## Recommended VSCode extensions

Optional but useful:

- VSCode Neovim
- GitLens
- Error Lens
- Todo Tree
- StyLua

## Updating

If you cloned this repo directly into your Neovim config folder:

```bash
cd ~/.config/nvim
git pull
```

Then open Neovim and run:

```vim
:Lazy sync
```

Restart VSCode after updating.

## Uninstall

Linux, macOS or WSL:

```bash
rm -rf ~/.config/nvim
```

Windows native:

```powershell
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim
```

If the installer created a backup, restore it manually from:

```txt
~/.config/nvim_backup_YYYYMMDD_HHMMSS
```

## Troubleshooting

### VSCode Neovim does not work

Check if Neovim is installed:

```bash
nvim --version
```

Check the Neovim path:

```bash
which nvim
```

On Windows native:

```powershell
where.exe nvim
```

Then verify the matching VSCode setting for your platform.

### Surround does not work

Open Neovim and run:

```vim
:Lazy sync
```

Then restart VSCode.

Test with:

```vim
saiw}
```

### Auto pairs do not work

Auto pairs are controlled by VSCode settings.

Make sure this exists in your VSCode `settings.json`:

```json
{
  "editor.autoClosingBrackets": "always",
  "editor.autoClosingQuotes": "always",
  "editor.autoSurround": "languageDefined"
}
```

## License

MIT
