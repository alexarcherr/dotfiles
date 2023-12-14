# Get External IP / Internet Speed
alias myip="curl https://ipinfo.io/json" # or /ip for plain-text ip
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"

# Quickly serve the current directory as HTTP
alias rubyserve='ruby -run -e httpd . -p 8000'          # Or python -m SimpleHTTPServer :)
alias phpserve='php -S localhost:8000 -t .'             # Simple PHP development server 
alias pyserve='python -m http.server --directory .'     # Simple Python develipment server

alias reload!='RELOAD=1 source ~/.zshrc'		# reload zsh config

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # macOS `ls`
    colorflag="-G"
fi

# use nvim, but don't make me think about it
if [[ -n "$(command -v nvim)" ]]; then
    alias vim="nvim"
    alias vimu="nvim +PlugUpdate +PlugUpgrade"
    alias vimg="nvim +Ge:"
fi

# Filesystem aliases
alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ....="cd ../../..;pwd"
alias .....="cd ../../../..;pwd"

alias l="ls -lah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete" # This alias will find and delete all ".DS_Store" files in the current directory and all subdirectories.

# remove broken symlinks
alias clsym="find -L . -name . -o -type d -prune -o -type l -exec rm {} +"

# git aliases
#alias gs='git s' mc_print_command_buffer () { printf "%s\\n" "$BUFFER" >&10;  }
# zle -N mc_print_command_buffer
#  bindkey '^[_' mc_print_command_buffer
#   mc_print_cursor_position () { echo $CURSOR >&10 }
#    zle -N mc_print_cursor_position
#     bindkey '^[+' mc_print_cursor_position
#      _mc_precmd(){ pwd>&8;kill -STOP $$  }; precmd_functions+=(_mc_precmd)
#      PS1='%n@%m:%~%# '
#      ']']'
#alias glog="git l"

# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'

alias lpath='echo $PATH | tr ":" "\n"' # list the PATH separated by new lines

alias nr="npm run"

alias cls='clear' 		# Good 'ol Clear Screen command


# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='safe-rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'


alias lr='ls -ltr' # This will show all files sorted by modification date, the most recent first.
alias backup='tar -zcvf $(date +%Y%m%d).tar.gz *' # This creates a tarball of the current directory, compressed with gzip, with the filename in the format 'yyyymmdd.tar.gz'.
alias path='echo -e ${PATH//:/\\n}' # This shows all directories in the PATH variable, one per line.
alias du1='du -h -d 1' # This shows the size of the current directory and its subdirectories in human-readable format
alias today='date +"%A, %B %d, %Y"' # This shows the current date in the format of "Day of the week, Month Day, Year"
alias to='function _to() { cd "$@" && tree; }; _to' # This allows you to navigate to a directory and list the files in it with a single command and also show the directory tree

# Mac-specific
alias flushdns='function _flushdns() { sudo dscacheutil -flushcache; }; _flushdns' # This flushes the DNS cache
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
