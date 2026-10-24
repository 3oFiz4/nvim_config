return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
  build = ":UpdateRemotePlugins",
  dependencies = { "willothy/wezterm.nvim" },
  lazy = false,
  init = function()
    local rplugin_path = vim.fn.stdpath("data") .. "/rplugin.vim"
    if vim.fn.filereadable(rplugin_path) == 1 then
      vim.cmd("source " .. vim.fn.fnameescape(rplugin_path))
    end

    vim.g.molten_auto_open_output = false
    vim.g.molten_image_provider = "wezterm"
    vim.g.molten_output_show_more = true
    vim.g.molten_output_virt_lines = true
    vim.g.molten_split_direction = "right"
    vim.g.molten_split_size = 40
    vim.g.molten_virt_text_output = true
    vim.g.molten_use_border_highlights = true
    vim.g.molten_virt_lines_off_by_1 = true
    vim.g.molten_auto_image_popup = false
    -- Auto-patch molten remote websocket for wss/https tunnels if present
    local jupyter_api_file = vim.fn.stdpath("data") .. "/lazy/molten-nvim/rplugin/python3/molten/jupyter_server_api.py"
    if vim.fn.filereadable(jupyter_api_file) == 1 then
      local lines = vim.fn.readfile(jupyter_api_file)
      local content = table.concat(lines, "\n")
      if not content:find("ws_scheme =") then
        content = content:gsub(
          'self%._socket = websocket%.create_connection%(f"ws://{parsed_url%.hostname}:{parsed_url%.port}"%s*\n%s*f"/api/kernels/{self%._kernel_info%[\'id\'%]}/channels",%s*\n%s*header=self%._headers,%s*\n%s*%)',
          'ws_scheme = "wss" if parsed_url.scheme == "https" else "ws"\n        netloc = parsed_url.netloc\n        ws_url = f"{ws_scheme}://{netloc}/api/kernels/{self._kernel_info[\'id\']}/channels"\n        self._socket = websocket.create_connection(ws_url, header=self._headers)'
        )
        content = content:gsub(
          "while True:%s*\n%s*response = json%.loads%(self%._socket%.recv%(%)%)%s*\n%s*self%._recv_queue%.put%(response%)",
          "while True:\n            try:\n                raw = self._socket.recv()\n                if not raw:\n                    break\n                response = json.loads(raw)\n                self._recv_queue.put(response)\n            except Exception:\n                break"
        )
        vim.fn.writefile(vim.split(content, "\n"), jupyter_api_file)
      end
    end

    vim.api.nvim_create_user_command("ColabConnect", function(opts)
      local rplugin = vim.fn.stdpath("data") .. "/rplugin.vim"
      if vim.fn.filereadable(rplugin) == 1 and vim.fn.exists(":MoltenInit") == 0 then
        vim.cmd("source " .. vim.fn.fnameescape(rplugin))
      end
      local target = opts.args ~= "" and opts.args or "http://localhost:8888"
      vim.cmd("MoltenInit " .. target)
    end, {
      nargs = "?",
      desc = "Connect Molten to Colab remote Jupyter kernel",
    })
  end,
  keys = {
    { "<leader>mi", ":MoltenInit<cr>", desc = "Molten Init Kernel" },
    { "<leader>mc", ":ColabConnect ", desc = "Molten Connect Colab (URL/Token)" },
    { "<leader>me", ":MoltenEvaluateOperator<cr>", desc = "Molten Evaluate Operator" },
    { "<leader>ml", ":MoltenEvaluateLine<cr>", desc = "Molten Evaluate Line" },
    { "<leader>mr", ":MoltenReevaluateCell<cr>", desc = "Molten Re-evaluate Cell" },
    { "<leader>mo", ":MoltenShowOutput<cr>", desc = "Molten Show Output" },
    { "<leader>mh", ":MoltenHideOutput<cr>", desc = "Molten Hide Output" },
    { "<leader>md", ":MoltenDelete<cr>", desc = "Molten Delete Cell Output" },
    { "<leader>mI", ":MoltenInterrupt<cr>", desc = "Molten Interrupt Kernel" },
    { "<leader>mv", ":<C-u>MoltenEvaluateVisual<cr>gv", mode = "v", desc = "Molten Evaluate Visual" },
    {
      "<leader>mx",
      function()
        local ok, ipynb_state_mod = pcall(require, "ipynb.state")
        if ok and ipynb_state_mod then
          local state = ipynb_state_mod.get()
          if state and state.facade_buf == vim.api.nvim_get_current_buf() then
            local cursor_line = vim.api.nvim_win_get_cursor(0)[1] - 1
            local cells_mod = require("ipynb.cells")
            local cell_idx = cells_mod.get_cell_at_line(state, cursor_line)
            if cell_idx then
              local c_start, c_end = cells_mod.get_content_range(state, cell_idx)
              if c_start and c_end and c_start <= c_end then
                -- 1-based indexing for MoltenEvaluateRange
                vim.fn.MoltenEvaluateRange(c_start + 1, c_end + 1)
                return
              end
            end
          end
        end
        -- Fallback to MoltenReevaluateCell if not in ipynb facade
        vim.cmd("MoltenReevaluateCell")
      end,
      desc = "Execute Current Cell in Molten",
    },
  },
}
