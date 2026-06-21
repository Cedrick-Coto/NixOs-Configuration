return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Configuración básica
      require("orgmode").setup({
        org_agenda_files = { "~/Documentos/Org-Notes/**/*" },
        org_default_notes_file = "~/Documentos/Org-Notes/inbox.org",
      })
    end,
  },
}
