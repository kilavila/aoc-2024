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

local check_report = function(report)
	local safe_report = true
	local increasing_levels = nil

	local prev_level = nil

	for _, level in ipairs(report) do
		if prev_level == nil then
			prev_level = level
		else
			if increasing_levels == nil then
				if prev_level - level > 0 then
					increasing_levels = false
				else
					increasing_levels = true
				end
			end

			if increasing_levels then
				local diff = level - prev_level

				if diff <= 0 or diff > 3 then
					safe_report = false
					print(level .. " - " .. prev_level .. " = " .. diff .. " (unsafe)")
				else
					print(level .. " - " .. prev_level .. " = " .. diff .. " (safe)")
				end
			else
				local diff = prev_level - level

				if diff <= 0 or diff > 3 then
					safe_report = false
					print(level .. " - " .. prev_level .. " = " .. diff .. " (unsafe)")
				else
					print(level .. " - " .. prev_level .. " = " .. diff .. " (safe)")
				end
			end -- if increasing_levels
		end -- if prev_level nil

		prev_level = level
	end -- for level

	return safe_report
end

local number_of_safe_reports = 0

for index, report in ipairs(reports_table) do
	print("")
	print("---")
	print("Checking report: " .. index)
	local report_status = check_report(report)

	local number_of_safe_rechecks = 0
	if report_status == false then
		print("Re-checking report: " .. index)

		for idx, level in ipairs(report) do
			print("Removing level: " .. level .. " with index: " .. idx)
			local report_copy = {}

			for _, num in ipairs(report) do
				table.insert(report_copy, num)
			end

			table.remove(report_copy, idx)
			local report_recheck_status = check_report(report_copy)

			if report_recheck_status == true then
				number_of_safe_rechecks = number_of_safe_rechecks + 1
				print("Re-check: SUCCESS!")
			end
		end

		if number_of_safe_rechecks >= 1 then
			number_of_safe_reports = number_of_safe_reports + 1
		end
	else
		number_of_safe_reports = number_of_safe_reports + 1
		print("Initial check: SUCCESS!")
	end
end

print("")
print("---")
print("")
print("Number of safe reports: " .. number_of_safe_reports)
