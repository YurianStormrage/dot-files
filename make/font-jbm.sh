if [ -z `fc-list | grep "JetBrainsMono"` ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
fi
