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

# NOTE: MacOS 默认不支持dircolors
if [[ $OSTYPE != "darwin"* ]]; then
    # Linux
    eval $(dircolors -b)        # Color settings
    alias ls='ls --color=auto'
else
    # MacOS
    alias ls='ls -G'
fi

alias la='ls -Ah'
alias ll='ls -lAh'
alias lsa='ls -lah'
alias l='ls -lah'

alias grep='grep --color=auto'

# +---------+
# | History |
# +---------+

# 历史纪录条目数量
HISTSIZE=10000
# 注销后保存的历史纪录条目数量
SAVEHIST=10000
# 历史纪录文件
# NOTE: 历史文件使用默认位置 $ZDOTDIR/.zsh_history
#       ，避免非交互终端的历史被分离
#HISTFILE=${ZDOTDIR:-$HOME}/history

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

# Enable completion menu listing configuration.
# NOTE: Should be called before compinit.
zmodload zsh/complist

    # +---------+
    # | Plugins |
    # +---------+

# zsh-completions
# Load more completions.
[[ ! -d ${XDG_DATA_HOME:-$HOME/.local/share}/zsh-completions/src ]] \
    || fpath=(${XDG_DATA_HOME:-$HOME/.local/share}/zsh-completions/src $fpath)

    # +----------+
    # | compinit |
    # +----------+

# Initialize completion.

# Autoload compinit.
# With the `-U' flag, alias expansion is suppressed when the function is loaded.
autoload -U compinit
# Alternatively, an explicit dumped file name can be given by `compinit -d <dumpfile>'.
# NOTE: 外部对`compinit`的无参数`-d`调用会导致冗余生成一个默认 dumpfile `$ZDOTDIR/.zcompdump`，
#       考虑到这点，不如放弃指定 dumpfile 的位置，使用默认设置。
#compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION
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

# Define completers.
# NOTE: `_extensions`与 Spack 的内置补全存在冲突，通过置于`_complete`之后解决。
# NOTE: 仅后置仍然可能触发冲突导致卡顿，不再使用`_extensions`
zstyle ':completion:*' completer _complete _approximate #_extensions 

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
# NOTE: `-- %D %d --` 格式串在命令没有提供`%D`信息时会引入一个额外的空格。
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
SCRIPT=${XDG_DATA_HOME:-$HOME/.local/share}/zsh-autosuggestions/zsh-autosuggestions.zsh \
    && [[ ! -f $SCRIPT ]] || source $SCRIPT

# zsh-colored-man-pages
SCRIPT=${XDG_DATA_HOME:-$HOME/.local/share}/zsh-colored-man-pages/colored-man-pages.plugin.zsh \
    && [[ ! -f $SCRIPT ]] || source $SCRIPT

# zsh-syntax-highlighting
# NOTE: This plugin needs to be sourced at the end of the `.zshrc` file.
#       More detailed, it should be after all the `compinit` and `zle -N`s.
#[[ ! -f ${XDG_DATA_HOME:-$HOME/.local/share}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] \
#    || source ${XDG_DATA_HOME:-$HOME/.local/share}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# NOTE: zsh-fast-syntax-highlighting额外提供对子命令的着色功能，
#       但在一些场景下将引入额外延迟

# zsh-fast-syntax-highlighting
SCRIPT=${XDG_DATA_HOME:-$HOME/.local/share}/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh \
    && [[ ! -f $SCRIPT ]] || source $SCRIPT
# NOTE: 对`man`呈现显著延迟，需要禁用对`man`子命令的着色。
#       另一种修复方式是hook掉阻塞的函数`whatis()`：通过测试$THEFD判断`whatis`的调用是否发生在highlighter中
FAST_HIGHLIGHT[chroma-man]=
# function whatis() { if [[ -v THEFD ]]; then :; else command whatis "$@"; fi; }

# zsh-history-substring-search
# NOTE: If zsh-syntax-highlighting is used along with this script,
#       then make sure that zsh-syntax-highlighting has been loaded before this script.
# Usage: `bindkey '^[[A' history-substring-search-up`
#        `bindkey '^[[B' history-substring-search-down`
# Zsh 原生支持前缀历史搜索，默认绑定键位 `^[P` 和 `^[N`（即 `alt+P` 和 `alt+N`）；
# 该插件提供子串历史搜索功能。
SCRIPT=${XDG_DATA_HOME:-$HOME/.local/share}/zsh-history-substring-search/zsh-history-substring-search.zsh \
    && [[ ! -f $SCRIPT ]] || source $SCRIPT


# +-------------+
# | User Custom |
# +-------------+

alias configenv='vim $ZDOTDIR/.zshenv'
alias configzsh='vim $ZDOTDIR/.zshrc'
alias configzshp='vim $ZDOTDIR/.zprofile'

# 其他设置放在 .zprofile 中

