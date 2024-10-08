local M = {}

function M.build_conditional()
	local fileType = vim.bo.filetype
	if (fileType == 'c' or fileType == 'cpp') then
		vim.cmd("make build")
	end
end

function M.run_project()
	local fileType = vim.bo.filetype
	if (fileType == 'c' or fileType == 'cpp') then
		vim.cmd("make run")
	elseif fileType == 'lua' then
		--vim.cmd(":!lua ".."main.lua")
		vim.cmd(":!love .")
	end
end

function M.build_conditional_and_run()
	M.build_conditional()
	M.run_project()
end

function M.debug_this(opts)
	vim.cmd("Termdebug " .. opts.args)
end

return M
