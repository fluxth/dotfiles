require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c", "cpp", "python", "rust", "toml", "dockerfile",
    "javascript", "typescript", "tsx", "css", "scss", "html", "json", "jsonc"
  },
  highlight = {
    enable = true,
  },
}
