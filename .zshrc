
# Instant Prompt (Must stay at the top)
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Define Module Loading (IMPORTANT: Define this BEFORE sourcing init.zsh)
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'git' \
  'completion' \
  'syntax-highlighting' \
  'history-substring-search' \
  'autosuggestions' \
  'prompt' \
# 'dpkg' \
  # 'homebrew' \
  # 'pacman' \

# Configure Module Settings
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'line' \
  'cursor' \
  'root'

zstyle ':prezto:module:prompt' theme 'powerlevel10k'
zstyle ':completion:*' matcher-list 'm:{a-zü}={A-Za-zÜ}'
zstyle ':completion:*' special-dirs true

# Initialize Prezto (This executes the loading based on styles above)
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# If highlighting STILL isn't working after the above, it's because Prezto didn't find a .zpreztorc and skipped the pmodule loading.
# This line acts as a "Force Load" fallback:
if [[ -z "$ZSH_HIGHLIGHT_REVISION" ]]; then
   source ~/.zprezto/modules/syntax-highlighting/external/zsh-syntax-highlighting.zsh
fi


# Load Personal Scripts & P10K Config
for file in ~/.zprezto/modules/own/*.zsh(N); do
  source "$file"
done

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh