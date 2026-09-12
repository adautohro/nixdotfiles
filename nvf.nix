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
          expandtab = true;
          shiftwidth = 4;
          tabstop = 4;
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
          hardtime-nvim.enable = true;
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
