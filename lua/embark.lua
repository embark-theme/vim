---@class embark
local M = {}

---@return boolean
function M.check_tgc()
  return vim.fn.exists('+termguicolors') == 1
end

---@param opts? embark.Opts
function M.setup(opts)
  opts = opts or {}

  local config = require('embark.config')
  config.options = vim.tbl_deep_extend('keep', opts, config.defaults)

  if not M.check_tgc() then
    vim.notify('`termguicolors` not found!', vim.log.levels.WARN)
  end
end

return M
-- vim:ts=2:sts=2:sw=2:et
