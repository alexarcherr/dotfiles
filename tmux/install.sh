#!/bin/sh

# install Tmux Plugin Manager (TPM)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

~/.tmux/plugins/tpm/bin/install_plugins
~/.tmux/plugins/tpm/bin/update_plugins all

# Installing plugins
# Add new plugin to ~/.tmux.conf with set -g @plugin '...'
# Press prefix + I (capital i, as in Install) to fetch the plugin.
