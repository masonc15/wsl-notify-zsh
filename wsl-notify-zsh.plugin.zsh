zstyle ':notify:*' plugin-dir "$plugin_dir"
zstyle ':notify:*' command-complete-timeout 30
zstyle ':notify:*' error-log /dev/stderr
zstyle ':notify:*' notifier zsh-notify
zstyle ':notify:*' expire-time 0
zstyle ':notify:*' app-name ''
zstyle ':notify:*' notifier zsh-notify
zstyle ':notify:*' success-title '#win (in #{time_elapsed})'
zstyle ':notify:*' success-sound ''
zstyle ':notify:*' success-icon ''
zstyle ':notify:*' error-title '#fail (in #{time_elapsed})'
zstyle ':notify:*' error-sound ''
zstyle ':notify:*' error-icon ''
zstyle ':notify:*' disable-urgent no
zstyle ':notify:*' activate-terminal no
zstyle ':notify:*' always-check-active-window no
zstyle ':notify:*' check-focus yes
zstyle ':notify:*' blacklist-regex ''
zstyle ':notify:*' enable-on-ssh no
zstyle ':notify:*' always-notify-on-failure yes

unset plugin_dir

function wsl-notify-before-command() {
    declare -g last_command="$1"
    declare -g start_time
    # set start_time variable to the exact time the command started
    start_time="$(date +%s.%N)"
}

# notify if command takes longer than 15 seconds
function wsl-notify-after-command() {
    # set elapsed_time variable to the time elapsed since the command started
    local elapsed_time
    # check if start_time is updated
    if [[ -n "$start_time" ]]; then
        elapsed_time="$(echo "$(date +%s.%N) - $start_time" | bc)"
    else
        # if start_time is not updated, set elapsed_time to 0
        elapsed_time=0
    fi
    # change elapsed_time to only two decimal places
    # elapsed_time="$(printf '%.2f' "$elapsed_time")"
    # if elapsed_time is greater than 15 seconds, notify using notify-send
    # Example: notify-send --category "Finished: $last_command" "Runtime: $elapsed_time seconds"
    # also, if elapsed time is greater than 60 seconds, change elapsed_time to minutes and seconds
    if (( $(echo "$elapsed_time > 15" | bc -l) )); then
        if (( $(echo "$elapsed_time > 60" | bc -l) )); then
            elapsed_time="$(printf '%dh:%dm:%ds' $(($elapsed_time/3600)) $(($elapsed_time%3600/60)) $(($elapsed_time%60)))"
        else
            elapsed_time="$(printf '%dm:%ds' $(($elapsed_time%3600/60)) $(($elapsed_time%60)))"
        fi
        # notify-send --category "Finished: $last_command" "Runtime: $elapsed_time"
        notify-send --category "Finished: $last_command" "Runtime: $elapsed_time"
    fi
    # only notify-send once per command
    unset start_time
}

# autoload below
autoload -U add-zsh-hook
add-zsh-hook preexec wsl-notify-before-command
add-zsh-hook precmd wsl-notify-after-command
