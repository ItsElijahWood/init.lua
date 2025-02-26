local last_project = nil
local last_file = nil

local function switch_project()
  -- Adjust the path for Linux environments
  local base_path = vim.fn.has("unix") == 1 and "~/dev/itselijahwood" or "C:\\Users\\ejthe\\dev\\itselijahwood"

  -- Use `find` to list directories
  local projects = vim.fn.systemlist("find " .. vim.fn.fnameescape(base_path) .. " -maxdepth 1 -type d")

  if #projects == 0 then
    print("No projects found in " .. base_path)
    return
  end

  require("fzf-lua").fzf_exec(projects, {
    prompt = "Switch Project> ",
    actions = {
      ["default"] = function(selected)
        local new_project = vim.fn.fnamemodify(selected[1], ":p")
        local current_project = vim.fn.getcwd()
        local current_file = vim.fn.expand("%:p")

        if new_project ~= current_project then
          last_project = current_project
          last_file = current_file:find(current_project, 1, true) and current_file:sub(#current_project + 2) or nil

          -- Use `defer_fn` to prevent blocking UI
          vim.defer_fn(function()
            vim.cmd("cd " .. vim.fn.fnameescape(new_project))
            vim.cmd("edit .")
            print("Switched to " .. new_project)
          end, 0)
        end
      end
    },
    async = true,  -- Make fzf run asynchronously
  })
end

local function swap_project()
  if last_project and vim.fn.isdirectory(last_project) == 1 then
    local current_project = vim.fn.getcwd()
    local current_file = vim.fn.expand("%:p")

    local temp_project, temp_file = last_project, last_file

    -- Prevent UI blocking by deferring execution
    vim.defer_fn(function()
      -- Change directory silently
      vim.cmd("silent! cd " .. vim.fn.fnameescape(temp_project))
      print("Switched back to " .. temp_project)

      -- Restore last opened file without blocking UI
      if temp_file then
        local restored_file = temp_project .. "/" .. temp_file
        if vim.loop.fs_stat(restored_file) then  -- Asynchronous file existence check
          vim.cmd("silent! edit " .. vim.fn.fnameescape(restored_file))
          print("Restored file: " .. temp_file)
        end
      end
    end, 0)

    -- Update last_project and last_file after swap
    last_project = current_project
    last_file = current_file:find(current_project, 1, true) and current_file:sub(#current_project + 2) or nil
  else
    print("No previous project to swap to!")
  end
end


-- Keybinds
vim.keymap.set("n", "<C-f>", switch_project, { noremap = true, silent = true }) -- Open project list
vim.keymap.set("n", "<leader>p", swap_project, { noremap = true, silent = true }) -- Swap back to last project

