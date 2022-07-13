local Z = {}

-- TODO: backfill this to template
Z.setup = function()
   require'lspconfig'.zls.setup {
      cmd = {'/home/jonross/tools/zls/current/bin/zls'},
      path = {'/home/jonross/tools/zls/current/bin/zls'},
  }
end

return Z
