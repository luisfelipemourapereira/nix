local M = {}

local function mergeTables(t1, t2)
  local merged = {}
  for k, v in pairs(t1) do
    merged[k] = v
  end
  for k, v in pairs(t2) do
    merged[k] = v
  end
  return merged
end

local DEFAULT_SETTINGS = {
  -- A list of sources to install if they're not already installed.
  -- This setting has no relation with the `automatic_installation` setting.
  ensure_installed = {},
  -- Enable or disable null-ls methods to get set up
  -- This setting is useful if some functionality is handled by other plugins such as `conform` and `nvim-lint`
  methods = {
    diagnostics = true,
    formatting = true,
    code_actions = true,
    completion = true,
    hover = true,
  },
  -- Run `require("null-ls").setup`.
  -- Will automatically install masons tools based on selected sources in `null-ls`.
  -- Can also be an exclusion list.
  -- Example: `automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }`
  automatic_installation = false,
  -- See [#handlers-usage](#handlers-usage) section
  handlers = nil,
}

function M.setup()
  require("mason-null-ls").setup(
    mergeTables(
      {
        ensure_installed = nil,
        automatic_installation = true
      },
      DEFAULT_SETTINGS
    )
  )
end

return M
