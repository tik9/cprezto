
ZSH_CUSTOM_DIR="${0:h}"

source "$ZSH_CUSTOM_DIR/aliases.zsh" 
source "$ZSH_CUSTOM_DIR/functions.zsh"

 for module_file in "$ZSH_CUSTOM_DIR/modules"/*.zsh; do; source "$module_file"; done