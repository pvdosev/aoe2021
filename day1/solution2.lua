package.path = '../?.lua;' .. package.path
local strings = require "strings"
io.input("input.txt")
input = strings.split(io.read("*all"), "\n")

print(output)
