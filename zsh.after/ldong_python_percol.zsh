# ========================= Percol Only =======================
# Python 2.7
# sudo apt-get install python-setuptools
# sudo easy_install pip
# sudo pip install percol
# =============================================================
alias show_process="ps aux | percol | awk '{ print $2 }'"
alias kill_process="ps aux | percol | awk '{ print $2 }' | xargs kill"

# Interactive pgrep / pkill
function ppgrep() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
}

function ppkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""            # options only
    else
        QUERY=$1            # with a query
        [[ $# > 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
}
# zsh history search
function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi


# ZLE key binding
# http://www.cs.elte.hu/zsh-manual/zsh_14.html
# http://zsh.sourceforge.net/Guide/zshguide04.html
bindkey -v
bindkey -M viins 'JJ' vi-cmd-mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '??' history-incremental-search-forward
bindkey -M vicmd 'H' percol_select_history

# do history expansion on space
bindkey " " magic-space

# Search for history key bindings
# ctrl+v UP
#bindkey "^[OA" up-line-or-history
# ctrl+v DOWN
#bindkey "^[OB" down-line-or-history
# bindkey "^[[A" up-line-or-history
# bindkey "^[[B" down-line-or-history
# bindkey "^R" history-incremental-search-backward

# Tetris
# autoload -U tetris
# zle -N tetris
# bindkey ^T tetris

# Seach file in vim CtrlP
ctrlp() {
  </dev/tty vim -c 'Unite file_rec/async'
}
zle -N ctrlp
bindkey "^p" ctrlp


# Edit command in vim ctrl-e
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# works without vim mode
#autoload -U up-line-or-beginning-search
#autoload -U down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#bindkey "^[[A" up-line-or-beginning-search # Up
#bindkey "^[[B" down-line-or-beginning-search # Down


# You may already have those in your .zshrc somewhere
# autoload -U promptinit && promptinit
# autoload -U colors     && colors
# setopt prompt_subst
#
# Reset mode-marker and prompt whenever the keymap changes
function zle-line-init zle-keymap-select {
  vi_mode="$(vi_mode_indicator)"
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Multiline-prompts don't quite work with reset-prompt; we work around this by
# printing the first line(s) via a precmd which is executed before the prompt
# is printed.  The following can be integrated into PROMPT for single-line
# prompts.

# local user_host='%B%n%b@%m'
# local current_dir='%~'
# precmd () print -rP "${user_host} ${current_dir}"



# completer widget that sets a flag for the duration of
# the completion so the SIGINT handler knows whether completion
# is active. It would be better if we could check some internal
# zsh parameter to determine if completion is running, but as
# far as I'm aware that isn't possible.
function interruptible-expand-or-complete {
    COMPLETION_ACTIVE=1

    # Bonus feature: automatically interrupt completion
    # after a three second timeout.
    # ( sleep 3; kill -INT $$ ) &!

    zle expand-or-complete

    COMPLETION_ACTIVE=0
}

# Bind our completer widget to tab.
zle -N interruptible-expand-or-complete
bindkey '^I' interruptible-expand-or-complete

# Interrupt only if completion is active.
function TRAPINT {
    if [[ $COMPLETION_ACTIVE == 1 ]]; then
        COMPLETION_ACTIVE=0
        zle -M "Completion canceled."

        # Returning non-zero tells zsh to handle SIGINT,
        # which will interrupt the completion function.
        return 1
    else
        # Returning zero tells zsh that we handled SIGINT;
        # don't interrupt whatever is currently running.
        return 0
    fi
}


