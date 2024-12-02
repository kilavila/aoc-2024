local file = io.popen("cat ./puzzle_input.txt", "r")

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

---

local similarity_score = 0

for _, value in ipairs(list_1) do
	for _, item in ipairs(list_2) do
		if item == value then
			similarity_score = similarity_score + value
		end
	end
end

print(similarity_score) -- 25574739
