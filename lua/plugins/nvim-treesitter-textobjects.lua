return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = false,
  config = function()
    require("nvim-treesitter-textobjects").setup({
      select = { lookahead = true },
    })

    local select = require("nvim-treesitter-textobjects.select")
    local move = require("nvim-treesitter-textobjects.move")

    local object_names = {
      f = "function",
      c = "class",
      i = "conditional",
      l = "loop",
      a = "argument",
      b = "block",
    }

    -- select
    local select_keymaps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      ["ai"] = "@conditional.outer",
      ["ii"] = "@conditional.inner",
      ["al"] = "@loop.outer",
      ["il"] = "@loop.inner",
      ["aa"] = "@parameter.outer",
      ["ia"] = "@parameter.inner",
      ["ab"] = "@block.outer",
      ["ib"] = "@block.inner",
    }

    for key, query in pairs(select_keymaps) do
      local prefix = key:sub(1, 1)
      local obj = key:sub(2, 2)
      local scope = prefix == "a" and "around" or "inner"
      local name = object_names[obj] or obj
      vim.keymap.set({ "x", "o" }, key, function()
        select.select_textobject(query, "textobjects")
      end, { desc = scope .. " " .. name })
    end

    -- move
    local move_keymaps = {
      ["]f"] = { fn = move.goto_next_start, query = "@function.outer", desc = "next function start" },
      ["]F"] = { fn = move.goto_next_end, query = "@function.outer", desc = "next function end" },
      ["[f"] = { fn = move.goto_previous_start, query = "@function.outer", desc = "prev function start" },
      ["[F"] = { fn = move.goto_previous_end, query = "@function.outer", desc = "prev function end" },
      ["]c"] = { fn = move.goto_next_start, query = "@class.outer", desc = "next class start" },
      ["]C"] = { fn = move.goto_next_end, query = "@class.outer", desc = "next class end" },
      ["[c"] = { fn = move.goto_previous_start, query = "@class.outer", desc = "prev class start" },
      ["[C"] = { fn = move.goto_previous_end, query = "@class.outer", desc = "prev class end" },
    }

    for key, opts in pairs(move_keymaps) do
      vim.keymap.set("n", key, function()
        opts.fn(opts.query)
      end, { desc = opts.desc })
    end
  end,
}
