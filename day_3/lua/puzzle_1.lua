local file = io.popen("cat ../input.txt", "r")
local content = nil

if file then
	content = file:read("*a")
	file:close()
end

local result = 0

for match in string.gmatch(content, "(mul%([0-9]+,[0-9]+%))") do
	local prev_value = nil

	for value in string.gmatch(match, "([0-9]+)") do
		if prev_value == nil then
			prev_value = value
		else
			local new_value = value * prev_value
			result = result + new_value
			prev_value = nil
		end
	end
end

print("Result of multiplications: " .. result)
