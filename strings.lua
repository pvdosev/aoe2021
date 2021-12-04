local strings = {}

function strings.split (inputString, separator)
        if separator == nil then
                separator = "%s" -- newline matcher
        end
        local returnTable={}
        for str in string.gmatch(inputString, "([^"..separator.."]+)") do
                table.insert(returnTable, str)
        end
        return returnTable
end

return strings
