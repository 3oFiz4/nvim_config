local M = {}

local cache_file = vim.fn.stdpath("data") .. "/github_stats.json"

local function read_cache()
  local f = io.open(cache_file, "r")
  if not f then
    return nil
  end
  local content = f:read("*a")
  f:close()
  local ok, data = pcall(vim.json.decode, content)
  if ok and type(data) == "table" and data.username then
    return data
  end
  return nil
end

local function write_cache(data)
  local f = io.open(cache_file, "w")
  if f then
    f:write(vim.json.encode(data))
    f:close()
  end
end

function M.fetch_async()
  if vim.fn.executable("gh") == 1 then
    local query = 'query { user(login: "3oFiz4") { repositories(first: 100, ownerAffiliations: OWNER) { totalCount nodes { stargazerCount } } contributionsCollection { totalCommitContributions } } }'
    vim.system({ "gh", "api", "graphql", "-f", "query=" .. query }, { text = true }, function(out)
      if out.code == 0 and out.stdout then
        local ok, res = pcall(vim.json.decode, out.stdout)
        if ok and res and res.data and res.data.user then
          local u = res.data.user
          local stars = 0
          if u.repositories and u.repositories.nodes then
            for _, r in ipairs(u.repositories.nodes) do
              stars = stars + (r.stargazerCount or 0)
            end
          end
          local stats = {
            username = "3oFiz4",
            repos = u.repositories and u.repositories.totalCount or 0,
            commits = u.contributionsCollection and u.contributionsCollection.totalCommitContributions or 0,
            stars = stars,
            updated = os.time(),
          }
          write_cache(stats)
        end
      end
    end)
  end
end

function M.get_stats()
  local data = read_cache()
  local now = os.time()
  -- Refresh once per day (86400 seconds)
  if not data or not data.updated or (now - data.updated > 86400) then
    M.fetch_async()
  end
  return data or {
    username = "3oFiz4",
    repos = 65,
    commits = 333,
    stars = 41,
  }
end

return M
