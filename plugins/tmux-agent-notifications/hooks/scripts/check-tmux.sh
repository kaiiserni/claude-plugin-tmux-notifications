#!/usr/bin/env bash
[ -z "$TMUX" ] && exit 0

FOUND=0
for dir in \
    "$HOME/.tmux/plugins/tmux-claude-notifications" \
    "$HOME/.tmux/plugins/tmux-agent-notifications"; do
    [ -d "$dir" ] && FOUND=1 && break
done

if [ "$FOUND" -eq 0 ]; then
    echo "tmux-agent-notifications: tmux plugin not installed. Add to .tmux.conf:" >&2
    echo "  set -g @plugin 'kaiiserni/tmux-claude-notifications'" >&2
fi

exit 0
