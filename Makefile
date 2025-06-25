.PHONY: zshrc zsh-plugins vimrc p10k font-hack font-jbm fonts all

all: zshrc vimrc p10k

zshrc:
	sh make/zsh/zshrc.sh

zsh-plugins: \
		autojump						\
		zsh-autosuggestions				\
		zsh-completions					\
		zsh-colored-man-pages			\
		zsh-history-substring-search	\
		zsh-syntax-highlighting			\
		zsh-fast-syntax-highlighting

# 定义插件目录
ZSH_PLUGIN_DIR := make/zsh/plugin

# 使用模式规则来处理所有插件
# `$(ZSH_PLUGIN_DIR)/$@`：在 `$ZSH_PLUGIN_DIR` 目录下，以目标名作为文件名
# 如果目标是 'autojump'，那么 `$(ZSH_PLUGIN_DIR)/autojump.sh` 是对应的文件
%: $(ZSH_PLUGIN_DIR)/%.sh
	# $@ 是目标名称 (例如 autojump)
	# $< 是第一个依赖项 (例如 make/zsh/plugin/autojump.sh)
	@echo "Processing Zsh plugin: $@"
	# 所有脚本的唯一作用都是下载插件，不涉及环境修改
	. "$<"

p10k:
	. make/p10k.sh

vimrc:
	. make/vimrc.sh

font-hack:
	. make/font-hack.sh

font-jbm:
	. make/font-jbm.sh

fonts: font-hack font-jbm

