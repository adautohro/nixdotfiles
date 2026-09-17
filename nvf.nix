{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        syntaxHighlighting = true;
        searchCase = "smart";

        options = {
          cursorlineopt = "both";
          autoindent = true;
          smartindent = true;
          preserveindent = true;
          smarttab = true;
          expandtab = true;
          shiftwidth = 4;
          tabstop = 4;
          softtabstop = 4;
        };

        lazy.plugins = {
          "tokyonight.nvim".package = pkgs.vimPlugins.tokyonight-nvim;
          "gruvbox.nvim".package = pkgs.vimPlugins.gruvbox-nvim;
          "onedark.nvim".package = pkgs.vimPlugins.onedark-nvim;
          "neovim-ayu".package = pkgs.vimPlugins.neovim-ayu;
        };

        ui = {
          borders = {
            enable = true;
            globalStyle = "rounded";
          };

          nvim-highlight-colors.enable = true;
          dropbar-nvim.enable = true;

          ui2.enable = true;
        };

        visuals = {
          fidget-nvim.enable = true;
        };

        keymaps = [
          # tab navigation
          {
            mode = [ "n" ];
            key = "<leader>tn";
            action = "<C-w>T";
            desc = "Open current file in tab";
          }
          {
            mode = [ "n" ];
            key = "<leader>tx";
            action = ":tabclose<CR>";
            desc = "Close tab";
          }
          {
            mode = [ "n" ];
            key = "<A-Right>";
            action = "gt";
            desc = "Move to tab right";
          }
          {
            mode = [ "n" ];
            key = "<A-Left>";
            action = "gT";
            desc = "Move to tab left";
          }
          {
            mode = [ "n" ];
            key = "<leader>ta";
            action = ":tabonly<CR>";
            desc = "Close all other tabs";
          }

          # Improve page navigation
          {
            mode = [ "n" ];
            key = "<C-d>";
            action = "<C-d>zz";
            desc = "Half page down";
          }
          {
            mode = [ "n" ];
            key = "<C-u";
            action = "<C-u>zz";
            desc = "Half page up";
          }

          # Improve window navigation
          {
            mode = [ "n" ];
            key = "<A-h>";
            action = "<C-w>h";
            desc = "Switch to left window";
          }
          {
            mode = [ "n" ];
            key = "<A-j>";
            action = "<C-w>j";
            desc = "Switch to down window";
          }
          {
            mode = [ "n" ];
            key = "<A-k>";
            action = "<C-w>k";
            desc = "Switch to up window";
          }
          {
            mode = [ "n" ];
            key = "<A-l>";
            action = "<C-w>l";
            desc = "Switch to right window";
          }

          # Split and resize window
          {
            mode = [ "n" ];
            key = "<leader>S";
            action = ":split<CR>";
            desc = "Split horizontally";
          }
          {
            mode = [ "n" ];
            key = "<leader>s";
            action = ":vsplit<CR>";
            desc = "Split vertically";
          }
          {
            mode = [ "n" ];
            key = "<C-Up>";
            action = ":resize +2 <CR>";
            desc = "Increase window height";
          }
          {
            mode = [ "n" ];
            key = "<C-Down>";
            action = ":resize -2<CR>";
            desc = "Decrease window height";
          }
          {
            mode = [ "n" ];
            key = "<C-Left>";
            action = ":vertical resize +2<CR>";
            desc = "Increase window width";
          }
          {
            mode = [ "n" ];
            key = "<C-Right>";
            action = ":vertical resize -2<CR>";
            desc = "Decrease window width";
          }

          # Move lines down/up
          {
            mode = [ "n" ];
            key = "<S-A-j>";
            action = ":m .+1<CR>==";
            desc = "Move line down";
          }
          {
            mode = [ "n" ];
            key = "<S-A-k>";
            action = ":m .-2<CR>==";
            desc = "Move line up";
          }
          {
            mode = [ "v" ];
            key = "<S-A-j>";
            action = ":m '>+1<CR>gv=gv";
            desc = "Move selection down";
          }
          {
            mode = [ "v" ];
            key = "<S-A-k>";
            action = ":m '<-2<CR>gv=gv";
            desc = "Move selection up";
          }

          {
            mode = [ "v" ];
            key = "<";
            action = "<gv";
            desc = "Indent selection right";
          }
          {
            mode = [ "v" ];
            key = ">";
            action = ">gv";
            desc = "Indent selection left";
          }

          # Terminal
          {
            mode = [ "t" ];
            key = "<Esc>";
            action = "<C-\\><C-n>";
            desc = "Escape terminal mode";
          }
          {
            mode = [ "t" ];
            key = "<A-h>";
            action = "<C-\\><C-n><C-w>h";
            desc = "Escape terminal mode";
          }
          {
            mode = [ "t" ];
            key = "<A-l>";
            action = "<C-\\><C-n><C-w>l";
            desc = "Escape terminal mode";
          }
          {
            mode = [ "t" ];
            key = "<A-j>";
            action = "<C-\\><C-n><C-w>j";
            desc = "Escape terminal mode";
          }
          {
            mode = [ "t" ];
            key = "<A-k>";
            action = "<C-\\><C-n><C-w>k";
            desc = "Escape terminal mode";
          }

          {
            key = "<leader>z";
            mode = [ "n" ];
            action = ":lua Snacks.zen.zen()<CR>";
            silent = true;
            desc = "Zen Mode";
          }
          {
            key = "<leader>ff";
            mode = [ "n" ];
            action = ":lua Snacks.picker.files()<CR>";
            silent = true;
            desc = "Pick files";
          }

          {
            key = "<leader>fb";
            mode = [ "n" ];
            action = ":lua Snacks.picker.buffers()<CR>";
            silent = true;
            desc = "Pick buffers";
          }
          {
            key = "<leader>fh";
            mode = [ "n" ];
            action = ":lua Snacks.picker.help()<CR>";
            silent = true;
            desc = "Pick help";
          }
          {
            key = "<leader>fc";
            mode = [ "n" ];
            action = ":lua Snacks.picker.colorschemes()<CR>";
            silent = true;
            desc = "Pick colorschemes";
          }
          {
            key = "<leader>fp";
            mode = [ "n" ];
            action = ":lua Snacks.picker.projects()<CR>";
            silent = true;
            desc = "Pick projects";
          }
          {
            key = "<leader>fi";
            mode = [ "n" ];
            action = ":lua Snacks.picker.icons()<CR>";
            silent = true;
            desc = "Pick icons";
          }
          {
            key = "<leader>fd";
            mode = [ "n" ];
            action = ":lua Snacks.picker.diagnostics_buffer()<CR>";
            silent = true;
            desc = "Pick buffer diagnostics";
          }
          {
            key = "<leader>fD";
            mode = [ "n" ];
            action = ":lua Snacks.picker.diagnostics()<CR>";
            silent = true;
            desc = "Pick workspace diagnostics";
          }
          {
            key = "<leader>fk";
            mode = [ "n" ];
            action = ":lua Snacks.picker.keymaps()<CR>";
            silent = true;
            desc = "Pick keymaps";
          }
          {
            key = "<leader>fg";
            mode = [ "n" ];
            action = ":lua Snacks.picker.grep()<CR>";
            silent = true;
            desc = "Pick grep";
          }
          {
            key = "<leader>fm";
            mode = [ "n" ];
            action = ":lua Snacks.picker.marks()<CR>";
            silent = true;
            desc = "Pick marks";
          }
          {
            key = "<leader>fr";
            mode = [ "n" ];
            action = ":lua Snacks.picker.registers()<CR>";
            silent = true;
            desc = "Pick registers";
          }
        ];

        theme = {
          enable = true;
          transparent = true;
          name = "catppuccin";
          style = "auto";
        };

        git = {
          gitsigns.enable = true;
        };

        lsp = {
          enable = true;
          inlayHints.enable = true;
          formatOnSave = false;
          lightbulb.enable = true;
        };

        formatter = {
          conform-nvim.enable = true;
          conform-nvim.presets = {
            nixfmt.enable = true;
            stylua.enable = true;
          };
        };

        binds = {
          whichKey.enable = true;
        };

        languages = {
          enableDAP = true;
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix = {
            enable = true;
          };

          lua.enable = true;
        };

        treesitter = {
          enable = true;
          fold = true;
          autotagHtml = true;
          textobjects.enable = true;
        };

        diagnostics = {
          enable = true;
          config = {
            signs = true;
          };
        };

        debugger = {
          nvim-dap.enable = true;
          nvim-dap.ui.enable = true;
        };

        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
        };

        mini = {
          ai = {
            enable = true;
          };
          surround.enable = true;

          pairs = {
            enable = true;
          };

          tabline.enable = true;
          indentscope.enable = true;

          icons.enable = true;
        };

        utility = {
          undotree.enable = true;
          yazi-nvim.enable = true;
          snacks-nvim = {
            enable = true;
            setupOpts = {
              image = {
                enabled = true;
              };

              zen = {
                enabled = true;
              };

              picker = {
                enabled = true;
                layout = {
                  preset = "vscode";
                };
              };

              dim.enabled = true;
            };
          };
        };

        statusline = {
          lualine.enable = true;
        };

        spellcheck.enable = true;
      };
    };
  };
}
