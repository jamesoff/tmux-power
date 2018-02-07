# tmux-power

Display battery/power status in [`tmux`](https://tmux.github.io/) status bar.

Supports:

- macOS

## Installing

### Via TPM (recommended)

The easiest way to install `tmux-power` is via the [Tmux Plugin
Manager](https://github.com/tmux-plugins/tpm).

1. Add plugin to the list of TPM plugins in `.tmux.conf`:

    ``` tmux
    set -g @plugin 'jamesoff/tmux-power'
    ```

2. Use <kbd>prefix</kbd>–<kbd>I</kbd> to install `tmux-power`.

3. When you want to update `tmux-power` use <kbd>prefix</kbd>–<kbd>U</kbd>.

### Manual Installation

1. Clone the repository

    ``` sh
    $ git clone https://github.com/jamesoff/tmux-power ~/clone/path
    ```

2. Add this line to the bottom of `.tmux.conf`

    ``` tmux
    run-shell ~/clone/path/tmux-power.tmux
    ```

3. Reload the `tmux` environment

    ``` sh
    # type this inside tmux
    $ tmux source-file ~/.tmux.conf
    ```

## Use

This plugin is hard-coded to check if the gpd0 interface is up.

Edit your `status-left` or `status-right` setting to include:

- `#{power}` - display the power status

Reload your configuration for it to take effect: <kbd>prefix</kbd>-<kbd>R</kbd> with TPM, or

``` sh
$ tmux source-file ~/.tmux.conf
```

You will need a [Nerd Font](https://github.com/ryanoasis/nerd-fonts) for the symbol to show correctly.

The battery icon will go red/yellow/green to show the battery level. It will go blue when charging, and change to a power plug when fully charged and plugged in.

The battery icon will not show up unless the session name is `fullscreen` or `remote`, as if it is not, it suggests you should be able to see the battery status in the status bar. (See [my tmux configuration](https://jamesoff.net/2017/08/26/tmux-configuration.html) for info about how I use session names.)

