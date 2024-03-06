--- Expose tables and functions relating to the extension of core neovim
--- functionality
--- @class Modules
local Modules = {}

--- An extension of the functionality provided by neovim core.
--- Typically these end up being external plugins
--- @class Module
local Module = {
  --- The folder name of the module in /nvim/lua/data/modules/
  name = "",
  --- Whether or not the module will be loaded on startup
  disabled = false
}

function Module:new(obj)
  self.__index = self
  return setmetatable(obj, self)
end

--- A table containing all modules. This should map 1:1 with the folders of
--- `/nvim/lua/modules/`.
--- @type Module[]
local modules = {
  Module:new{name = "fuzzy-search"},
  Module:new{name = "icons"},
  Module:new{name = "start-screen"},
  Module:new{name = "language-server-protocol"},
  Module:new{name = "syntax-highlighting"},
  Module:new{name = "quick-comments"},
  Module:new{name = "virtual-column", disabled = true},
  Module:new{name = "focus-mode", disabled = false},
  Module:new{name = "session-manager", disabled = true},
  Module:new{name = "startup-time-profiler", disabled = true},
  Module:new{name = "indent-guides"},
  Module:new{name = "animations", disabled = true},
  Module:new{name = "themes", disabled = false},
  Module:new{name = "hex-color-as-bg"}
}

--- A list of modules that are enabled
--- @type table
Modules.enabledModules = (function ()
  local r = {}
  for i = 1, #modules do
    if modules[i].disabled == false then
      table.insert(r, modules[i])
    end
  end
  return r;
end)()

--local function flatten(item, result )
  --local r = result or {}
  --for k, v in pairs( item ) do
    --if type( item ) == 'table' then
      --result[ #result +1 ] = item
    --end
  --end
  --return r
-- end

--- A list of modules that are:
---- Enabled
---- Validated to pass syntax checking
--- @type table
Modules.functionalModules = (function ()
  local r = {}
  for i = 1, #Modules.enabledModules do
    local moduleIsOk, module = pcall(require, 'modules.' ..
      Modules.enabledModules[i].name)
    if moduleIsOk then
      table.insert(r, module)
    else
      print(Modules.enabledModules[i].name .. ": " .. module)
    end
  i = i + 1
  end
  return r
end)()

return Modules
