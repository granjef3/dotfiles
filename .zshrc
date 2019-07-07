#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
CASE_SENSITIVE="true"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vcs dir newline time)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history vi_mode)


bindkey -v
bindkey '^[' vi-cmd-mode
export KEYTIMEOUT=1

export EDITOR=vim

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/malonso/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/malonso/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/malonso/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/malonso/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --glob "!.git/*" --hidden'

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

alias vim="nvim"
alias vi="nvim"

export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# Wrap git automatically by adding the following to ~/.zshrc:

eval "$(hub alias -s)"
alias config='/usr/bin/git --git-dir=/Users/malonso/.cfg/ --work-tree=/Users/malonso'
