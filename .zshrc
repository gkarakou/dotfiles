# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

autoload -U colors && colors
PROMPT="%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[yellow]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%"
LESSSECURE=1
export LESSSECURE

autoload -U promptinit
promptinit
autoload -Uz compinit
compinit
setopt HIST_IGNORE_DUPS
 #key bindings
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
 # for rxvt
 bindkey "\e[8~" end-of-line
 bindkey "\e[7~" beginning-of-line
 # for non RH/Debian xterm, can't hurt for RH/DEbian xterm
 bindkey "eOH" beginning-of-line
 bindkey "eOF" end-of-line
 # for freebsd console
 bindkey "\e[H" beginning-of-line
 bindkey "\e[F" end-of-line
 # completion in the middle of a line
 bindkey '^i' expand-or-complete-prefix
 alias ll='ls -al'
 alias mv='mv -i'
 alias cp='cp -R'
 alias rm='rm -i' 
