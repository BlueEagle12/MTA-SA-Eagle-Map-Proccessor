function outputDebugInternal (key)
	table.insert(sDebug,key)
	outputDebugString(key)
	print(key)
end

function removeSpaces(str)
	local str = str or ""
    return str:gsub("%s", "")
end

function remove_spaces(str)
    -- Remove leading and trailing spaces from the string
    return str:match("^%s*(.-)%s*$")
end


function modifiedSplit(input)
	local sTable = split(input,',')
	local sTableNew = {}
	for i,v in pairs(sTable) do
		sTableNew[i] = remove_spaces(v)
	end
	return sTableNew
end


function removeCommaAtEnd(str)
	if string.sub(str, -1) == "," then
		str = string.sub(str, 1, -2)
	end
	return str
end


function removeCommasAtEndTable(tableOfStrings)
	local newTable = {}
	for i, str in pairs(tableOfStrings) do
		newTable[i] = string.gsub(str, ",%s*$", "")
	end
	print(newTable[1])
	return newTable
end