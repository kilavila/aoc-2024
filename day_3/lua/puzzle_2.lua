local file = io.popen("cat ../test.txt", "r")
local content = nil

if file then
	content = file:read("*a")
	file:close()
end

local result = 0

local calc = function(str)
	for match in string.gmatch(str, "(mul%([0-9]+,[0-9]+%))") do
		local prev_value = nil

		for value in string.gmatch(match, "([0-9]+)") do
			if prev_value == nil then
				prev_value = value
			else
				local new_value = value * prev_value
				print()
				print(match)
				print(value .. " * " .. prev_value .. " = " .. new_value)
				result = result + new_value
				prev_value = nil
			end
		end
	end
end

content = string.gsub(content, "(don't%(%))", "\nSKIP")
content = string.gsub(content, "(do%(%))", "\n")

for match in string.gmatch(content, "[^\n]+") do
	local action = string.sub(match, 1, 4)

	if action ~= "SKIP" then
		calc(match)
	end
end

print()
print()
print("Result: " .. result)
