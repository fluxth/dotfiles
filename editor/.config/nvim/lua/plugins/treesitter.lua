require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c", "cpp", "python", "rust", "toml", "dockerfile", "yaml", "lua",
    "javascript", "typescript", "tsx", "css", "scss", "html", "json", "jsonc"
  },
  highlight = {
    enable = true
  },
}
