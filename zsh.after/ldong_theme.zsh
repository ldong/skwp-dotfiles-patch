# ============================ Theme ===========================================
# Set the colors to your liking
local vi_normal_marker="%{$fg[green]%}%BN%b%{$reset_color%}"
local vi_insert_marker="%{$fg[cyan]%}%BI%b%{$reset_color%}"
local vi_unknown_marker="%{$fg[red]%}%BU%b%{$reset_color%}"
local vi_mode="$vi_insert_marker"
vi_mode_indicator () {
  case ${KEYMAP} in
    (vicmd)      echo $vi_normal_marker ;;
    (main|viins) echo $vi_insert_marker ;;
    (*)          echo $vi_unknown_marker ;;
  esac
}

# ZSH theme
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}➦ %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%}◒ "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"

local return_code="%(?..%{$fg[red]%}%? %{$reset_color%})"
# local PROMPT='%F{green}➜ %2c%F{blue} [%f '
local RPROMPT='$(git_prompt_info) %F{blue}] %F{gray}${vi_mode} %F{green}%D{%L:%M} %F{yellow}%D{%p}%f'

# ▶ ✹ ✭ ➜
if [ "$USER" '==' "vagrant" ]; then
  PROMPT='%F{green}➜ %2c%F{blue} [%f '
else
  PROMPT='%F{green} %2c%F{blue} [%f '
fi

# SVN
# ZSH_THEME_SVN_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
# ZSH_THEME_SVN_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[red]%} ✘ %{$reset_color%}"
# ZSH_THEME_SVN_PROMPT_CLEAN=" "

if [ -f ~/.zsh/zsh-vcs-prompt/zshrc.sh ]; then
  source ~/.zsh/zsh-vcs-prompt/zshrc.sh
  # ZSH_VCS_PROMPT_USING_PYTHON='false'
  ZSH_VCS_PROMPT_ENABLE_CACHING='true'
  RPROMPT='$(vcs_super_info)$(git_prompt_info) %F{blue}] %F{gray}${vi_mode} %F{green}%D{%L:%M} %F{yellow}%D{%p}%f'
fi

