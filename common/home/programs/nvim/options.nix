{ pkgs, ... }:

{
  programs.nixvim = {
    clipboard = {
      # Use system clipboard
      register = "unnamedplus";
      providers.wl-copy = {
        enable = true;
        package = pkgs.wl-clipboard;
      };
    };

    performance = {
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        configs = true;
        plugins = true;
      };
    };

    globals = {
      # Custom for toggles
      disable_diagnostics = false;
      disable_autoformat = false;
      spell_enabled = true;
      colorizing_enabled = 1;
      first_buffer_opened = false;
    };

    luaLoader.enable = true;

    opts = {
      updatetime = 50;

      number = true; # Display the absolute line number of the current line
      hidden = true; # Keep closed buffer open in the background
      mouse = "a"; # Enable mouse control
      mousemodel = "extend"; # Mouse right-click extends the current selection
      splitbelow = true; # A new window is put below the current one
      splitright = true; # A new window is put right of the current one

      swapfile = false; # Disable the swap file
      undofile = true; # Automatically save and restore undo history
      incsearch = true; # Incremental search: show match for partly typed search command
      ignorecase = true; # When the search query is lower-case, match both lower and upper-case patterns
      smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper case characters
      cursorline = true; # Highlight the screen line of the cursor
      signcolumn = "yes"; # Whether to show the signcolumn
      colorcolumn = "100"; # Columns to highlight
      laststatus = 3; # When to use a status line for the last window
      fileencoding = "utf-8"; # File-content encoding for the current buffer
      termguicolors = true; # Enables 24-bit RGB color in the |TUI|
      spelllang = [
        "en_us"
        "pl"
      ]; # Spell check languages
      spell = false; # Highlight spelling mistakes (local to window)
      wrap = false; # Prevent text from wrapping

      # Tab options
      tabstop = 2; # Number of spaces a <Tab> in the text stands for (local to buffer)
      shiftwidth = 2; # Number of spaces used for each step of (auto)indent (local to buffer)
      softtabstop = 0; # If non-zero, number of spaces to insert for a <Tab> (local to buffer)
      expandtab = true; # Expand <Tab> to spaces in Insert mode (local to buffer)

      # Do clever autoindenting
      autoindent = true;
      smartindent = true;
      breakindent = true;
      preserveindent = true;
      copyindent = true;

      textwidth = 0; # Maximum width of text that is being inserted.  A longer line will be broken after white space to get this width.

      # Folding
      foldlevel = 99; # Folds with a level higher than this number will be closed
      foldcolumn = "1";
      foldenable = true;
      foldlevelstart = -1;
      fillchars = {
        horiz = "━";
        horizup = "┻";
        horizdown = "┳";
        vert = "┃";
        vertleft = "┫";
        vertright = "┣";
        verthoriz = "╋";

        eob = " ";
        diff = "╱";

        fold = " ";
        foldopen = "";
        foldclose = "";

        msgsep = "‾";
      };

      showmatch = true; # when closing a bracket, briefly flash the matching one
      matchtime = 1; # duration of that flashing n deci-seconds
      startofline = true; # motions like "G" also move to the first char
      cmdheight = 0;
      hlsearch = false;
      infercase = true;
      linebreak = true;
      pumheight = 10;
      showtabline = 2;
      title = true;
      virtualedit = "block";
      wildmode = "list:longest";
      completeopt = [
        "menuone"
        "noinsert"
        "noselect"
        "preview"
      ];
      scrolloff = 8;

      conceallevel = 3;
    };
    extraConfigLua = "vim.o.breakindentopt = \"shift:2\""; # vim.opt doesn't work for this setting
  };
}
