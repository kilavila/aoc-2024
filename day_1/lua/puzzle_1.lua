local file = io.popen("cat ../input.txt", "r")

local list_1 = {}
local list_2 = {}

if file then
	local content = file:read("*a")
	file:close()

	for line in string.gmatch(content, "[0-9]+%s+[0-9]+") do
		local num_1 = string.sub(line, 1, 5)
		local num_2 = string.sub(line, 9, 13)

		table.insert(list_1, num_1)
		table.insert(list_2, num_2)
	end
end

table.sort(list_1)
table.sort(list_2)

---

local total_diff = 0

for key, value in ipairs(list_1) do
	local diff = 0

	if value > list_2[key] then
		diff = value - list_2[key]
	else
		diff = list_2[key] - value
	end

	total_diff = total_diff + diff
end

print(total_diff) -- 1603498
