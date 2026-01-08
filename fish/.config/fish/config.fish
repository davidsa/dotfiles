set EDITOR "nvim"
set -U fish_greeting

set SPACEFISH_TIME_SHOW false
set SPACEFISH_USER_SHOW always
set SPACEFISH_PACKAGE_SHOW false	
set SPACEFISH_DIR_PREFIX ""
set SPACEFISH_PROMPT_SEPARATE_LINE false
set SPACEFISH_GIT_BRANCH_COLOR 957FB8
set SPACEFISH_DOCKER_SHOW false
set SPACEFISH_GIT_PREFIX ""
set SPACEFISH_DOCKER_SHOW false

# Prompt ColorsFF9E64
set SPACEFISH_USER_COLOR D27E99
set SPACEFISH_DIR_COLOR 7AA89F
set SPACEFISH_GIT_STATUS_COLOR FF9E64

alias vim='nvim'
alias cd='z'
alias gs='git status'
alias ga='git add .'
alias gb='git switch -f (git branch | fzf | string trim)'
alias gp='git push'
alias gl='git pull'
alias gmt="git mergetool"
alias gdb='git branch --merged | egrep -v "(^\*|main|dev)" | xargs git branch -d'
alias grh='git reset --hard'
alias tls='tmux ls'
alias tn='tmux new -s (basename "$PWD")'
alias cl='clear'

alias tn='tmux new -s (basename "$PWD")'

alias ws='cd ~/workspace'
alias dotfiles='cd ~/dotfiles'
alias dps='docker ps -a'
alias dcps='docker-compose ps'
alias di='docker images'
alias dip='docker image prune'

alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias ld="lazydocker"

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# Replace ls with eza
function ls
    eza --group-directories-first --icons $argv
end

function l
    eza --group-directories-first --icons -1 $argv
end

# Common shortcuts
function ll
    eza -l --group-directories-first --icons $argv
end

function la
    eza -la --group-directories-first --icons $argv
end

function tree
    eza --tree --level=2 --icons $argv
end

function pj
    # Use fzf to select a directory from ~/workspace excluding node_modules
    set dir (find ~/workspace -type d -not -path "*/node_modules/*" -maxdepth 1 | fzf)

    # Extract directory name as session name (for simplicity)
    set session_name (basename $dir)

    # Check if you are already inside a tmux session
    if test -n "$TMUX"
        # Inside tmux: check if session exists
        tmux has-session -t $session_name 2>/dev/null
        if test $status -eq 0
            # Switch to existing session if it exists
            tmux switch-client -t $session_name
        else
            # Create a new session within the current tmux server
            tmux new-session -d -s $session_name -c $dir
            tmux switch-client -t $session_name
        end
    else
        # Outside tmux: check if session exists
        tmux has-session -t $session_name 2>/dev/null
        if test $status -eq 0
            # Attach to existing session if it exists
            tmux attach-session -t $session_name
        else
            # Create new tmux session and start in the selected directory
            tmux new-session -s $session_name -c $dir
        end
    end
end

function trr-pj
    # Use fzf to select a directory from ~/workspace excluding node_modules
    set dir ~/workspace/trr-compose
    set name (find ~/workspace/trr-compose/apps -type d -not -path "*/node_modules/*" -maxdepth 1 | fzf)

    # Extract directory name as session name (for simplicity)
    set session_name (basename $name)

    # Check if you are already inside a tmux session
    if test -n "$TMUX"
        # Inside tmux: check if session exists
        tmux has-session -t $session_name 2>/dev/null
        if test $status -eq 0
            # Switch to existing session if it exists
            tmux switch-client -t $session_name
        else
            # Create a new session within the current tmux server
            tmux new-session -d -s $session_name -c $name
            tmux new-window -t $session_name: -c $dir 
            tmux switch-client -t $session_name
        end
    else
        # Outside tmux: check if session exists
        tmux has-session -t $session_name 2>/dev/null
        if test $status -eq 0
            # Attach to existing session if it exists
            tmux attach-session -t $session_name
        else
            # Create new tmux session and start in the selected directory
            tmux new-session -d -s $session_name -c $name
            tmux new-window -t $session_name: -c $dir 
        end
    end
end

function t
  tmux $argv
end

function gcm
  git commit -m "$argv"
end

function dc
  docker-compose -f docker-compose-arm64.yml $argv
end

function drm
  docker rm $argv
end

function drmi
  docker rmi $argv
end

function gc
  git checkout $argv
end

function gsf
  git switch -f $argv
end

function dex
  docker exec -it $argv bash
end

function killport
  lsof -t -i :$argv | xargs kill -9
end

function cdwhich
  cd (dirname (which $argv))
end

function mux
  tmuxinator $argv
end 

zoxide init fish | source
