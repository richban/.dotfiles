vim.api.nvim_exec([[
function! LspStatus() abort
  if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
     return luaeval("require('lsp-status').status()")
  else
     return ''
  endif
endfunction
]], true)

require('lualine').setup{
    options = {
      theme = 'gruvbox',
      section_separators = {'', ''},
      component_separators = {'', ''},
      icons_enabled = true,
    },
    sections = {
      lualine_a = { {'mode', upper = true} },
      lualine_b = { {'branch', icon = ''} },
      lualine_c = { {'filename', file_status = true} },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location'  },
    },
    inactive_sections = {
      lualine_a = {  },
      lualine_b = {  },
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {  },
      lualine_z = {   }
    },
    extensions = { 'fzf' }
}