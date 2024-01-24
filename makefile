.PHONY: zshrc zsh-plugins vimrc p10k font-hack font-jbm fonts all

all: zshrc vimrc p10k

zshrc:
	sh make/zsh/zshrc.sh

zsh-plugins: autojump zsh-autosuggestions zsh-completions zsh-colored-man-pages

autojump:
	. make/zsh/plugin/autojump.sh

zsh-autosuggestions:
	. make/zsh/plugin/zsh-autosuggestions.sh

zsh-completions:
	. make/zsh/plugin/zsh-completions.sh

zsh-colored-man-pages:
	. make/zsh/plugin/zsh-colored-man-pages.sh

p10k:
	. make/p10k.sh

vimrc:
	. make/vimrc.sh

font-hack:
	. make/font-hack.sh

font-jbm:
	. make/font-jbm.sh

fonts: font-hack font-jbm
