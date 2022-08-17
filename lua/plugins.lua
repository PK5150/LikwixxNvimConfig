local lspconfig = require("lspconfig")

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  -- ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require('mason').setup(
{
    ui =
    {
        icons =
        {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }


})
require('mason-lspconfig').setup()
require('mason-lspconfig').setup_handlers
{
    function (server_name)
        lspconfig[server_name].setup {}
    end

}

require('null-ls').setup({
    sources = {
        require("null-ls").builtins.formatting.autopep8,
        require("null-ls").builtins.diagnostics.flake8,
    },
})

return require('packer').startup(function()
    -- packer -- DUUUH
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'

    -- LSP stuff
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    -- Linters and others
    use 'jose-elias-alvarez/null-ls.nvim'
    -- DAP stuff -- debug

     use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }


    -- file management
    use 'vifm/vifm.vim'

    -- colorschemes
    use 'RRethy/nvim-base16'


    --  rainbow brackets
    use 'frazrepo/vim-rainbow'



end)
