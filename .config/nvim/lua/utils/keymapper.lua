--- Expose tables and functions managing custom neovim keymappings
--- @class Keymapper
local Keymapper = {}

--- Defines a vim key mapping.
--- @class Keymap
local Keymap = {
  --- A description of what the keymap does
  description = "Echos the meaning of life",
  --- The prefix used to start checking for a keymap. This is usually
  --- `<space>`.
  leader = "<space>",
  --- The command sequence following the leader character.
  command = "<space>",
  --- The mode(s) the keymap applies to
  mode = "n",
  --- Options to pass to nvim_set_keymap
  options = { noremap=true, silent=true },
  --- The function to run when the keybinding is triggered
  operation = function()
    vim.cmd('echo 42')
  end
}

function Keymap:new(t)
  self.__index = self
  return setmetatable(t, self)
end

---@class LazyKeysSpec
---@field desc? string
---@field noremap? boolean
---@field remap? boolean
---@field expr? boolean
---@field nowait? boolean
---@field ft? string|string[]
---@field [1] string lhs
---@field [2]? string|fun()|false rhs
---@field mode? string|string[]

--- Returns the keymap as a table usable by lazy.nvim 
--- @return LazyKeysSpec
function Keymap:toLazyKeysSpec()
  return {
    self.leader .. self.command,
    self.operation,
    desc = self.description,
    -- noremap = self.options.noremap,
    -- remap = not self.options.noremap,
    -- mode = self.mode
  }
end

--- A list of registered custom keymappings
Keymapper.registeredKeymaps = {}

--- Creates and registers a new keymap.
--- @param t Keymap table containing Keymap type values
--- @return Keymap
Keymapper.bindKeymap = function(t)
  local keymap = Keymap:new(t)
  vim.keymap.set('n', keymap.leader .. keymap.command,
    keymap.operation, keymap.options)
  table.insert(Keymapper.registeredKeymaps, keymap)
  return keymap
end

return Keymapper
