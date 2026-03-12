# tmux-agent-notifications (Claude Code Plugin)

Thin Claude Code hook wrapper for [tmux-claude-notifications](https://github.com/kaiiserni/tmux-claude-notifications). All notification logic lives in the tmux plugin — this plugin only registers hooks and forwards events.

## Requirements

- tmux 3.2+
- [tmux-claude-notifications](https://github.com/kaiiserni/tmux-claude-notifications) tmux plugin (installed via TPM)

## Installation

**1. Install the tmux plugin first** — add to `~/.tmux.conf`:

```tmux
set -g @plugin 'kaiiserni/tmux-claude-notifications'
```

Reload tmux: `prefix + I`

**2. Install this Claude Code plugin:**

```bash
claude plugin marketplace add kaiiserni/claude-plugin-tmux-notifications
claude plugin install tmux-agent-notifications@claude-plugin-tmux-notifications
```

> Restart Claude Code after installing for hooks to activate.

## Registered Hooks

| Event | Description |
|---|---|
| Stop | Agent finished |
| Notification | Agent needs attention |
| PreToolUse | Clears alert if user is watching |
| UserPromptSubmit | Clears alert |
| SessionEnd | Clears alert |

## How It Works

This plugin registers Claude Code hooks that forward events to the tmux plugin's `claude-hook.sh` script. The tmux plugin handles all notification display, status bar integration, and alert clearing.

## Configuration

All display settings are configured via tmux `@` variables — see the [tmux plugin README](https://github.com/kaiiserni/tmux-claude-notifications).

## Uninstall

```bash
claude plugin uninstall tmux-agent-notifications@claude-plugin-tmux-notifications
claude plugin marketplace remove claude-plugin-tmux-notifications
```

## License

MIT
