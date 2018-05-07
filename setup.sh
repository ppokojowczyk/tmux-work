#
# Simple setup script.
#

if [ -f $HOME/.tmux.conf ]; then
    BACKUP_FILENAME=$HOME/tmux.conf.`date +%Y_%m_%d_%H_%M_%S`.bkp
    echo "- Backup of current ~/.tmux.conf to $BACKUP_FILENAME."
    mv $HOME/.tmux.conf $BACKUP_FILENAME
fi

if [ -f ./tmux_custom_config.conf ]; then
    echo "- Creating new config file"
    touch $HOME/.tmux.conf
    echo 'TMUX_CONF_DIR='`realpath .` > $HOME/.tmux.conf
    echo 'source '`readlink -f tmux_custom_config.conf` >> $HOME/.tmux.conf
    echo "- Done."
else
    echo "- File tmux_custom_config.conf doesn't exist."
    echo "- Failed."
fi

exit;
