ADT.lua
===

Algebraic Data Types for Lua

```lua
local adt = require('adt')

local optional = new('Some', 'None')
local Some, None = optional.Some, optional.Some
--[[ or you can write:
local Some = new()
local None = new()
--]]

local r = Some(3)
local v = match(r, {
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
