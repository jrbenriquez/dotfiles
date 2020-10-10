# Install this to your crontab
# @reboot /home/johnreienriquez/Code/dotfiles/ubuntu/key-config.sh

export DOTFILES_DIR=~/Code/dotfiles
# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps
# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'

xmodmap $DOTFILES_DIR/ubuntu/Xmodmap
