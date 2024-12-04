local file = io.popen("cat ../test.txt", "r")
local content = nil

if file then
	content = file:read("*a")
	file:close()
end

local total_xmas_count = 0
local line_table = {}

local find_matches = function(line)
	for _ in string.gmatch(line, "XMAS") do
		total_xmas_count = total_xmas_count + 1
	end
end

-- INFO: horizontal
for line in string.gmatch(content, "[^\n]+") do
	-- forwards
	find_matches(line)

	-- backwards
	local bw_line = string.reverse(line)
	find_matches(bw_line)

	local char_table = {}

	for char in string.gmatch(line, "%a") do
		table.insert(char_table, char)
	end

	table.insert(line_table, char_table)
end

-- print(table.unpack(line_table[1]))

-- TODO: vertical

-- TODO: diagonal

print()
print("Total XMAS count: " .. total_xmas_count)
