load_plugin(){
local plugin_path="$1"
if [ -f "$plugin_path" ]; then
    source "$plugin_path"
else
    echo "Error:file '$plugin_path' not found."
fi
}

# 使用这个函数来加载你的插件
load_plugin ~/.config/zsh-plugins/ails.zsh
load_plugin ~/.config/zsh-plugins/emacs-vterm.zsh
load_plugin ~/.config/zsh-plugins/python.zsh
load_plugin ~/.config/zsh-plugins/node.zsh
load_plugin ~/.config/zsh-plugins/go.zsh

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"


export AM_HOME=/home/apple115/project/cslearn/njuos/os-workbench/abstract-machine

zstyle ':zim:zmodule' use 'degit'
ZIM_HOME=~/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
    source ${ZIM_HOME}/zimfw.zsh init -q
fi

load_plugin "${ZIM_HOME}/init.zsh"


echo "Welcome to your custom shell, $USER!"

vterm_prompt_end() {
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
}
setopt PROMPT_SUBST
PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'

# Created by `pipx` on 2024-10-08 01:36:28
export PATH="$PATH:/home/apple115/go/bin/gopls"
