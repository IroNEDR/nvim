require("luarocks-nvim").setup()
require("neorg").setup{
    load = {
        ["core.export"] = {},
        ["core.keybinds"] = {
            config = {
        hook = function(keybinds)
            keybinds.remap_event("norg", "n", "<leader>t", "core.qol.todo_items.todo.task_done")
        end,
    }
        },
        ["core.defaults"] = {},
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/notes",
                    learn = "~/learn",
                }
            }
        }
    }
}
