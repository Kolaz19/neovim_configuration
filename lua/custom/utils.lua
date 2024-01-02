local M = {}

function M.build_conditional()
local fileType = vim.bo.filetype
    if ( fileType == 'c' or fileType == 'cpp' ) then
	vim.cmd("make build")
    elseif fileType == 'lua' then
	--Get file name 
	local luaCommandWithFile = vim.fn.expand('%')
	vim.cmd(":!lua "..luaCommandWithFile)
    end
end

function M.run_project()
local fileType = vim.bo.filetype
    if ( fileType == 'c' or fileType == 'cpp' ) then
	vim.cmd("make run")
    elseif fileType == 'ps1' then
	--TODO
    end
end

function M.build_conditional_and_run()
    M.build_conditional()
    M.run_project()
end

return M
