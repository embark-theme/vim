<p align="center"><img src="Embark.svg" alt="Embark Logo"/></p>

<p align="center"><strong>An ambitious Vim theme.</strong></p>

<p align="center"><em>"Man cannot discover new oceans unless he has the courage to lose sight of the shore. - Andre Gide"</em></p>

![embark screenshot](./embark-screenshot.png)

## Getting Started

> At this time only terminals supporting truecolors will work. Make sure you have `set termguicolors` in your vimrc

First install using your plugin manager. Rename package to `embark` using your plugin manager's built in facilities to do so.

### lazy.nvim

```lua
{
  'embark-theme/vim',
  lazy = false,
  priority = 1000,
  name = 'embark'
}
```

### packer.nvim

```lua
use { 'embark-theme/vim', as = 'embark' }
```

### vim-plug

```vim
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
```

Then set embark as colorscheme.

Vimscript:

```vim
colorscheme embark
```

Lua (Neovim):

```lua
vim.cmd.colorscheme('embark')
```

For `packer.nvim` users the colorscheme can be placed in the `config` callback:

```lua
use {
  'embark-theme/vim',
  as = 'embark',
  config = function()
    vim.cmd.colorscheme('embark')
  end
}
```

For `lazy.nvim` users you can do a similar thing:

```lua
{
  'embark-theme/vim',
  lazy = false,
  priority = 1000,
  name = 'embark',
  config = function()
    vim.cmd.colorscheme('embark')
  end
}
```

### Lightline support

A lightline theme is also available. Just set your colorscheme to `'embark'`.

```vim
let g:lightline = {
      \ 'colorscheme': 'embark',
      \ }
```

### Airline support

Airline should just pick up on the theme automatically. If not you can set manually:

```vim
let g:airline_theme = 'embark'
```

### Lualine support

For Neovim users, Lualine should pick up the theme with the `auto` setting. If not you can set it manually:

```lua
require('lualine').setup {
  options = {
    theme = 'embark'
  }
}
```

## Configuration

Embark offers a few configuration values to control features. Setting values to `1` will turn the feature on.

Italics - Make sure your terminal is set up to handle them. See [this](https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be) for help getting italics and true color working in your terminal.

Vimscript:

```vim
let g:embark_terminal_italics = 1
```

Lua (for Neovim):

```lua
vim.g.embark_terminal_italics = 1
```

---

See other available ports at https://embark-theme.github.io/
