setopt prompt_subst

###########################################################
SEGMENT_SEPARATOR="\ue0b0"

TRAPWINCH() {
    zle && zle -R
    }

###########################################################
# Modify Git prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%F{#ffd700} on git branch (%f"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{#ffd700})%f"
ZSH_THEME_GIT_PROMPT_SEPARATOR="%F{#ffd700}|%f"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{!%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"

###########################################################
# return code
local return_code="%(?.%F{green}ok%f.%F{red}error: %?%f)"

###########################################################
# user and host
local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{#ffd700}%n%f'
  PR_USER_OP='%F{#ffd700}%#%f'
  PR_PROMPT='%F{#ffd700}➤ %f'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}➤ %f'
fi

# get host info
# %m : only host name
# %M : fully qualified host name
# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M (SSH)%f' # SSH
else
  PR_HOST='%F{#ffd700}%m%f' # no SSH
fi

###########################################################
local user_host="%K{black}${PR_USER}%F{cyan}@%f${PR_HOST}%k"
local segment_dir=' %F{#ffd700}$(print -P "\u21e8")%f '
local current_dir="%F{cyan}%~%f%F{blue}%f"
local git_branch='$(git_super_status)'
local prompt_time='%F{cyan}%*%f'

###########################################################
# Prompt format
PROMPT="%F{#ffd700}╭──%f ${user_host} ${segment_dir} %F{default}% ${current_dir}${git_branch} %f
%F{#ffd700}╰─%f${PR_PROMPT}%f%F{default}"
RPROMPT="%F{#ffd700}|%f ${return_code} %F{#ffd700}|%f"
