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
in
{
  keymaps = [
    (imap "<Esc>" "jj")
    (nmap "<C-w>h" "<C-h>")
    (nmap "<C-w>j" "<C-j>")
    (nmap "<C-w>k" "<C-k>")
    (nmap "<C-w>l" "<C-l>")
    (nmap "<cmd>vertical resize -2<cr>" "<C-left>")
    (nmap "<cmd>vertical resize +2<cr>" "<C-right>")
    (nmap "<cmd>vsplit<cr>" "sv")
    (nmap "<cmd>split<cr>" "sh")
    (nmap "<cmd>close<cr>" "q")
    (nmap "<cmd>bd<cr>" "bd")
    (nmap { __raw = "require('conform').format"; } "<leader>cf")
    (nmap { __raw = "require('flash').jump"; } "f")
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
    (nmap "<cmd>Lspsaga term_toggle<cr>" "<C-/>")
    (tmap "<cmd>Lspsaga term_toggle<cr>" "<C-/>")
  ];
}
