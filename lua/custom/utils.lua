local m = {}

function m.build_project()
	vim.cmd("make build")
end

function m.run_project()
	vim.cmd("make run")
end

function m.build_and_run()
	m.build_project()
	m.run_project()
end

function m.debug_this(opts)
	vim.cmd("Termdebug " .. opts.args)
end

return m
