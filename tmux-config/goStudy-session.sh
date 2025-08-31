#!/bin/bash

BASE_DIR=~/git/goStudie/
SESSION=goStudy

# Se a sessão não existir, cria
tmux has-session -t $SESSION 2>/dev/null
if [ $? != 0 ]; then
    # Cria sessão goStudy com primeira janela 'goStudy'
    tmux new-session -s $SESSION -n goStudy -c "$BASE_DIR" -d

    # Cria segunda janela 'terminal'
    tmux new-window -t $SESSION:2 -n terminal -c "$BASE_DIR"

    # Cria segunda janela 'lazygit'
    tmux new-window -t $SESSION:3 -n lazygit -c "$BASE_DIR"

    # Envia o comando nvim para a primeira janela
    tmux send-keys -t $SESSION:goStudy 'nvim' C-m
    
    # Envia o comando nvim para a terceira janela
    tmux send-keys -t $SESSION:lazygit 'lazygit' C-m
fi

# Attach automático
tmux attach-session -t $SESSION
