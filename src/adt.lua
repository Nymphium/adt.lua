local function new(name, ...)
  -- @example
  --   local A = new(a)
  --   local B = new(b)
  --   local C = new(c)
  --   local t = { a = A, b = B, c = C }
  -- ===
  -- @example
  --   local t = new(a, b, c)

  -- multiple constructor definition {{{
  local args = {...}

  if #args > 0 then
    local ret = {}

    ret[name] = new(name)

    for _, name_ in ipairs(args) do
      ret[name_] = new(name_)
    end

    return ret
  end
  --- }}}

  name = name or '(annon)'
  name = name .. ":" .. tostring({}):match("0x[0-f]+")

  return setmetatable({name = name}, {
    __call = function(_, ...)
      local content = {...}

      -- salting
      content.name = name

      return setmetatable(content, {
        __pow = function(l, r)
          return l.name == r.name
        end
      })
    end
  })
end

local match = function(e, ...)
  -- e = adt
  -- ... = {adt, fun}, ...
  for _, tup in ipairs{...} do
    if tup[1] ^ e then
      return tup[2](table.unpack(e))
    end
  end

  return error('pattern matching failed')
end

return {
  new = new,
  match = match
}
