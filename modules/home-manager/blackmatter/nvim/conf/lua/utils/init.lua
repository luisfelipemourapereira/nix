local M = {}

function M.list_directories(path)
	local cmd = string.format("ls -d %s/*/ 2>/dev/null", path)
	local handle = io.popen(cmd)
	local result = nil
	if handle then
		result = handle:read("*a")
		handle:close()
	end
	local directories = {}
	for dir in result:gmatch("(.-)\n") do
		table.insert(directories, dir)
	end
	return directories
end

function M.list_files(path)
	local files = {}
	for file in io.popen("ls " .. path .. " 2>/dev/null"):lines() do
		if not file:match("/$") then
			table.insert(files, file)
		end
	end
	return files
end

function M.split(str, sep)
	sep = sep or "%s"
	local parts = {}
	for match in string.gmatch(str, "([^" .. sep .. "]+)") do
		table.insert(parts, match)
	end
	return parts
end

function M.load_files(dir)
	local directories = M.list_directories(dir)

	for _, directory in ipairs(directories) do
		local substrings = M.split(directory, '/')

		for _, file in ipairs(M.list_files(directory)) do
			local thisfile = string.gsub(file, "%.lua$", "")
			local path = string.format("plugins.config.%s.%s", substrings[#substrings], thisfile)
			require(path).setup()
		end
	end
end

function M.remove_file_extension(filename)
	local basename = filename:match("(.+)%.[^.]*$")
	return basename or filename
end

function M.get_subdirectories(directory)
	local subdirectories = {}
	local handle = io.popen(
		"find " .. directory .. " -maxdepth 1 -type d -not -name '.' 2>/dev/null"
	)
	if handle then
		for entry in handle:lines() do
			table.insert(subdirectories, entry)
		end
		handle:close()
	end
	return subdirectories
end

function M.get_files(module_name)
	local path = package.searchpath(module_name, package.path)
	local files = {}
	if path then
		local handle = io.popen("find " .. path:match("(.*/)") .. " -type f 2>/dev/null")
		if handle then
			for entry in handle:lines() do
				table.insert(files, entry)
			end
			handle:close()
		end
	end
	return files
end

return M
