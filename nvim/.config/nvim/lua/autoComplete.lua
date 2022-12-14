
local cmp = require'cmp'
local luasnip = require'luasnip'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  mapping = {
    -- confirm snippets
    ["<c-y>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    },
    -- tab to move down list
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    -- shift tab to move backwards
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 3 },
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },

  formatting = {
    fields = {"abbr", "kind", "menu"},
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        path = "[Path]"
      })[entry.source.name] 
      
      return vim_item
    end,
  },

  experimental = {
    native_menu = false,
    ghost_text = true
  }

})

cmp.setup.filetype('lua', {
  sources = cmp.config.sources({
    { name = 'nvim_lua' }
  })
})
