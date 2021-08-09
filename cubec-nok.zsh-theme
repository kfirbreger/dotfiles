# VCS
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable hg git svn
zstyle ':vcs_info:(hg*|git*):*' get-revision true
zstyle ':vcs_info:hg*:*' get-bookmarks true
zstyle ':vcs_info:hg*:*' branchformat "%b" # only show branch
# Mercurial show branch and bookmakr
zstyle ':vcs_info:hg*' formats "[%b %m]"
zstyle ':vcs_info:hg*' actionformats "[%b %m]"
# Git show branch
zstyle ':vcs_info:git*' formats "[%b]"
zstyle ':vcs_info:git*' actionformats "[%b]"

#zstyle ':vcs_info:(hg*|git*):*' check-for-changes true
#zstyle ':vcs_info:hg*:netbeans' use-simple true
#zstyle ':vcs_info:hg*:*' get-unapplied true
#zstyle ':vcs_info:hg*:*' patch-format "mq(%g):%n/%c %p"
#zstyle ':vcs_info:hg*:*' nopatch-format "mq(%g):%n/%c %p"

#zstyle ':vcs_info:hg*:*' unstagedstr "+"
#zstyle ':vcs_info:hg*:*' hgrevformat "%r" # only show local rev.


prompt_char() {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '$'
}
vcs_info_wrapper() {
    vcs_info
    if [ -n "$vcs_info_msg_0_" ]; then
        echo "${vcs_info_msg_0_}"
    fi
}
#---------------------------------------------------------------------

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} $(vcs_info_wrapper)$(prompt_char) '
