-- luacheck: ignore vim
return {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mxsdev/nvim-dap-vscode-js",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
  
      for _, language in pairs({ 'typescript', 'javascript' }) do
        dap.configurations[language] = {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
          },
        }
      end
  
      require("dapui").setup()
      require("dap-vscode-js").setup({
        debugger_path="/home/admin/vscode-js-debug/",
        adapters={
          'pwa-node'
        }
      })
  
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
         dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
  
      vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {})
      vim.keymap.set('n', '<Leader>dc', dap.continue, {})
      vim.keymap.set("n", "<leader>db", dapui.toggle, opts)
      vim.keymap.set("n", "<leader>dl", dap.step_over, opts)
      vim.keymap.set("n", "<leader>dj", dap.step_into, opts)
      vim.keymap.set("n", "<leader>dk", dap.step_out, opts)
      vim.keymap.set("n", "<leader>dh", dap.step_back, opts)
      vim.keymap.set("n", "<leader>b.", dap.run_last, opts)
    end
  }
