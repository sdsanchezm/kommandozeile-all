require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "python", "vim", "javascript", "typescript", "css", "lua", "html", "markdown", "bash", "cpp", "graphql", "java", "json", "tsx", "http" },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
