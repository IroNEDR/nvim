require("luarocks-nvim").setup()
require("neorg").setup{
    load = {
        ["core.keybinds"] = {},
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
