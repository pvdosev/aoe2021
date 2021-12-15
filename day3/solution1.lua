package.path = '../?.lua;' .. package.path
local strings = require "strings"
local inspect = require "inspect"
io.input("input.txt")
input = strings.split(io.read("*all"))
numLength = #input[1]
finalCounts = {}
for i=1,numLength do
  finalCounts[i] = 0
end
for index, number in ipairs(input) do
   for i=1,numLength do
    finalCounts[i] = finalCounts[i] + tonumber(number:sub(i, i))
  end
end

for index, number in ipairs(finalCounts) do
  if finalCounts[index] > ( #input / 2 ) then
    finalCounts[index] = 1
  else
    finalCounts[index] = 0
  end
end



print(inspect(finalCounts))
