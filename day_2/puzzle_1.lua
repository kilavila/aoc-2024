local file = io.popen("cat ./puzzle_input.txt", "r")
local reports_table = {}

if file then
	local content = file:read("*a")
	file:close()

	for report in string.gmatch(content, "[^\r\n]+") do
		local report_table = {}

		for level in string.gmatch(report, "[0-9]+") do
			table.insert(report_table, level)
		end -- for level in report

		table.insert(reports_table, report_table)
	end -- for report in content
end -- if file

---

local check_report = function(report, increasing_levels)
	local test_is_safe = true
	local prev_level = nil

	for _, level in ipairs(report) do
		if prev_level == nil then
			prev_level = level
		else
			if increasing_levels then
				local diff = level - prev_level

				if diff <= 0 or diff > 3 then
					test_is_safe = false
					print(level .. " - " .. prev_level .. " = " .. diff .. " (unsafe)")
				else
					print(level .. " - " .. prev_level .. " = " .. diff .. " (safe)")
				end
			else
				local diff = prev_level - level

				if diff <= 0 or diff > 3 then
					test_is_safe = false
					print(prev_level .. " - " .. level .. " = " .. diff .. " (unsafe)")
				else
					print(prev_level .. " - " .. level .. " = " .. diff .. " (safe)")
				end
			end -- if increasing_levels
		end -- if prev_level nil

		prev_level = level
	end -- for level

	print("Report safety test: ", test_is_safe)
	print("-----------------------------")
	return test_is_safe
end

local number_of_safe_reports = 0

for _, report in ipairs(reports_table) do
	local increasing_levels = true
	if report[1] - report[2] > 0 then
		increasing_levels = false
	end

	local safe_test = check_report(report, increasing_levels)
	if safe_test == true then
		number_of_safe_reports = number_of_safe_reports + 1
	end
end

print(number_of_safe_reports)
