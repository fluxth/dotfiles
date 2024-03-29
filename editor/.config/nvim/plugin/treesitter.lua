require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "c", "cpp", "python", "rust", "toml", "dockerfile", "yaml", "lua", "bash", "go",
    "javascript", "typescript", "tsx", "css", "scss", "html", "json", "jsonc", "svelte"
  },
  highlight = {
    enable = true
  },
  matchup = {
    enable = true,
  },
}
