local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<esc>"] = actions.close,
            }
        },

        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '-g', '!.git/'
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')

-- telescope binds
local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

map('n', '<c-p>', ':lua require("telescope.builtin").git_files()<cr>', options)

map('n', '<leader>fg', ':lua require("telescope.builtin").git_files()<cr>', options)
map('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<cr>', options)

map('n', '<leader>fs', ':lua require("telescope.builtin").live_grep()<cr>', options)
map('n', '<leader>fw', ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<cr>', options)
map('n', '<leader>fb', ':lua require("telescope.builtin").buffers()<cr>', options)
map('n', [[\\]], ':lua require("telescope.builtin").buffers()<cr>', options)
map('n', '<leader>fh', ':lua require("telescope.builtin").help_tags()<cr>', options)
map('n', '<leader>fe', ':lua require("telescope.builtin").file_browser()<cr>', options)

-- custom modes
map('n', '<leader>fd', ':lua require("fluxth.telescope").search_dotfiles()<cr>', options)

-- git related binds
map('n', '<leader>gb', ':lua require("telescope.builtin").git_branches()<cr>', options)
