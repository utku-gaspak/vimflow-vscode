# VSCode Neovim Productivity Kit

A minimal Neovim configuration for developers who use the **VSCode Neovim** extension and want a smoother Vim-style workflow inside VSCode.

This setup keeps the workflow simple:

- VSCode handles UI, search, Git, terminal, LSP and formatting.
- Neovim handles modal editing, Vim motions and surround actions.
- Plugin count stays intentionally low to avoid conflicts and slowdowns.

## Who is this for?

This config is for developers who:

- use VSCode as their main editor,
- want Vim motions inside VSCode,
- want practical leader key shortcuts,
- want surround support like wrapping text with `{}`, `()`, `""`, etc.,
- do not want a complex Neovim distribution.

## Requirements

You need:

- Neovim
- VSCode
- VSCode Neovim extension
- Git

Recommended VSCode settings:

```json
{
  "editor.autoClosingBrackets": "always",
  "editor.autoClosingQuotes": "always",
  "editor.autoSurround": "languageDefined"
}
```

If you use WSL, you may also need:

```json
{
  "vscode-neovim.useWSL": true,
  "vscode-neovim.neovimExecutablePaths.linux": "/usr/bin/nvim"
}
```

Check your Neovim path with:

```bash
which nvim
```

## Installation

Clone the repository:

```bash
git clone https://github.com/utku-gaspak/vscode-neovim-productivity-kit.git
cd vscode-neovim-productivity-kit
```

Run the installer:

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

Finally, restart VSCode.

## Manual installation

If you do not want to use the installer, copy `init.lua` manually:

```bash
mkdir -p ~/.config/nvim
cp init.lua ~/.config/nvim/init.lua
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

## Philosophy

This is not a full Neovim distribution.

It is a lightweight VSCode Neovim starter focused on:

- fast file navigation,
- practical code navigation,
- surround editing,
- low plugin count,
- fewer conflicts,
- better productivity inside VSCode.

## Leader key

The leader key is:

```txt
Space
```

So when you see:

```txt
Space s f
```

it means:

```txt
Press Space, then s, then f
```

## Keybindings

### File and project navigation

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

### Code actions

| Shortcut | Action |
|---|---|
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

It allows you to add, delete and replace surrounding characters such as:

```txt
{}
()
[]
""
''
```

### Add surround in visual mode

Select text with visual mode:

```vim
v
```

Then use one of these commands:

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

Select `hello` with visual mode and press:

```vim
sa}
```

Result:

```txt
{hello}
```

With spaces:

```vim
sa{
```

Result:

```txt
{ hello }
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

Example:

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

This means:

| Input | Result |
|---|---|
| `{` | `{}` |
| `"` | `""` |
| Select text and type `{` | `{text}` |

## Recommended VSCode extensions

Optional but useful:

- VSCode Neovim
- GitLens
- Error Lens
- Todo Tree
- StyLua

## Why not use many Neovim plugins?

VSCode already provides excellent support for:

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
VSCode = editor platform, UI, language tools and project workflow
```

## Updating

If you installed the config through Git:

```bash
cd ~/.config/nvim
git pull
```

Then open Neovim:

```bash
nvim
```

Inside Neovim:

```vim
:Lazy sync
```

Restart VSCode after updating.

## Uninstall

Remove the config:

```bash
rm -rf ~/.config/nvim
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

Then verify your VSCode settings.

For WSL users, this is often needed:

```json
{
  "vscode-neovim.useWSL": true,
  "vscode-neovim.neovimExecutablePaths.linux": "/usr/bin/nvim"
}
```

### Surround does not work

Open Neovim and run:

```vim
:Lazy sync
```

Then restart VSCode.

Try again with:

```vim
saiw}
```

### Auto pairs do not work

Auto pairs are controlled by VSCode settings, not by Neovim.

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
