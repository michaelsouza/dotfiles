# tmux Configuration

Personal tmux configuration for local and remote development sessions.

## Install

This system already has tmux available:

```bash
tmux -V
```

On Debian or Ubuntu machines where tmux is missing:

```bash
sudo apt update
sudo apt install tmux
```

The repository bootstrap does not run `sudo`; it only links configuration files.

## Activate

Expected config target:

```text
~/.config/tmux -> ~/gitrepos/dotfiles/tmux/.config/tmux
~/.tmux.conf -> ~/.config/tmux/tmux.conf
```

Create or refresh the links from the repository root:

```bash
bin/bootstrap
```

Reload inside an existing tmux session:

```text
Ctrl-a r
```

## Prefix

The prefix key is:

```text
Ctrl-a
```

To send a literal `Ctrl-a` to the running program:

```text
Ctrl-a Ctrl-a
```

## Keybindings

Custom bindings in this config:

```text
Ctrl-a c    new window in current path
Ctrl-a |    split pane horizontally in current path
Ctrl-a -    split pane vertically in current path
Ctrl-a h    select pane left
Ctrl-a j    select pane down
Ctrl-a k    select pane up
Ctrl-a l    select pane right
Ctrl-a H    resize pane left
Ctrl-a J    resize pane down
Ctrl-a K    resize pane up
Ctrl-a L    resize pane right
Ctrl-a T    set current pane title
Ctrl-a r    reload config
```

Common tmux defaults are still available behind the `Ctrl-a` prefix:

### Sessions

```text
Ctrl-a d    detach from current session
Ctrl-a s    choose session
Ctrl-a $    rename current session
Ctrl-a (    previous session
Ctrl-a )    next session
```

### Windows

```text
Ctrl-a w    choose window
Ctrl-a ,    rename current window
Ctrl-a n    next window
Ctrl-a p    previous window
Ctrl-a l    last window
Ctrl-a 0-9  select window by number
Ctrl-a &    kill current window
```

### Panes

```text
Ctrl-a x    kill current pane
Ctrl-a z    toggle pane zoom
Ctrl-a q    show pane numbers
Ctrl-a {    move pane left
Ctrl-a }    move pane right
Ctrl-a Space
            cycle pane layouts
```

### Copy Mode

Copy mode uses vi-style keys:

```text
Ctrl-a [    enter copy mode
v           begin selection
y           copy selection and leave copy mode
Ctrl-v      rectangle selection
Escape      cancel
```

### Commands and Help

```text
Ctrl-a :    open tmux command prompt
Ctrl-a ?    list active keybindings
```

## Behavior

- Mouse support is enabled.
- Windows and panes start at index `1`.
- New windows and splits inherit the current pane directory.
- Each pane shows a top border title with its pane index, pane title or current
  command, and current directory basename.
- True color support is enabled for common terminal types.
- Clipboard integration is enabled with `set-clipboard on`.
- History limit is set to `100000` lines.

## Health Checks

```bash
tmux -V
tmux -f tmux/.config/tmux/tmux.conf start-server \; source-file tmux/.config/tmux/tmux.conf \; kill-server
```
