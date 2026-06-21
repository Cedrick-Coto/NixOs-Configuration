return {
  -- Instalar adwaita.nvim
  {
    "Mofiqul/adwaita.nvim",
    lazy = false, -- Cargar al inicio
    priority = 1000, -- Cargar antes que otros plugins
    config = function()
      -- Opcional: configurar adwaita si es necesario
    end,
  },

  -- Configurar LazyVim para usar adwaita
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "adwaita",
    },
  },
}
