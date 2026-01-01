return {
    {
        "bjarneo/aether.nvim",
        name = "aether",
        priority = 1000,
        opts = {
            disable_italics = false,
            colors = {
                -- Monotone shades (base00-base07)
                base00 = "#000111", -- Default background
                base01 = "#3e45b9", -- Lighter background (status bars)
                base02 = "#000111", -- Selection background
                base03 = "#3e45b9", -- Comments, invisibles
                base04 = "#7781D1", -- Dark foreground
                base05 = "#b9bfea", -- Default foreground
                base06 = "#b9bfea", -- Light foreground
                base07 = "#7781D1", -- Light background

                -- Accent colors (base08-base0F)
                base08 = "#2936ff", -- Variables, errors, red
                base09 = "#858cff", -- Integers, constants, orange
                base0A = "#7379d4", -- Classes, types, yellow
                base0B = "#6D76C5", -- Strings, green
                base0C = "#9da1d7", -- Support, regex, cyan
                base0D = "#8085d6", -- Functions, keywords, blue
                base0E = "#7c83e9", -- Keywords, storage, magenta
                base0F = "#b7baec", -- Deprecated, brown/yellow
            },
        },
        config = function(_, opts)
            require("aether").setup(opts)
            vim.cmd.colorscheme("aether")

            -- Enable hot reload
            require("aether.hotreload").setup()
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "aether",
        },
    },
}
