package.path = '../?.lua;' .. package.path
local strings = require "strings"
local inspect = require "inspect"
io.input("input.txt");
local input = strings.split(io.read("*all"));

local function bitMatcher (inTable, offset, flip)
  if #inTable < 3 then
    return inTable
  end
  local outTable = {}
  local count = 0
  for index, number in ipairs(inTable) do
    count = count + tonumber(number:sub(offset, offset))
  end
  
  if ( count > ( #inTable / 2 ) ) ~= flip then
    commonBit = 1
  elseif count == (#inTable / 2) then
    if flip then
      commonBit = 0
    else
      commonBit = 1
    end
  else
    commonBit = 0
  end

  for index, number in ipairs(inTable) do
    if ( tonumber(number:sub(offset, offset)) == commonBit ) then
      table.insert(outTable, number)
    end
  end
  return outTable
end

local function findMSBDiff (inTable, matchBit)
  for i=1, #inTable[1] do
    if not ( tonumber(inTable[1]:sub(i, i)) == tonumber(inTable[2]:sub(i, i)) ) then
      if tonumber(inTable[1]:sub(i, i)) == matchBit then
        return inTable[1]
      else
        return inTable[2]
      end
    end
  end
end

oxygen = input
co2 = input

for i=1,#input[1] do
  -- set flip to false for oxygen rating (most common value)
  -- true for CO2 scrubber rating (least common value)
  oxygen = bitMatcher(oxygen, i, false)
  co2 = bitMatcher(co2, i, true)
end
oxygenRating = tonumber(findMSBDiff(oxygen, 1), 2)
co2Rating = tonumber(findMSBDiff(co2, 0), 2)
print("oxygen:", oxygenRating, "\nco2:", co2Rating, "\nanswer:", oxygenRating*co2Rating)
