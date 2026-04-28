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

## Table of contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
  - [Linux, macOS and WSL](#linux-macos-and-wsl)
  - [Install on Windows native](#install-on-windows-native)
- [Keybindings](#keybindings)
  - [Search and navigation](#search-and-navigation)
  - [Editor navigation](#editor-navigation)
  - [Code navigation](#code-navigation)
  - [Terminal, Git and UI](#terminal-git-and-ui)
  - [Editor splits](#editor-splits)
- [Common Neovim motions](#common-neovim-motions)
  - [Basic movement](#basic-movement)
  - [Searching and jumping](#searching-and-jumping)
  - [Editing operators](#editing-operators)
  - [Common text objects](#common-text-objects)
  - [Copy, paste and undo](#copy-paste-and-undo)
  - [Visual mode](#visual-mode)
- [Surround usage](#surround-usage)
  - [Add surround in visual mode](#add-surround-in-visual-mode)
  - [Add surround around a word](#add-surround-around-a-word)
  - [Delete surround](#delete-surround)
  - [Replace surround](#replace-surround)
- [Platform setup](#platform-setup)
  - [Linux](#linux)
  - [macOS](#macos)
  - [Windows with WSL](#windows-with-wsl)
  - [Windows native settings](#windows-native-settings)
- [Auto pairs](#auto-pairs)
- [Why not use many Neovim plugins?](#why-not-use-many-neovim-plugins)
- [Recommended VSCode extensions](#recommended-vscode-extensions)
- [Updating](#updating)
- [Uninstall](#uninstall)
- [Troubleshooting](#troubleshooting)
  - [VSCode Neovim does not work](#vscode-neovim-does-not-work)
  - [Surround does not work](#surround-does-not-work)
  - [Auto pairs do not work](#auto-pairs-do-not-work)
- [License](#license)

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

### Install on Windows native

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

## Common Neovim motions

This section covers the most useful Vim and Neovim motions for daily coding.

### Basic movement

| Motion | Action |
|---|---|
| `h` | Move left |
| `j` | Move down |
| `k` | Move up |
| `l` | Move right |
| `w` | Move to next word |
| `b` | Move to previous word |
| `e` | Move to end of word |
| `ge` | Move to end of previous word |
| `0` | Move to beginning of line |
| `^` | Move to first non-blank character |
| `$` | Move to end of line |
| `gg` | Go to top of file |
| `G` | Go to bottom of file |
| `{number}G` | Go to line number |
| `Ctrl d` | Move half page down |
| `Ctrl u` | Move half page up |

Examples:

```vim
10G
```

Go to line 10.

```vim
Ctrl d
```

Scroll down half a page.

### Searching and jumping

| Motion | Action |
|---|---|
| `/text` | Search forward |
| `?text` | Search backward |
| `n` | Next search result |
| `N` | Previous search result |
| `*` | Search word under cursor forward |
| `#` | Search word under cursor backward |
| `f<char>` | Jump to next character on current line |
| `F<char>` | Jump to previous character on current line |
| `t<char>` | Jump before next character on current line |
| `T<char>` | Jump after previous character on current line |
| `;` | Repeat last `f`, `F`, `t` or `T` |
| `,` | Repeat last `f`, `F`, `t` or `T` in reverse |
| `%` | Jump between matching brackets |

Examples:

```vim
/foo
```

Search for `foo`.

```vim
f)
```

Jump to the next `)` on the current line.

```vim
%
```

Jump between matching `{}`, `()`, `[]`.

### Editing operators

Vim combines operators with motions.

| Operator | Action |
|---|---|
| `d` | Delete |
| `c` | Change |
| `y` | Yank / copy |
| `v` | Visual select |
| `>` | Indent right |
| `<` | Indent left |
| `=` | Auto-indent |

Examples:

```vim
dw
```

Delete next word.

```vim
ciw
```

Change inner word.

```vim
yiw
```

Copy inner word.

```vim
d$
```

Delete until end of line.

```vim
gg=G
```

Auto-indent the whole file.

### Common text objects

Text objects are very useful for editing code.

| Text object | Meaning |
|---|---|
| `iw` | Inner word |
| `aw` | Around word |
| `i"` | Inside double quotes |
| `a"` | Around double quotes |
| `i'` | Inside single quotes |
| `a'` | Around single quotes |
| `i)` | Inside parentheses |
| `a)` | Around parentheses |
| `i}` | Inside braces |
| `a}` | Around braces |
| `it` | Inside HTML/XML tag |
| `at` | Around HTML/XML tag |

Examples:

```vim
ci"
```

Change everything inside double quotes.

```vim
da)
```

Delete around parentheses.

```vim
vi}
```

Visually select inside braces.

### Copy, paste and undo

| Command | Action |
|---|---|
| `yy` | Copy current line |
| `dd` | Delete current line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `u` | Undo |
| `Ctrl r` | Redo |
| `x` | Delete character |
| `r<char>` | Replace one character |
| `.` | Repeat last change |

Examples:

```vim
dd
p
```

Move current line down.

```vim
ciwnewName
```

Change current word to `newName`.

```vim
.
```

Repeat the last edit.

### Visual mode

| Command | Action |
|---|---|
| `v` | Character visual mode |
| `V` | Line visual mode |
| `Ctrl v` | Block visual mode |
| `o` | Move to other end of selection |
| `y` | Copy selection |
| `d` | Delete selection |
| `>` | Indent selection right |
| `<` | Indent selection left |

Examples:

```vim
V
j
>
```

Select two lines and indent them.

```vim
Ctrl v
j
j
I//
Esc
```

Add `//` to the beginning of multiple selected lines.

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

### Windows native settings

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

If you installed by copying `init.lua`, pull the repository and copy the updated `init.lua` again.

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
