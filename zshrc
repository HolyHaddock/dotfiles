# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(battery dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status aws background_jobs history time)

DEFAULT_USER="markharris"

# Load aliases
. ~/.aliases

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
#DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler virtualenv aws docker zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


mkcd () {
    mkdir -p "$@" && cd "$@"
}
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Set up rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# if (which emacs > /dev/null) && (! pidof emacs > /dev/null) then emacs --daemon; fi

[[ -f docker-machine ]] && eval "$(docker-machine env dev)"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="/home/mark/.linuxbrew/bin:$PATH"
export MANPATH="/home/mark/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/mark/.linuxbrew/share/info:$INFOPATH"

test -e "/home/linuxbrew/.linuxbrew/share/zsh/site-functions" && source /home/linuxbrew/.linuxbrew/share/zsh/site-functions

export PATH="/home/mark/.cabal/bin:/home/mark/bgch/cb-aws-tools/:$PATH"

export ALTERNATE_EDITOR=""
export EDITOR=emacsclient

test -e "/usr/share/autojump/autojump.zsh" && source /usr/share/autojump/autojump.zsh

export BIQ_HOME="/home/mark/bgch"

export NVM_DIR="$HOME/.nvm"
. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

eval "$(hub alias -s)"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/mark/.nvm/versions/node/v7.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/mark/.nvm/versions/node/v7.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/mark/.nvm/versions/node/v7.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/mark/.nvm/versions/node/v7.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

export TERM=xterm-color

source /etc/profile.d/rvm.sh