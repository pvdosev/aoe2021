package.path = '../?.lua;' .. package.path
local strings = require "strings"
local inspect = require "inspect"
io.input("input.txt")
input = strings.split(io.read("*all"), "\r\n")
x = 0
y = 0
for index, command in ipairs(input) do
  instruction = strings.split(command)
  if instruction[1] == "up" then
    y = y - instruction[2]
  elseif instruction[1] == "down" then
    y = y + instruction[2]
  elseif instruction[1] == "forward" then
    x = x + instruction[2]
  end
end
print(x * y)
