require("nvim-dap-virtual-text").setup()

local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = 'home/nic/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.c = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    -- the path to the executable dlv which will be used for debugging.
    -- by default, this is the "dlv" executable on your PATH.
    path = "home/nic/.local/share/nvim/mason/packages/delve/dlv",
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "${port}",
    -- additional args to pass to dlv
    args = {}
  },
}

require('dap-python').setup('/usr/bin/python')
--table.insert(require('dap').configurations.python, {
--  type = 'python',
--  request = 'launch',
--  name = 'My custom launch configuration',
--  program = '${file}',
--  -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
--})


table.insert(require("dap").configurations.python, {
    type = "python",
    request = "attach",
    connect = {
        port = 5678,
        host = "127.0.0.1",
    },
    name = 'My custom launch configuration',
    cwd = vim.fn.getcwd(),
    pathmappings = {
        {
            localroot = function()
                return vim.fn.input("local code folder > ", vim.fn.getcwd(), "file")
            end,
        },
    },
})
