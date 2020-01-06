ADT.lua
===

Algebraic Data Types for Lua

```lua
local adt = require('adt')

local optional = adt.new('Some', 'None')
local Some, None = optional.Some, optional.Some
--[[ or you can write:
local Some = adt.new()
local None = adt.new()
--]]

local r = Some(3)
local v = adt.match(r, {
  { Some, function(v)
    return v + 10
  end },
  { None, function()
    return 0
  end }
})

print(v) --> 13
```

# LICENSE
MIT
