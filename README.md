# wsl-notify-zsh
`wsl-notify-zsh` is a zsh plugin that uses [wsl-notify-send](https://github.com/stuartleeks/wsl-notify-send) to notify you when a command takes longer than 15 seconds to run.



## Installation

### Using [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

Clone this repository into `$ZSH_CUSTOM/plugins` (by default `~/.oh-my-zsh/custom/plugins`)

```zsh
git clone https://github.com/masonc15/wsl-notify-zsh.git $ZSH_CUSTOM/plugins/wsl-notify-zsh
```

Then add `wsl-notify-zsh` to your plugin list

```zsh
plugins=(... wsl-notify-zsh)
```

### Using [zplug](https://github.com/zplug/zplug)

Add the following to your `.zshrc`:

```zsh
zplug "masonc15/wsl-notify-zsh"
```

### Using [zgen](https://github.com/tarjoilija/zgen)

Add the following to your `.zshrc`:

```zsh
zgen load masonc15/wsl-notify-zsh
```

### Using [antigen](https://github.com/zsh-users/antigen)

Add the following to your `.zshrc`:

```zsh
antigen bundle masonc15/wsl-notify-zsh
```

### Using [zplug](https://github.com/zdharma/zplugin)

Add the following to your `.zshrc`:

```zsh
zplugin light masonc15/wsl-notify-zsh
```

### Using [zinit](https://github.com/zdharma/zinit)

Add the following to your `.zshrc`:

```zsh
zinit light masonc15/wsl-notify-zsh
```

### Using [zdharma/zinit](https://github.com/zdharma/zinit)

Add the following to your `.zshrc`:

```zsh
zinit light masonc15/wsl-notify-zsh
```

### Using [zimfw](https://github.com/zimfw/zimfw)

Add the following to your `.zshrc`:

```zsh
zimfw install masonc15/wsl-notify-zsh
```
---
Credit to [zsh-notify](https://github.com/marzocchi/zsh-notify) for most of the hard work.
