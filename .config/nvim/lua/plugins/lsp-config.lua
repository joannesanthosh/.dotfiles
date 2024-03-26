-- you will have to ensure npm and typescript are installed globally
--
-- sudo apt install nodejs
-- sudo apt install npm
-- sudo npm i -g typescript-language-server; sudo npm i -g typescript

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls", "tsserver", "jdtls"},
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.jdtls.setup({})
    end
  }
}

