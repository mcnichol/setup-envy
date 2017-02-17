
# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
[[ -s "/home/euser/.jenv/bin/jenv-init.sh" ]] && source "/home/euser/.jenv/bin/jenv-init.sh" && source "/home/euser/.jenv/commands/completion.sh"
