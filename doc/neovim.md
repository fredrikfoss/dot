# Neovim

## Dependencies

```sh
sudo dnf install -y fswatch # file watcher
sudo dnf install -y ripgrep # grep alternative
sudo dnf install -y fd-find # find alternative
```

## Install

```sh
dnf copr enable agriffis/neovim-nightly
dnf install -y neovim python3-neovim
```

## Keymaps

Diagnostics:

* `[d` in Normal mode maps to `vim.diagnostic.goto_prev()`
* `]d` in Normal mode maps to `vim.diagnostic.goto_next()`
* `CTRL-W-D` in Normal mode maps to `vim.diagnostic.open_float()`

LSP:

* `grn` in Normal mode maps to `vim.lsp.buf.rename()`
* `grr` in Normal mode maps to `vim.lsp.buf.references()`
* `gra` in Normal and Visual mode maps to `vim.lsp.buf.code_action()`
* `CTRL-S` in Insert mode maps to `vim.lsp.buf.signature_help()`
* `K` in Normal mode maps to `vim.lsp.buf.hover()`

Misc:

* `omnifunc` is set to `vim.lsp.omnifunc()`, use `i_CTRL-X_CTRL-O` to trigger completion.
* `tagfunc` is set to `vim.lsp.tagfunc()`. This enables features like go-to-definition, `:tjump`, and keymaps like `CTRL-]`, `CTRL-W_]`, `CTRL-W_}` to utilize the language server.
* `formatexpr` is set to `vim.lsp.formatexpr()`, so you can format lines via `gq` if the language server supports it.
