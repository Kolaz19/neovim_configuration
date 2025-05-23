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

local function reverseMarklist(tab)
	local newTab = {}
	for i = 1, #tab do
		table.insert(newTab, tab[#tab + 1 - i])
	end
	return newTab
end

function M.nextMark(lowercase, reverse)
	local asciiStart = 64
	if lowercase then asciiStart = 96 end
	local curLine = vim.api.nvim_win_get_cursor(0)
	local curBuffer = vim.api.nvim_get_current_buf()
	local availableMarks = {}
	local curPosMark = { markName = nil, internalNumber = nil }
	--Loop through all letters
	for i = 1, 26 do
		local markChar = nil
		local markPos = {}
		if (lowercase) then
			markChar = string.char(asciiStart + i)
			markPos = vim.api.nvim_buf_get_mark(0, markChar)
			markPos[3] = curBuffer
		else
			markChar = string.char(asciiStart + i)
			markPos = vim.api.nvim_get_mark(markChar, {})
		end

		--Does mark exist?
		if markPos[1] ~= 0 then
			--Mark on same line as cursor?
			if (markPos[1] == curLine[1] and markPos[3] == curBuffer) then
				curPosMark.markName = markChar
				curPosMark.internalNumber = asciiStart + i
			else
				table.insert(availableMarks, {
					markName = markChar,
					pos = markPos[1],
					buf = markPos[3],
					internalNumber = (asciiStart + i)
				})
			end
		end
	end

	if reverse then
		availableMarks = reverseMarklist(availableMarks)
	end

	--Case 1: cursor not on mark
	if curPosMark.markName == nil then
		local nearestMarkSameBuffer = { internalNumber = nil, diff = 0 }
		--Get nearest mark in buffer in relation to current line
		for _, val in ipairs(availableMarks) do
			if val.buf == curBuffer then
				local diffLines = 0
				if curLine[1] > val.pos then
					diffLines = curLine[1] - val.pos
				else
					diffLines = val.pos - curLine[1]
				end
				if nearestMarkSameBuffer.diff == 0 or diffLines < nearestMarkSameBuffer.diff then
					nearestMarkSameBuffer.internalNumber = val.internalNumber
					nearestMarkSameBuffer.diff = diffLines
				end
			end
		end

		if nearestMarkSameBuffer.internalNumber ~= nil then
			--Move to next letter based on nearest mark
			for _, val in ipairs(availableMarks) do
				if (not reverse and val.internalNumber > nearestMarkSameBuffer.internalNumber) or
					(reverse and val.internalNumber < nearestMarkSameBuffer.internalNumber) then
					vim.cmd("'" .. val.markName)
					return
				end
			end
			--No mark bigger -> Just move to different mark
			for _, val in ipairs(availableMarks) do
				if val.internalNumber ~= nearestMarkSameBuffer.internalNumber then
					vim.cmd("'" .. val.markName)
					return
				end
			end
		end
		--Otherwise just move to first letter found
		for _, val in ipairs(availableMarks) do
			vim.cmd("'" .. val.markName)
			return
		end
	else
		--Case 2: Cursor on mark
		--Move to next letter based on mark on current line
		for _, val in ipairs(availableMarks) do
			if (not reverse and val.internalNumber > curPosMark.internalNumber) or
				(reverse and val.internalNumber < curPosMark.internalNumber) then
				vim.cmd("'" .. val.markName)
				return
			end
		end
		--No mark bigger -> Just move to different mark
		for _, val in ipairs(availableMarks) do
			if val.internalNumber ~= curPosMark.internalNumber then
				vim.cmd("'" .. val.markName)
				return
			end
		end
	end
end

return M
