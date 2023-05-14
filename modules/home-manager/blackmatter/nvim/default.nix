{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.blackmatter.programs.nvim;
  inherit (pkgs.stdenv.hostPlatform) isLinux isDarwin;
  plugins.toggles =
    {
      # enabled lua libraries

      # TODO: needs a valid macos build
      # TODO: turning off until a valid build
      # TODO: is created for the rust dependency
      jcdickinson."http.nvim".enable = false;
      nvim-lua.plenary.enable = true;

      # enabled plugins
      folke."which-key.nvim".enable = true;
      maaslalani.nordbuddy.enable = true;
      folke."neodev.nvim".enable = true;
      neovim.nvim-lspconfig.enable = true;
      hrsh7th.nvim-cmp.enable = true;
      jose-elias-alvarez.null-ls.enable = true;
      yriveiro."dap-go.nvim".enable = true;
      nathom.filetype.enable = true;
      NvChad."nvim-colorizer.lua".enable = true;
      numToStr.Comment.enable = true;
      nvim-lualine.lualine.enable = true;
      nvim-telescope."telescope.nvim".enable = true;
      nvim-telescope."telescope-file-browser.nvim".enable = true;
      nvim-telescope."telescope-project.nvim".enable = true;
      nvim-telescope."telescope-dap.nvim".enable = true;
      nvim-telescope."telescope-z.nvim".enable = true;
      nvim-tree.nvim-web-devicons.enable = true;
      nvim-treesitter.nvim-treesitter.enable = true;
      nvim-treesitter.nvim-treesitter-textobjects.enable = true;
      nvim-treesitter.nvim-treesitter-refactor.enable = true;
      # tree-sitter for nix is bugged with OOM
      LnL7.vim-nix.enable = true;
      simrat39."rust-tools.nvim".enable = true;
      williamboman."mason.nvim".enable = true;
      williamboman."mason-lspconfig.nvim".enable = true;
      ray-x.lsp_signature.enable = true;
      onsails."lspkind.nvim".enable = true;
      willothy."veil.nvim".enable = true;

      # dap protocol off plugins
      Pocco81."dap-buddy.nvim".enable = false;

      # enabled completion mechanisms
      ray-x.cmp-treesitter.enable = true;
      hrsh7th.cmp-nvim-lsp.enable = true;
      hrsh7th.cmp-cmdline.enable = true;
      sar."cmp-lsp.nvim".enable = true;
      hrsh7th.cmp-buffer.enable = true;
      hrsh7th.cmp-path.enable = true;

      # TODO: has bug, so turning off for now
      jcdickinson."codeium.nvim".enable = false;

      # disabled plugins
      Wansmer.treesj.enable = false;
      EtiamNullam."relative-source.nvim".enable = false;
      zbirenbaum."copilot.lua".enable = true;
      zbirenbaum."copilot-cmp".enable = true;
      ziontee113."icon-picker.nvim".enable = false;
      windwp.nvim-projectconfig.enable = false;
      windwp.nvim-ts-autotag.enable = false;
      yamatsum.nvim-nonicons.enable = false;
      RishabhRD.nvim-lsputils.enable = false;
      RRethy.vim-illuminate.enable = false;
      rafcamlet.nvim-luapad.enable = false;
      rafcamlet."tabline-framework.nvim".enable = false;
      nanotee.nvim-lsp-basics.enable = false;
      rest-nvim."rest.nvim".enable = false;
      # TODO: requires python3 that cannot be found
      ms-jpq.chadtree.enable = false;
      nanotee.nvim-lua-guide.enable = false;
      niuiic."divider.nvim".enable = false;
      NTBBloodbath."galaxyline.nvim".enable = false;
      nfrid.markdown-togglecheck.enable = false;
      MunifTanjim."nui.nvim".enable = false;
      LudoPinelli."comment-box.nvim".enable = false;
      madskjeldgaard.reaper-nvim.enable = false;
      lotabout.skim.enable = false;
      danielpieper."telescope-tmuxinator.nvim".enable = false;
      drybalka."tree-climber.nvim".enable = false;
      jubnzv."mdeval.nvim".enable = false;
      kkharji."sqlite.lua".enable = false;
      kosayoda.nvim-lightbulb.enable = false;
      idanarye.nvim-buffls.enable = false;
      gwatcha.reaper-keys.enable = false;
      LeonHeidelbach."trailblazer.nvim".enable = false;
      lewis6991."gitsigns.nvim".enable = false;
      jghauser."follow-md-links.nvim".enable = false;
      declancm."cinnamon.nvim".enable = false;
      ibhagwan.fzf-lua.enable = false;
      glepnir."lspsaga.nvim".enable = false;
      glepnir.dashboard-nvim.enable = false;
      chrisgrieser.nvim-various-textobjs.enable = false;
      esensar.nvim-dev-container.enable = false;
      nvim-lua."lsp-status.nvim".enable = false;
      bennypowers.nvim-regexplainer.enable = false;
      cuducos."yaml.nvim".enable = false;
      cbochs."grapple.nvim".enable = false;
      norcalli."nvim-colorizer.lua".enable = false;
      akinsho."git-conflict.nvim".enable = false;
      jose-elias-alvarez."typescript.nvim".enable = false;
      simrat39."symbols-outline.nvim".enable = false;
      mfussenegger.nvim-jdtls.enable = false;
      nvim-lua."popup.nvim".enable = false;
      ldelossa."gh.nvim".enable = false;
      ldelossa."litee.nvim".enable = false;
      nvim-orgmode.orgmode.enable = false;
      ray-x."navigator.lua".enable = false;
      amrbashir.nvim-docs-view.enable = false;
      p00f."cphelper.nvim".enable = false;
      lewis6991.impatient.enable = false;
      f-person."git-blame.nvim".enable = false;
      folke."noice.nvim".enable = false;
      frabjous.knap.enable = false;
      aserowy."tmux.nvim".enable = false;
      michaelb.sniprun.enable = false;
      mrjones2014."legendary.nvim".enable = false;
      MarcHamamji."runner.nvim".enable = true;
      tpope.vim-fugitive.enable = true;
      tpope.vim-repeat.enable = true;
      mfussenegger.nvim-lint.enable = false;
      camspiers.animate.enable = false;
      tpope.vim-rhubarb.enable = false;
      numToStr."Navigator.nvim".enable = false;
      camspiers.lens.enable = false;
      gnikdroy."projections.nvim".enable = false;
      nvim-neorg.neorg.enable = false;
      nvim-neorocks.luarocks-tag-release.enable = false;
      gennaro-tedesco."nvim-possession".enable = false;
      ojroques.nvim-lspfuzzy.enable = false;
      phaazon."hop.nvim".enable = false;
      pwntester."octo.nvim".enable = false;
      SchemaStore.schemastore.enable = false;
      smjonas."inc-rename.nvim".enable = false;
      someone-stole-my-name."yaml-companion.nvim".enable = false;
      sudormrfbin."cheatsheet.nvim".enable = false;
      svermeulen.vimpeccable.enable = false;
      tjdevries."vlog.nvim".enable = false;
      ellisonleao."glow.nvim".enable = false;


      # this is a less compatible nord with tree-sitter
      shaunsingh.nord.enable = false;

      # dap protocol
      ravenxrz."DAPInstall.nvim".enable = true;
      mfussenegger.nvim-dap.enable = true;
      # lua debug adapter
      jbyuki.one-small-step-for-vimkind.enable = true;

      # dap protocol
      leoluz.nvim-dap-go.enable = true;
      mfussenegger.nvim-dap-python.enable = true;
      theHamsta.nvim-dap-virtual-text.enable = true;
      suketa.nvim-dap-ruby.enable = true;
      rcarriga.nvim-dap-ui.enable = true;


    } // 

    # unfortunately macos has some sandbox issue
    # that makes loading many plugins at once
    # somewhat impossible, separating this to linux
    # only for now.
    lib.optionalAttrs isLinux {

      # testing
      nvim-neotest.neotest.enable = true;
      nvim-neotest.neotest-python.enable = true;
      nvim-neotest.neotest-plenary.enable = true;
      nvim-neotest.neotest-go.enable = true;
      nvim-neotest.neotest-jest.enable = true;
      rouge8.neotest-rust.enable = true;
      stevearc."overseer.nvim".enable = true;

      # improved motion
      andymass.vim-matchup.enable = true;
      chaoren.vim-wordmotion.enable = true;
      wellle."targets.vim".enable = true;
      ggandor."leap.nvim".enable = true;
      unblevable.quick-scope.enable = true;
      t3rro.nvim-ts-rainbow.enable = true;

      # snippets
      L3MON4D3.LuaSnip.enable = true;
      rafamadriz.friendly-snippets.enable = true;

      # refactoring
      ThePrimeagen."refactoring.nvim".enable = true;

      # annotating
      kkoomen.vim-doge.enable = true;
      danymat.neogen.enable = true;

      # rest calls
      diepm.vim-rest-console.enable = true;
      NTBBloodbath."rest.nvim".enable = true;
    } ;
in
{
  imports =
    [
      ./plugins/maaslalani/nordbuddy
      ./plugins/kkoomen/vim-doge
      ./plugins/danymat/neogen
      ./plugins/ThePrimeagen/refactoring.nvim
      ./plugins/diepm/vim-rest-console
      ./plugins/ravenxrz/DAPInstall.nvim
      ./plugins/Pocco81/dap-buddy.nvim
      ./plugins/willothy/veil.nvim
      ./plugins/jcdickinson/codeium.nvim
      ./plugins/jcdickinson/http.nvim
      ./plugins/folke/neodev.nvim
      ./plugins/neovim/nvim-lspconfig
      ./plugins/hrsh7th/nvim-cmp
      ./plugins/jose-elias-alvarez/null-ls
      ./plugins/yriveiro/dap-go.nvim
      ./plugins/nvim-lua/plenary
      ./plugins/mfussenegger/nvim-dap
      ./plugins/leoluz/nvim-dap-go
      ./plugins/mfussenegger/nvim-dap-python
      ./plugins/nathom/filetype
      ./plugins/NvChad/nvim-colorizer.lua
      ./plugins/numToStr/Comment
      ./plugins/nvim-lualine/lualine
      ./plugins/nvim-telescope/telescope.nvim
      ./plugins/nvim-telescope/telescope-file-browser.nvim
      ./plugins/svermeulen/vimpeccable
      ./plugins/tjdevries/vlog.nvim
      ./plugins/someone-stole-my-name/yaml-companion.nvim
      ./plugins/RRethy/vim-illuminate
      ./plugins/sudormrfbin/cheatsheet.nvim
      ./plugins/SchemaStore/schemastore
      ./plugins/pwntester/octo.nvim
      ./plugins/phaazon/hop.nvim
      ./plugins/ojroques/nvim-lspfuzzy
      ./plugins/onsails/lspkind.nvim
      ./plugins/nvim-telescope/telescope-project.nvim
      ./plugins/nvim-neorocks/luarocks-tag-release
      ./plugins/simrat39/symbols-outline.nvim
      ./plugins/smjonas/inc-rename.nvim
      ./plugins/nvim-neotest/neotest
      ./plugins/nvim-neotest/neotest-python
      ./plugins/nvim-neotest/neotest-plenary
      ./plugins/nvim-neotest/neotest-jest
      ./plugins/nvim-neotest/neotest-go
      ./plugins/rouge8/neotest-rust
      ./plugins/stevearc/overseer.nvim
      ./plugins/aserowy/tmux.nvim
      ./plugins/frabjous/knap
      ./plugins/glepnir/lspsaga.nvim
      ./plugins/gnikdroy/projections.nvim
      ./plugins/glepnir/dashboard-nvim
      ./plugins/gennaro-tedesco/nvim-possession
      ./plugins/esensar/nvim-dev-container
      ./plugins/bennypowers/nvim-regexplainer
      ./plugins/nvim-telescope/telescope-dap.nvim
      ./plugins/nvim-telescope/telescope-z.nvim
      ./plugins/theHamsta/nvim-dap-virtual-text
      ./plugins/nvim-treesitter/nvim-treesitter
      ./plugins/nvim-treesitter/nvim-treesitter-textobjects
      ./plugins/nvim-treesitter/nvim-treesitter-refactor
      ./plugins/t3rro/nvim-ts-rainbow
      ./plugins/wellle/targets.vim
      ./plugins/amrbashir/nvim-docs-view
      ./plugins/norcalli/nvim-colorizer.lua
      ./plugins/nvim-tree/nvim-web-devicons
      ./plugins/nfrid/markdown-togglecheck
      ./plugins/jose-elias-alvarez/typescript.nvim
      ./plugins/akinsho/git-conflict.nvim
      ./plugins/niuiic/divider.nvim
      ./plugins/simrat39/rust-tools.nvim
      ./plugins/williamboman/mason.nvim
      ./plugins/williamboman/mason-lspconfig.nvim
      ./plugins/mfussenegger/nvim-jdtls
      ./plugins/nvim-orgmode/orgmode
      ./plugins/suketa/nvim-dap-ruby
      ./plugins/ray-x/cmp-treesitter
      ./plugins/ray-x/navigator.lua
      ./plugins/rcarriga/nvim-dap-ui
      ./plugins/hrsh7th/cmp-nvim-lsp
      ./plugins/ray-x/lsp_signature
      ./plugins/hrsh7th/cmp-cmdline
      ./plugins/lewis6991/impatient
      ./plugins/nvim-lua/popup.nvim
      ./plugins/hrsh7th/cmp-buffer
      ./plugins/tpope/vim-fugitive
      ./plugins/tpope/vim-repeat
      ./plugins/lewis6991/gitsigns.nvim
      ./plugins/lotabout/skim
      ./plugins/p00f/cphelper.nvim
      ./plugins/camspiers/animate
      ./plugins/tpope/vim-rhubarb
      ./plugins/folke/noice.nvim
      ./plugins/folke/which-key.nvim
      ./plugins/f-person/git-blame.nvim
      ./plugins/hrsh7th/cmp-path
      ./plugins/numToStr/Navigator.nvim
      ./plugins/sar/cmp-lsp.nvim
      ./plugins/shaunsingh/nord
      ./plugins/camspiers/lens
      ./plugins/LnL7/vim-nix
      ./plugins/cbochs/grapple.nvim
      ./plugins/declancm/cinnamon.nvim
      ./plugins/cuducos/yaml.nvim
      ./plugins/drybalka/tree-climber.nvim
      ./plugins/chrisgrieser/nvim-various-textobjs
      ./plugins/ggandor/leap.nvim
      ./plugins/ibhagwan/fzf-lua
      ./plugins/gwatcha/reaper-keys
      ./plugins/idanarye/nvim-buffls
      ./plugins/ldelossa/gh.nvim
      ./plugins/ldelossa/litee.nvim
      ./plugins/jubnzv/mdeval.nvim
      ./plugins/jbyuki/one-small-step-for-vimkind
      ./plugins/danielpieper/telescope-tmuxinator.nvim
      ./plugins/jghauser/follow-md-links.nvim
      ./plugins/kkharji/sqlite.lua
      ./plugins/kosayoda/nvim-lightbulb
      ./plugins/LeonHeidelbach/trailblazer.nvim
      ./plugins/LudoPinelli/comment-box.nvim
      ./plugins/madskjeldgaard/reaper-nvim
      ./plugins/MarcHamamji/runner.nvim
      ./plugins/mfussenegger/nvim-lint
      ./plugins/michaelb/sniprun
      ./plugins/mrjones2014/legendary.nvim
      ./plugins/ms-jpq/chadtree
      ./plugins/MunifTanjim/nui.nvim
      ./plugins/nanotee/nvim-lsp-basics
      ./plugins/nanotee/nvim-lua-guide
      ./plugins/NTBBloodbath/galaxyline.nvim
      ./plugins/NTBBloodbath/rest.nvim
      ./plugins/nvim-lua/lsp-status.nvim
      ./plugins/nvim-neorg/neorg
      ./plugins/rafcamlet/nvim-luapad
      ./plugins/rafcamlet/tabline-framework.nvim
      ./plugins/rest-nvim/rest.nvim
      ./plugins/RishabhRD/nvim-lsputils
      ./plugins/Wansmer/treesj
      ./plugins/windwp/nvim-projectconfig
      ./plugins/windwp/nvim-ts-autotag
      ./plugins/yamatsum/nvim-nonicons
      ./plugins/zbirenbaum/copilot.lua
      ./plugins/zbirenbaum/copilot-cmp
      ./plugins/ziontee113/icon-picker.nvim
      ./plugins/EtiamNullam/relative-source.nvim
      ./plugins/ellisonleao/glow.nvim
      ./plugins/andymass/vim-matchup
      ./plugins/chaoren/vim-wordmotion
      ./plugins/unblevable/quick-scope
      ./plugins/L3MON4D3/LuaSnip
      ./plugins/rafamadriz/friendly-snippets
    ];

  options = {
    blackmatter = {
      programs = {
        nvim.enable = mkEnableOption "nvim";
        nvim.package = mkOption {
          type = types.package;
          default = pkgs.neovim-unwrapped;
          description = lib.mdDoc "neovim package/derivation";
        };
      };
    };
  };

  config = mkMerge [
    (mkIf cfg.enable {
      home.packages = [ cfg.package ];
      xdg.configFile."nvim".source = ./conf;
      blackmatter = { programs = { nvim = { plugins = plugins.toggles; }; }; };
    })
  ];
}
