PROMPT=' ${return_status} %{$fg[blue]%}$(get_pwd)%{$reset_color%} $(git_prompt_info)${prompt_suffix}'

local return_status="%(?:%{$fg[yellow]%}↯ %{$fg_bold[green]%}$USER:%{$fg_bold[red]%}!)"

local prompt_suffix="%{$fg[magenta]%}➜ %{$reset_color%}"

# by faycito (https://github.com/faycito)
function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}



ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}| "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[magenta]%}|changes ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔ all updated "

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} ✱%{$reset_color%}"