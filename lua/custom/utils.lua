local m = {}

function m.build_conditional()
	local fileType = vim.bo.filetype
	if (fileType == 'c' or fileType == 'cpp') then
		vim.cmd("make build")
	end
end

function m.run_project()
	local fileType = vim.bo.filetype
	if (fileType == 'c' or fileType == 'cpp') then
		vim.cmd("make run")
	elseif fileType == 'lua' then
		--vim.cmd(":!lua5.4 ".."main.lua")
		vim.cmd(":!love .")
		--vim.cmd(":!./lovr-x86_64.AppImage .")
	end
end

function m.build_conditional_and_run()
	m.build_conditional()
	m.run_project()
end

function m.debug_this(opts)
	vim.cmd("Termdebug " .. opts.args)
end



return m
