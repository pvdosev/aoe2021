package.path = '../?.lua;' .. package.path
local strings = require "strings"
local inspect = require "inspect"
io.input("input.txt");
input = strings.split(io.read("*all"));
numLength = #input[1];
finalCounts = {};

for iter=1,numLength do
  if #input > 2 then
    count = 0;
    for index, number in ipairs(input) do
      count = count + tonumber(number:sub(iter, iter));
    end
    if count > ( #input / 2 ) then
      count = 1;
    else
      count = 0;
    end
    print(count)
    local j, n = 1, #input;

    for i=1,n do
      if (tonumber(input[i]:sub(iter, iter)) == count) then
        -- Move i's kept value to j's position, if it's not already there.
        if (i ~= j) then
          input[j] = input[i];
          input[i] = nil;
        end
        j = j + 1; -- Increment position of where we'll place the next kept value.
      else
        input[i] = nil;
      end
    end
  end
end

print(inspect(input));
