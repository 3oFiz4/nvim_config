local M = {}

local cache_dir = vim.fn.stdpath("data") .. "/pinterest_cache"
local sync_script = vim.fn.stdpath("config") .. "/lua/config/fetch_pinterest.py"
local last_sync_file = vim.fn.stdpath("data") .. "/pinterest_last_sync.txt"

function M.fetch_async()
  local now = os.time()
  local f = io.open(last_sync_file, "w")
  if f then
    f:write(tostring(now))
    f:close()
  end

  if vim.fn.filereadable(sync_script) == 1 then
    vim.system({ "python", sync_script }, { text = true }, function() end)
  end
end

function M.get_random_pin()
  local stat = vim.uv.fs_stat(last_sync_file)
  local now = os.time()
  if not stat or (now - stat.mtime.sec > 86400) then
    M.fetch_async()
  end

  local files = vim.fn.globpath(cache_dir, "*.*", false, true)
  if #files == 0 then
    return nil
  end

  math.randomseed(os.time() + (vim.uv.hrtime() % 1000000))
  local chosen = files[math.random(#files)]
  return chosen
end

return M
