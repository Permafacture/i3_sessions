Session environments for i3
=======================
For collecting bash, vim, ipython and other sessions into 
projects, and loading them through i3 hotkeys, dmenu, etc.

Install
-----------------
Note: Sessions are saved as directories in $HOME/utils/sessions/

Put all files in the folder $HOME/utils/sessions

Put executables in path.  Bash command to do so:
  $ for x in start_session sessionized_bash vimstart project_launcher; do sudo ln -s $HOME/utils/sessions/$x /usr/bin/$x; done
  ##TODO `chmod +x $x` also?


Usage
-----------------

    $ start_session my_session_name

This brings up vim with a file where you can put your setup 
commands. For instance, cd to the directory you want to work 
in or source a virtualenv.

After saving that

    $ project_launcher

This launches dmenu with all of the sessions that have been 
created.  Choosing an option writes to sessionvar.sh which 
sets the environment variable $PATHTOSESSION which 
sessionized_bash imports.

    $ sessionized_bash git clone https://balh/balh.git

Regardless of where you are, sessionized_bash will execute
something after running the setup commands, so this 
repository will be cloned into the main directory of
the session. 

change .i3/config 
------------------

**launch a sessionless terminal**

    bindsym $mod+Return exec i3-sensible-terminal

**launch the session chooser**

    bindsym $mod+Ctrl+d exec project_launcher

**sessionized_bash will execute whatever you give it as an argument**

    bindsym $mod+i exec i3-sensible-terminal -e bash -c "sessionized_bash ipython"

**Vim requires a special envocation**

    bindsym $mod+u exec i3-sensible-terminal -e bash -c "vimstart"

**When launching an interactive bash session, sessionized_bash is the rcfile**

    bindsym $mod+t exec i3-sensible-terminal -e bash --rcfile /usr/bin/sessionized_bash

**keep track of current session on the status bar**

    bar {
            status_command i3status | ~/utils/sessions/jsonstatus.py
        }
