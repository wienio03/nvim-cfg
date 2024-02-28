function Sys_type()
	if package.config:sub(1, 1) == "\\" then
		return "powershell"
	elseif package.config:sub(1, 1) == "/" then
		return "bash"
	end
end

local status = pcall(require, "toggleterm")

if not status then
	return
end

tt = require("toggleterm")


tt.setup({
	shell = Sys_type(),
})
