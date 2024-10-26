{
  autoCmd = [
    {
      command = "set nofoldenable";
      desc = "Disable folding entering the buffer";
      once = true;
      event = [
        "BufEnter"
        "BufWinEnter"
      ];
    }
    {
      command = "TSEnable highlight";
      desc = "Start Treesitter highlight";
      once = true;
      event = [
        "BufEnter"
        "BufWinEnter"
      ];
    }
  ];
}
