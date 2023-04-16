local levelStrings = {
	"[%s] ",
	"[%s] [Error!] ",
	"[%s] [Core] ",
	"[%s] [Server] ",
}

local logLib = {}

local function getTime()
	local dateTime = DateTime.now()
	
	-- //TODO: Get locale of user and be gucci
	return dateTime:FormatLocalTime("LTS", "en-us")
end

local function parseLogArgs(tabl)
	for index, prop in tabl do
		if typeof(prop) ~= "string" then
			table.remove(tabl, index)
		end
	end

	return table.concat(tabl, " ")
end

function logLib:Log(...)
	local args = {...}

	local level = 1 do	
		-- //TODO: Other way to check for levels, because number might be submitted on the end
		if typeof(args[#args]) == "number" then
			level = args[#args]
		end
	end

	local messagePrefix = string.format(
		levelStrings[level],
		getTime()
	)

	local parsedArgs = parseLogArgs(args)
	
	-- //TODO: possibly different, or custom way to output.
	print(messagePrefix .. parsedArgs)
end
	
return logLib
