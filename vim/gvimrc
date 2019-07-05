if has("gui_running")
   " Command-T for CommandT
   macmenu &File.New\ Tab key=<nop>
   map <D-t> :CommandT<CR>
	
   " Generate uuid in insert mode with command-g
   macmenu &Edit.Find.Find\ Next key=<nop>
   let loweruuid = "uuidgen | tr [:upper:] [:lower:] | tr -d '\n'"
   imap <D-g> <c-r>=system(loweruuid)<CR>

   " Turn off menu
   set guioptions=-t

   " Set some ridiculous sizes for defaults
   " so that it maximizes macvim on launch
   set lines=400
   set columns=400
endif
