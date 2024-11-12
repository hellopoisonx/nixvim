{ ... }:
let
  nmap =
    action:
    (key: {
      inherit action;
      inherit key;
      mode = "n";
    });
  tmap =
    action:
    (key: {
      inherit action;
      inherit key;
      mode = "t";
    });
  imap =
    action:
    (key: {
      inherit action;
      inherit key;
      mode = "i";
    });
  vmap =
    action:
    (key: {
      inherit action;
      inherit key;
      mode = "v";
    });
in
{
  keymaps = [
    (imap "<Esc>" "jj")

    (nmap "<cmd>bnext<cr>" "L")
    (nmap "<cmd>bprev<cr>" "H")

    (nmap "<cmd>vertical resize -2<cr>" "<C-left>")
    (nmap "<cmd>vertical resize +2<cr>" "<C-right>")
    (nmap "<cmd>vsplit<cr>" "sv")
    (nmap "<cmd>split<cr>" "sh")
    (nmap "<cmd>close<cr>" "q")
    (nmap "<cmd>bd<cr>" "bd")
    (nmap { __raw = "require('conform').format"; } "<leader>cf")

    (nmap { __raw = "require('flash').jump"; } "f")
    (vmap { __raw = "require('flash').jump"; } "f")

    (nmap "<cmd>Lspsaga rename<cr>" "cr")
    (nmap "<cmd>Lspsaga hover_doc<cr>" "K")
    (nmap "<cmd>Lspsaga finder imp<cr>" "gI")
    (nmap "<cmd>Lspsaga peek_definition<cr>" "gD")
    (nmap "<cmd>Lspsaga peek_type_definition<cr>" "gT")
    (nmap "<cmd>Lspsaga diagnostic_jump_next<cr>" "]d")
    (nmap "<cmd>Lspsaga diagnostic_jump_prev<cr>" "[d")
    (nmap "<cmd>Lspsaga finder ref<cr>" "gr")
    (nmap "<cmd>Lspsaga outline<cr>" "<leader>o")
    (nmap "<cmd>Lspsaga code_action<cr>" "<leader>ca")

    (tmap "<C-\\><C-n>" "<ESC>")
    (nmap "<cmd>terminal<cr>" "<leader>t")
    (nmap "<cmd>Lspsaga term_toggle<cr>" "<leader>ft")
    (tmap "<cmd>Lspsaga term_toggle<cr>" "<leader>ft")

    (tmap "<C-\\><C-N><C-w>h" "<A-h>")
    (tmap "<C-\\><C-N><C-w>j" "<A-j>")
    (tmap "<C-\\><C-N><C-w>k" "<A-k>")
    (tmap "<C-\\><C-N><C-w>l" "<A-l>")
    (imap "<C-\\><C-N><C-w>h" "<A-h>")
    (imap "<C-\\><C-N><C-w>j" "<A-j>")
    (imap "<C-\\><C-N><C-w>k" "<A-k>")
    (imap "<C-\\><C-N><C-w>l" "<A-l>")
    (nmap "<C-w>h" "<A-h>")
    (nmap "<C-w>j" "<A-j>")
    (nmap "<C-w>k" "<A-k>")
    (nmap "<C-w>l" "<A-l>")
  ];
}
