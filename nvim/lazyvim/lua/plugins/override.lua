local api_info = vim.fn.api_info()
local nvim_version = table.concat({
  api_info.version.major,
  api_info.version.minor,
  api_info.version.patch,
}, ".")
local jit_version = jit.version
local header = [[ 


]] .. "neovim " .. nvim_version .. [[ 
]] .. jit_version .. [[


]]

-- from https://github.com/nvim-lualine/lualine.nvim/blob/b431d228b7bbcdaea818bdc3e25b8cdbe861f056/lua/lualine/utils/mode.lua
local Mode = {}

-- stylua: ignore
Mode.map = {
  ['n']      = 'N',
  ['no']     = 'O-PENDING',
  ['nov']    = 'O-PENDING',
  ['noV']    = 'O-PENDING',
  ['no\22'] = 'O-PENDING',
  ['niI']    = 'N',
  ['niR']    = 'N',
  ['niV']    = 'N',
  ['nt']     = 'N',
  ['ntT']    = 'N',
  ['v']      = 'V',
  ['vs']     = 'V',
  ['V']      = 'V-LINE',
  ['Vs']     = 'V-LINE',
  ['\22']   = 'V-BLOCK',
  ['\22s']  = 'V-BLOCK',
  ['s']      = 'SELECT',
  ['S']      = 'S-LINE',
  ['\19']   = 'S-BLOCK',
  ['i']      = 'I',
  ['ic']     = 'I',
  ['ix']     = 'I',
  ['R']      = 'R',
  ['Rc']     = 'R',
  ['Rx']     = 'R',
  ['Rv']     = 'V-REPLACE',
  ['Rvc']    = 'V-REPLACE',
  ['Rvx']    = 'V-REPLACE',
  ['c']      = 'C',
  ['cv']     = 'EX',
  ['ce']     = 'EX',
  ['r']      = 'R',
  ['rm']     = 'MORE',
  ['r?']     = 'CONFIRM',
  ['!']      = 'SHELL',
  ['t']      = 'T',
}

---@return string current mode name
local function _mode()
  local mode_code = vim.api.nvim_get_mode().mode
  if Mode.map[mode_code] == nil then
    return mode_code
  end
  return Mode.map[mode_code]
end

return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      render = "compact",
      stages = "fade_in_slide_out",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = {
          left = "",
          right = "",
        },
        component_separators = {
          left = "",
          right = "",
        },
      },
      sections = {
        lualine_a = { _mode },
        lualine_y = {}, -- progress e location
        lualine_z = {}, -- hora atual
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      extensions = {
        project = {
          cd_scope = { "window" },
          base_dirs = {
            { path = "~/src", max_depth = 4 },
          },
        },
      },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    opts = {
      config = {
        header = vim.split("" .. header, "\n"),
        footer = {},
      },
    },
  },
  {
    "pwntester/octo.nvim",
    opts = {
      default_remote = { "origin", "upstream" },
      default_merge_method = "commit",
    },
  },
}
