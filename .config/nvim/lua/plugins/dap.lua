return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"jay-babu/mason-nvim-dap.nvim",
			opts = {
				ensure_installed = {
					"codelldb",
					"debugpy",
					"js-debug-adapter",
				},
				automatic_installation = true,
				handlers = {},
			},
		},
	},
	keys = {
		{
			"<F8>",
			function()
				require("dap").continue()
			end,
			desc = "Debug: Continue",
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step Over",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step Into",
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step Out",
		},
		{
			"<leader>bb",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Debug: Toggle Breakpoint",
		},
		{
			"<leader>bc",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Debug: Conditional Breakpoint",
		},
		{
			"<leader>bx",
			function()
				require("dap").clear_breakpoints()
			end,
			desc = "Debug: Clear Breakpoints",
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.toggle()
			end,
			desc = "Debug: REPL",
		},
		{
			"<leader>dt",
			function()
				require("dap").terminate()
			end,
			desc = "Debug: Terminate",
		},
	},
}
