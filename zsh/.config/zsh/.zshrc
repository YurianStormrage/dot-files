#!/usr/bin/env zsh

# +--------+
# | Common |
# +--------+

bindkey -e                  # Emacs key map

setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax. 

unsetopt beep

eval $(dircolors -b)        # Color settings

alias ls='ls -G'
alias la='ls -Ah'
alias ll='ls -lAh'
alias lsa='ls -lah'
alias l='ls -lah'

alias grep='grep --color=auto'

# +---------+
# | History |
# +---------+

HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}"/zsh/history

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
#setopt INC_APPEND_HISTORY

# +------------+
# | Completion |
# +------------+

    # +---------+
    # | Modules |
    # +---------+

# Enable completion menu listing configuration
# Should be called before compinit
zmodload zsh/complist

    # +---------+
    # | Plugins |
    # +---------+

# zsh-completions
# Load more completions
[[ ! -d ${XDG_DATA_HOME:-$HOME/.local/share}/zsh-completions/src ]] \
    || fpath=(${XDG_DATA_HOME:-$HOME/.local/share}/zsh-completions/src $fpath)

    # +----------+
    # | compinit |
    # +----------+

# Initialize completion

# Autoload compinit.
# With the `-U' flag, alias expansion is suppressed when the function is loaded.
autoload -U compinit
# Alternatively, an explicit dumped file name can be given by `compinit -d dumpfile'.
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION
compinit

    # +---------+
    # | Options |
    # +---------+

setopt GLOB_COMPLETE        # Show autocompletion menu with globs
#setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
setopt GLOB_DOTS            # Do not require a leading `.` in a filename to be matched explicitly.

    # +---------+
    # | zstyles |
    # +---------+

    # Ztyle pattern
    # :completion:<function>:<completer>:<command>:<argument>:<tag>

zstyle ':completion:*' verbose yes

        # +--------+
        # | Colors |
        # +--------+

# Colors for files and directory
# $LS_COLORS is set by `dircolors -b`
# Use $ZLS_COLORS for further configuration
# NOTE: Need to have the module `zsh/complist` loaded
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

        # +------------+
        # | Completers |
        # +------------+

        # `_complete` - This is the main completer we need to use for our completion.
        # `_approximate` - This one is similar to `_complete`, except that it will try to correct what you’ve typed already (the context) if no match is found.
        # `_expand_alias` - Expand an alias you’ve typed. It needs to be declared before `_complete`.
        # `_extensions` - Complete the glob `*.` with the possible file extensions.

# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate

#   This uses the HISTNO parameter and the BUFFER and CURSOR special
#   parameters that are available inside zle and completion  widgets
#   to  find  out  if the command line hasn't changed since the last
#   time completion was tried.  Only then are the _ignored, _correct
#   and _approximate completers called.
# NOTE: 这个设置与 menu 同时使用时效果不好
#       当第二次按 <tab> 时 menu 的内容会改变，不便于选择
#zstyle -e ':completion:*' completer '
#    if [[ $_last_try != "$HISTNO$BUFFER$CURSOR" ]]; then
#        _last_try="$HISTNO$BUFFER$CURSOR"
#        reply=(_complete _match _prefix)
#    else
#        reply=(_ignored _correct _approximate)
#    fi'

        # +-------+
        # | Cache |
        # +-------+

# Use cache for commands using cache
# Completion files: Use XDG dirs
[ -d "${XDG_CACHE_HOME:-$HOME/.cache}"/zsh ] || mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}"/zsh
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

        # +------------+
        # | Formatting |
        # +------------+

# Allow you to select in a menu
zstyle ':completion:*' menu select

# Squeezing Slashes
# By default, the completion system will expand // to /*/.
# For example, cd ~//Documents will be expanded to cd ~/*/Documents.
# Usually, on Unix systems, // is expanded to /. The following statement will set so.
#zstyle ':completion:*' squeeze-slashes true

# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true

# Order of completed files
zstyle ':completion:*' file-sort modification

# Formats of completion prompts (corrections/descriptions/messages/warnings)
    # `%F{<color>} %f` - Change the foreground color with `<color>`.
    # `%K{<color>} %k` - Change the background color with `<color>`.
    # `%B %b` - Bold.
    # `%U %u` - Underline.
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
#zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %d --%f'
zstyle ':completion:*:*:*:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format '%F{red}-- no matches found --%f'

# Prompt of *long* completion menu, which exceeds a screen
zstyle ':completion:*' select-prompt '%SSelect:  lines: %L  matches: %M  [%p]'

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
#zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases

# Use the name of the tag for the matches as the name of the group
# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''

# Order of groups
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

        # +-----------------------------+
        # | Completion Matching Control |
        # +-----------------------------+

        # See ZSHCOMPWID "completion matching control"

# Setting the style matcher-list allows you to filter the matches of the completion with even more patterns
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Completion for hosts
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# +---------+
# | Plugins |
# +---------+

# autojump
#[[ ! -f ${XDG_DATA_HOME:-$HOME/.local/share}/autojump/bin/autojump.sh ]] \
#    || source ${XDG_DATA_HOME:-$HOME/.local/share}/autojump/bin/autojump.sh

# zsh-autosuggestions
[[ ! -f ${XDG_DATA_HOME:-$HOME/.local/share}/zsh-autosuggestions/zsh-autosuggestions.zsh ]] \
    || source ${XDG_DATA_HOME:-$HOME/.local/share}/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-colored-man-pages
[[ ! -f ${XDG_DATA_HOME:-$HOME/.local/share}/zsh-colored-man-pages/colored-man-pages.plugin.zsh ]] \
    || source ${XDG_DATA_HOME:-$HOME/.local/share}/zsh-colored-man-pages/colored-man-pages.plugin.zsh

# zsh-syntax-highlighting
# NOTE: This plugin needs to be sourced at the end of the `.zshrc` file.
#       More detailed, it should be after all the `compinit` and `zle -N`s.
[[ ! -f ${XDG_DATA_HOME:-$HOME/.local/share}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] \
    || source ${XDG_DATA_HOME:-$HOME/.local/share}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-history-substring-search
# NOTE: If zsh-syntax-highlighting is used along with this script,
#       then make sure that zsh-syntax-highlighting has been loaded before this script.
[[ ! -f ${XDG_DATA_HOME:-$HOME/.local/share}/zsh-history-substring-search/zsh-history-substring-search.zsh ]] \
    || source ${XDG_DATA_HOME:-$HOME/.local/share}/zsh-history-substring-search/zsh-history-substring-search.zsh

