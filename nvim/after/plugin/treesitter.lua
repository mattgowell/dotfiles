require'nvim-treesitter.configs'.setup {
  ensure_installed = { "help", "lua", "python", "rust", "c"},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
