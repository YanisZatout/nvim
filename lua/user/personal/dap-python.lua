local M = {}

M.setup = function()
	require("dap-python").setup("home/zatout/.local/lib/python3.8/site-packages/debugpy/bin/python")
end

return M
