local M = {}

function M.get_python_path(workspace)
  -- Use activated virtualenv.
  local util = require("lspconfig/util")

  local path = util.path
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({ "*", ".*" }) do
    local match = vim.fn.glob(path.join(workspace or vim.fn.getcwd(), pattern, "pyvenv.cfg"))
    if match ~= "" then
      return path.join(path.dirname(match), "bin", "python")
    end
  end

  -- Fallback to system Python.
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end
local dap = require("dap")
local dapui = require("dapui")
dapui.setup({
	layouts = {
		{
			elements = {
				"scopes",
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 0.25,
			position = "left",
		},
		{
			elements = { "repl", "console" },
			size = 0.25,
			position = "bottom",
		},
	},
	floating = { max_width = 0.9, max_height = 0.5, border = vim.g.border_chars },
})

local mappings = {
	["<leader>dc"] = dap.continue,
	["<leader>do"] = dap.step_over,
	["<leader>di"] = dap.step_into,
	["<leader>dO"] = dap.step_out,
	["<leader>db"] = dap.toggle_breakpoint,
  ["<leader>dB"] = dap.step_back,
	["<M-t>"] = function()
		dapui.toggle({ reset = true })
	end,
	["<M-e>"] = dapui.eval,
	["<M-m>"] = dapui.float_element,
	["<M-v>"] = function()
		dapui.float_element("scopes")
	end,
	["<M-r>"] = function()
		dapui.float_element("repl")
	end,
	["<leader>dt"] = dap.terminate,
  ["<leader>dq"] = dap.clear_breakpoints,
}
for keys, mapping in pairs(mappings) do
	vim.api.nvim_set_keymap("n", keys, "", { callback = mapping, noremap = true })
end

vim.api.nvim_set_keymap("v", "<M-e>", "", { callback = dapui.eval })
vim.fn.sign_define("DapBreakpoint", { text = "→", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "→", texthl = "Success", linehl = "", numhl = "" })

dap.set_log_level("DEBUG")
local dap_python = require("dap-python")
local std_debugpy_python = vim.fn.environ()["CONDA_PYTHON_EXE"]

dap_python.setup(std_debugpy_python, { include_configs = false })
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		justMyCode = false,
		program = "${file}",
		console = "integratedTerminal",
		pythonPath = M.get_python_path(),
	},
	{
		type = "python",
		request = "attach",
		name = "Attach remote",
		justMyCode = false,
		pythonPath = M.get_python_path(),
		host = function()
			local value = vim.fn.input("Host [127.0.0.1]: ")
			if value ~= "" then
				return value
			end
			return "127.0.0.1"
		end,
		port = function()
			return tonumber(vim.fn.input("Port [5678]: ")) or 5678
		end,
	},
}

dap_python.test_runner = "pytest"

--
-- dap.configurations.cpp = {
--   {
--     name = "Launch",
--     type = "lldb",
--     request = "launch",
--     program = function()
--       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--     end,
--     cwd = "${workspaceFolder}",
--     stopOnEntry = false,
--     args = {},
--   },
-- }
