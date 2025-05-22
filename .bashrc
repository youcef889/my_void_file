# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# Set PS1 (prompt)
PS1="\[$(tput setaf 6)\]╭─\[$(tput setaf 5)\][\u@\h]\[$(tput setaf 6)\]-\[$(tput setaf 4)\][\w]\n\[$(tput setaf 6)\]╰─\[$(tput setaf 3)\]$ \[$(tput sgr0)\]"

# ====== LS_COLORS (Catppuccin-friendly) ====== #
export LS_COLORS="di=34:ln=36:so=35:pi=33:ex=32:bd=34:cd=34:su=31:sg=31:tw=34:ow=34:*.txt=37:*.sh=32"

alias i='doas xbps-install -S'
alias u='i;doas xbps-install -u xbps ; doas xbps-install -u'  
alias q='doas  xbps-query -Rs'  
alias r='doas  xbps-remove'

export BROWSER=surf
export PDFREADER=zathura
export VideoPlayer=mpv



