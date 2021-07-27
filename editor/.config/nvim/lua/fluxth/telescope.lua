-- export custom module
local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").git_files({
        prompt_title = "dotfiles",
        cwd = "$HOME/dotfiles",
    })
end

return M
