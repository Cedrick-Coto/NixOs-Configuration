return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false, -- Esencial: evita la carga perezosa para que la lógica borre los fondos correctamente
    config = function()
      -- Aquí puedes agregar grupos de resaltado adicionales para hacerlos transparentes si lo deseas
      require("transparent").setup({
        extra_groups = {
          "NormalFloat",
          "NvimTree",
        },
      })
      require("transparent").clear()
    end,
  },
}
