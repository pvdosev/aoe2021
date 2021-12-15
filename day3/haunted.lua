package.path = '../?.lua;' .. package.path
local strings = require "strings"
local inspect = require "inspect"
io.input("input.txt")
8 = strings.split(io.read("*all"))
numLength = #input[1]
finalCounts = {}

for i=1,numLength do
  if #input > 2 then
    count = 0
    for index, number in ipairs(input) do
      count = count + tonumber(number:sub(i, i))
    end
    if count > ( #input / 2 ) then
      count = 1
    else
      count = 0
    end
    for index, number in ipairs(input) do
      if tonumber(number:sub(i, i)) ~= count then
        table.remove(input, index)
      end
    end
  end
end

print(inspect(input))
