require("nvim-dap-virtual-text").setup()

require("mason-nvim-dap").setup({
    ensure_installed = {
        "codelldb",
        "debugpy",
        "delve",
        'shellcheck',
        'shfmt'
    }
})

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
        command = '/home/nic/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb',
        args = { "--port", "${port}" },
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

-- choose whether to use an executable or attach to a running process
dap.configurations.rust = {
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
    {
        name = "Attach to running process",
        type = "codelldb",
        request = "attach",
        pid = require("dap.utils").pick_process,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

require('dap-go').setup {
    delve = {
        -- the path to the executable dlv which will be used for debugging.
        -- by default, this is the "dlv" executable on your PATH.
        path = "/home/nic/.local/share/nvim/mason/packages/delve/dlv",
    },
}

require('dap-python').setup('/home/nic/.virtualenvs/debugpy/bin/python')
-- require('dap-python').setup('/home/nic/.local/share/nvim/mason/packages/debugpy/venv/bin/python')

-- configuring for debugging a fastapi app with uvicorn
dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "FastAPI",
        module = 'uvicorn',
        args = { 'main:app' },
        cwd = '${workspaceFolder}',
--        python = '/home/nic/.virtualenvs/debugpy/bin/python',
--        python = '/home/nic/.local/share/nvim/mason/packages/debugpy/venv/bin/python',
    },
}
