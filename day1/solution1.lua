package.path = '../?.lua;' .. package.path
local strings = require "strings"
io.input("input.txt")
input = strings.split(io.read("*all"))
output = 0
input[0] = 999999999
for index, number in ipairs(input) do
  if tonumber(number) > tonumber(input[index - 1]) then
    output = output + 1
  end
end
print(output)
