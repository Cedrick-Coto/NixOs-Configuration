-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Compatibilidad multiplataforma con Visual Studio (Windows/Linux/Mac)
vim.g.mapleader = " "

-- Forzar LF en archivos nuevos (VS maneja CRLF en Windows, LF en Linux)
vim.o.fileformat = "unix"
vim.o.fileformats = "unix,dos"

-- Usar utf-8 siempre (compatible con VS)
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

-- Tab vs Spaces: 4 espacios para C# (estandar .NET)
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- No dejar trailing whitespace (VS lo hace automatico en .editorconfig)
vim.o.list = true
vim.o.listchars = "trail:·,tab:» "

-- Final de linea visible (ayuda a debuggear diferencias CRLF/LF)
vim.opt.fillchars:append("eob: ")
