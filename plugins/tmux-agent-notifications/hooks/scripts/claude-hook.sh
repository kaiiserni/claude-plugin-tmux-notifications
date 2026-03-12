#!/usr/bin/env bash
# Thin wrapper — delegates to tmux-claude-notifications plugin

HOOK_EVENT="$1"

# Find the tmux plugin's scripts directory
PLUGIN_DIR=""
for dir in \
    "$HOME/.tmux/plugins/tmux-claude-notifications/scripts" \
    "$HOME/.tmux/plugins/tmux-agent-notifications/scripts"; do
    [ -d "$dir" ] && PLUGIN_DIR="$dir" && break
done

if [ -z "$PLUGIN_DIR" ]; then
    echo "tmux-claude-notifications plugin not found" >&2
    exit 0
fi

echo "$( [ ! -t 0 ] && cat )" | "$PLUGIN_DIR/claude-hook.sh" "$HOOK_EVENT"
