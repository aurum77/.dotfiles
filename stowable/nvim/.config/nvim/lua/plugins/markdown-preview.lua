function OpenMarkdownPreview(url)
  vim.api.nvim_command(string.format("silent !firefox --new-window %s", url))
end

vim.api.nvim_exec([[
function OpenMarkdownPreview (url)
  execute "silent ! firefox --new-window " . a:url
  endfunction
  ]], false)

vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
