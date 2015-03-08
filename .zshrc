HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_DUPS
setopt autocd extendedglob nomatch notify
setopt inc_append_history
setopt share_history
setopt IGNORE_EOF
setopt RM_STAR_WAIT
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
bindkey -v
autoload -U colors && colors
#PROMPT="%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[yellow]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%"
LESSSECURE=1
export LESSSECURE
export EDITOR="vim"

autoload -U promptinit
promptinit
autoload -Uz compinit
compinit
autoload -U zcalc zsh-mime-setup
zsh-mime-setup
 bindkey "\e[1~" beginning-of-line
 bindkey "\e[4~" end-of-line
 bindkey "\e[5~" beginning-of-history
 bindkey "\e[6~" end-of-history
 bindkey "\e[3~" delete-char
 bindkey "\e[2~" quoted-insert
 bindkey "\e[5C" forward-word
 bindkey "\eOc" emacs-forward-word
 bindkey "\e[5D" backward-word
 bindkey "\eOd" emacs-backward-word
 bindkey "\ee[C" forward-word
 bindkey "\ee[D" backward-word
 bindkey "^H" backward-delete-word
 bindkey "\e[8~" end-of-line
 bindkey "\e[7~" beginning-of-line
 bindkey "eOH" beginning-of-line
 bindkey "eOF" end-of-line
 bindkey "\e[H" beginning-of-line
 bindkey "\e[F" end-of-line
 bindkey '^i' expand-or-complete-prefix
 alias ll='ls -al'
 alias mv='mv -i'
 alias cp='cp -R'
 alias rm='rm -i'
#{{{ Completion Stuff
#
#bindkey -M viins '\C-i' complete-word
#
## Faster! (?)
zstyle ':completion::complete:*' use-cache 1
#
## case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete
zstyle ':completion:*' completer _expand _force_rehash _complete _approximate _ignored
#
## generate descriptions with magic.
zstyle ':completion:*' auto-description 'specify: %d'
#
## Don't prompt for a huge list, page it!
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
#
## Don't prompt for a huge list, menu it!
zstyle ':completion:*:default' menu 'select=0'
#
## Have the newer files last so I see them first
zstyle ':completion:*' file-sort modification reverse
#
## color code completion!!!!  Wohoo!
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
#
#unsetopt LIST_AMBIGUOUS
#setopt  COMPLETE_IN_WORD
#
## Separate man page sections.  Neat.
zstyle ':completion:*:manuals' separate-sections true
#
## Egomaniac!
zstyle ':completion:*' list-separator 'fREW'
#
## complete with a menu for xwindow ids
zstyle ':completion:*:windows' menu on=0
zstyle ':completion:*:expand:*' tag-order all-expansions
#
## more errors allowed for large words and fewer for small words
zstyle ':completion:*:approximate:*' max-errors 'reply=(  $((  ($#PREFIX+$#SUFFIX)/3  ))  )'
#
## Errors format
zstyle ':completion:*:corrections' format '%B%d (errors %e)%b'
#
## Don't complete stuff already on the line
zstyle ':completion::*:(rm|vi):*' ignore-line true
#
## Don't complete directory we are already in (../here)
zstyle ':completion:*' ignore-parents parent pwd
#
zstyle ':completion::approximate*:*' prefix-needed false
#
##}}}




_force_rehash() {
      (( CURRENT == 1 )) && rehash
        return 1  # Because we didn't really complete anything
    }

#{{{ Prompt!
#
host_color=yellow
history_color=cyan
user_color=green
root_color=red
directory_color=magenta
error_color=red
jobs_color=green
#
host_prompt="%{$fg[$host_color]%}%m%{$reset_color%}"
#
jobs_prompt1="%{$fg_bold[$jobs_color]%}(%{$reset_color%}"
#
jobs_prompt2="%{$fg[$jobs_color]%}%j%{$reset_color%}"
#
jobs_prompt3="%{$fg_bold[$jobs_color]%})%{$reset_color%}"
#
jobs_total="%(1j.${jobs_prompt1}${jobs_prompt2}${jobs_prompt3} .)"
#
history_prompt1="%{$fg_bold[$history_color]%}[%{$reset_color%}"
#
history_prompt2="%{$fg[$history_color]%}%h%{$reset_color%}"
#
history_prompt3="%{$fg_bold[$history_color]%}]%{$reset_color%}"
#
history_total="${history_prompt1}${history_prompt2}${history_prompt3}"
#
error_prompt1="%{$fg_bold[$error_color]%}<%{$reset_color%}"
#
error_prompt2="%{$fg[$error_color]%}%?%{$reset_color%}"
#
error_prompt3="%{$fg_bold[$error_color]%}>%{$reset_color%}"
#
error_total="%(?..${error_prompt1}${error_prompt2}${error_prompt3} )"
#
case "$TERM" in
  (screen)
      function precmd() { print -Pn "\033]0;S $TTY:t{%100<...<%~%<<}\007" }
        ;;
          (xterm)
              directory_prompt=""
                ;;
                  (*)
                      directory_prompt="%{$fg[$directory_color]%}%~%{$reset_color%} "
                        ;;
                        esac

                        if [[ $USER == root ]]; then
                            post_prompt="%{$fg_bold[$root_color]%}%#%{$reset_color%}"
                            else
                                post_prompt="%{$fg_bold[$user_color]%}%#%{$reset_color%}"
                                fi

                                PS1="%{$fg[yellow]%}%n@${host_prompt} ${jobs_total}${history_total} ${directory_prompt}${error_total}${post_prompt} "
