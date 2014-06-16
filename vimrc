"export PATHTOSESSION in the .bashrc of the shell that spawns this

"load gloabl and user vimrcs also 
let $G_VIMRC = $VIM . "/vimrc"
source $G_VIMRC

let $MYVIMRC = $HOME . "/.vimrc"
source $MYVIMRC


function! MakeSession()
  if (filewritable($PATHTOSESSION) != 2)
    exe 'silent !mkdir -p ' . $PATHTOSESSION
    redraw!
  endif
  exe "mksession! " . $PATHTOSESSION . '/session.vim'

endfunction

function! LoadSession()
  let sessionfile = $PATHTOSESSION . "/session.vim"
  if (filereadable(sessionfile))
    
    exe 'source ' . sessionfile
    echo 'Loaded :'. sessionfile
  else
    echo 'Could no load: ' . sessionfile
  endif
endfunction
au VimEnter * nested :call LoadSession()
au VimLeave * :call MakeSession()

