{ helpers, ... }: {
  globals.mapleader = " ";
  keymaps = [
    # (helpers.mkKeymap "n" "<leader>L" "<CMD>Lazy<CR>" "Open Lazy")
    
    # general utilities
    (helpers.mkKeymap "n" "<Esc>" "<CMD>nohlsearch<CR>" "Clear search highlighting")
    (helpers.mkKeymap "n" "<leader>w" "<CMD>w<CR>" "Write Current Buffer")
    (helpers.mkKeymap "n" "<leader>q" "<CMD>q<CR>" "Quit Current Buffer")
    
    # window management
    (helpers.mkKeymap "n" "<leader>sv" "<CMD>vsplit<CR>" "New Vertical Window")
    (helpers.mkKeymap "n" "<leader>sh" "<CMD>split<CR>" "New Horizontal Window")

    # window resizing
    (helpers.mkKeymap "n" "<A-Left>" "<C-w><" "Resize Window W+")
    (helpers.mkKeymap "n" "<A-Right>" "<C-w>>" "Resize Window W-")
    (helpers.mkKeymap "n" "<A-Up>" "<C-w>-" "Resize Window H+")
    (helpers.mkKeymap "n" "<A-Down>" "<C-w>+" "Resize Window H-")
  ];
}

