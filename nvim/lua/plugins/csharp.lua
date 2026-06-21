return {
  -- Treesitter para C#
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "c_sharp" })
    end,
  },

  -- LSP: OmniSharp-roslyn (se instala via Mason)
  -- Keymaps se configuran via LazyVim LSP on_attach (no necesitan buffer explicito)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {
          enable_editorconfig_support = true,
          enable_roslyn_analyzers = true,
          enable_import_completion = true,
          organize_imports_on_format = true,
          enable_decompilation_support = true,
          analyze_open_documents_only = false,
          disable_caching = false,
          sdk_include_prereleases = true,
          use_microsoft_bcl = false,
          use_roslyn_analyzers_from_project = true,
        },
      },
      setup = {
        omnisharp = function(_, opts)
          local pid = vim.fn.getpid()
          opts.cmd = {
            "omnisharp",
            "--languageserver",
            "--hostPID",
            tostring(pid),
            "--stdio",
          }
          return false
        end,
      },
    },
  },

  -- Extensión mejorada para OmniSharp con navegación de tipos + keymaps C#
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {},
    config = function()
      local group = vim.api.nvim_create_augroup("CSharpKeymaps", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = { "cs", "cshtml", "razor" },
        callback = function(ev)
          local bufopts = { buffer = ev.buf, noremap = true, silent = true }
          vim.keymap.set("n", "<leader>cf", function()
            vim.lsp.buf.format({ async = true })
          end, vim.tbl_extend("force", bufopts, { desc = "Format C#" }))
          vim.keymap.set("n", "<leader>cr", function()
            require("omnisharp_extended").restart_omnisharp()
          end, vim.tbl_extend("force", bufopts, { desc = "Restart OmniSharp" }))
          vim.keymap.set("n", "<leader>cR", function()
            require("omnisharp_extended").rename()
          end, vim.tbl_extend("force", bufopts, { desc = "Rename (OmniSharp)" }))
          vim.keymap.set("n", "<leader>cF", function()
            require("omnisharp_extended").find_implementations()
          end, vim.tbl_extend("force", bufopts, { desc = "Find Impl" }))
          vim.keymap.set("n", "<leader>cS", function()
            require("omnisharp_extended").find_symbols()
          end, vim.tbl_extend("force", bufopts, { desc = "Find Symbols" }))
        end,
      })
    end,
  },

  -- Debugger: netcoredbg (instalado via Mason abajo)
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      dap.adapters.coreclr = {
        type = "executable",
        command = vim.fn.stdpath("data")
          .. "/mason/bin/netcoredbg",
        args = { "--interpreter=vscode" },
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch .NET (Launch)",
          request = "launch",
          preLaunchTask = "build",
          program = function()
            return vim.fn.input(
              "Path to dll: ",
              vim.fn.getcwd() .. "/bin/Debug/",
              "file"
            )
          end,
          cwd = "${workspaceFolder}",
        },
      }
      dap.configurations.fsharp = dap.configurations.cs
      dap.configurations["vb"] = dap.configurations.cs
    end,
  },

  -- DAP UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
      -- Abrir/cerrar DAP UI automáticamente
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui = dapui.open
      dap.listeners.before.launch.dapui = dapui.open
      dap.listeners.before.event_terminated.dapui = dapui.close
      dap.listeners.before.event_exited.dapui = dapui.close
    end,
  },

  -- Testing con .NET
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "Issafalcon/neotest-dotnet",
        dependencies = { "nvim-neotest/neotest" },
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-dotnet"),
        },
      })
    end,
  },

  -- Snippets especificos para C#/ASP.NET
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },

  -- Navegación entre archivos .cs, .razor, .csproj
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fc",
        function()
          require("telescope.builtin").find_files({
            prompt_title = "C# Files",
            filter = { file_pattern = { "*.cs", "*.razor", "*.csproj", "*.sln" } },
          })
        end,
        desc = "Find C# File",
      },
    },
  },

  -- Instalar herramientas via Mason (reemplazando williamboman/mason.nvim por mason-org/mason.nvim)
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "omnisharp",
        "netcoredbg",
      })
    end,
  },

  -- Resaltado de sintaxis para .sln, .csproj, .props
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "xml", -- para .csproj/.props
        "json", -- para launchSettings.json
      })
    end,
  },
}
