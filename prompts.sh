#!/data/data/com.termux/files/usr/bin/bash
# ─────────────────────────────────────────
#  X-THEME — prompts.sh
#  Dev: Md. Mainul Islam (CODEX-M41NUL)
# ─────────────────────────────────────────

source "$(dirname "$0")/utils.sh"

declare -A PROMPTS
declare -a PROMPT_NAMES
declare -A PROMPT_PREVIEWS

_add_prompt() {
    local name="$1"
    local preview="$2"
    local bash_ps1="$3"
    local zsh_ps1="$4"
    PROMPTS["${name}_bash"]="$bash_ps1"
    PROMPTS["${name}_zsh"]="$zsh_ps1"
    PROMPT_PREVIEWS["$name"]="$preview"
    PROMPT_NAMES+=("$name")
}

# name | preview | bash PS1 | zsh PS1
_add_prompt "H4CK3R_Box" \
    "┌─[h4ck3r@termux]-[~]\n└─ >>> " \
    'PS1="\[\033[91m\]┌─[\[\033[0m\]\[\033[92m\]\u\[\033[91m\]@\[\033[92m\]\h\[\033[91m\]]-[\[\033[93m\]\w\[\033[91m\]]\n└─ \[\033[95m\]>>>\[\033[0m\] "' \
    'PROMPT="%F{red}┌─[%f%F{green}%n%F{red}@%F{green}%m%F{red}]-[%F{yellow}%~%F{red}]%f"$'"'"'\n'"'"'"%F{magenta}└─ >>>%f "'

_add_prompt "Cyberpunk" \
    "[CYBER]~> " \
    'PS1="\[\033[95m\][\[\033[96m\]CYBER\[\033[95m\]]\[\033[93m\]~>\[\033[0m\] "' \
    'PROMPT="%F{magenta}[%F{cyan}CYBER%F{magenta}]%F{yellow}~>%f "'

_add_prompt "Matrix" \
    "[matrix@neo ~]$ " \
    'PS1="\[\033[92m\][\[\033[0m\]matrix\[\033[92m\]@\[\033[0m\]neo \[\033[92m\]\W\[\033[0m\]]\[\033[92m\]\$\[\033[0m\] "' \
    'PROMPT="%F{green}[%fmatrix%F{green}@%fneo %F{green}%1~%F{green}]$%f "'

_add_prompt "Ghost" \
    "👻 user@termux ~ $ " \
    'PS1="👻 \[\033[97m\]\u\[\033[2m\]@\h\[\033[0m\] \[\033[94m\]\W\[\033[0m\] \$ "' \
    'PROMPT="👻 %F{white}%n%F{245}@%m%f %F{blue}%1~%f $ "'

_add_prompt "Neon_Arrow" \
    "user@termux ➜ ~ " \
    'PS1="\[\033[96m\]\u\[\033[97m\]@\[\033[96m\]\h\[\033[0m\] \[\033[93m\]➜\[\033[0m\]  \[\033[92m\]\W\[\033[0m\] "' \
    'PROMPT="%F{cyan}%n%F{white}@%F{cyan}%m%f %F{yellow}➜%f  %F{green}%1~%f "'

_add_prompt "Blood_Red" \
    "[✘] user ~/path > " \
    'PS1="\[\033[91m\][\[\033[0m\]✘\[\033[91m\]] \[\033[97m\]\u \[\033[91m\]\W\[\033[0m\] > "' \
    'PROMPT="%F{red}[%f✘%F{red}] %F{white}%n %F{red}%1~%f > "'

_add_prompt "Minimal_Dollar" \
    "~ $ " \
    'PS1="\[\033[92m\]\W\[\033[0m\] \$ "' \
    'PROMPT="%F{green}%1~%f $ "'

_add_prompt "Lambda" \
    "~/path λ " \
    'PS1="\[\033[94m\]\W\[\033[0m\] \[\033[95m\]λ\[\033[0m\] "' \
    'PROMPT="%F{blue}%1~%f %F{magenta}λ%f "'

_add_prompt "Arrow_Right" \
    "~/path ❯ " \
    'PS1="\[\033[92m\]\W\[\033[0m\] \[\033[92m\]❯\[\033[0m\] "' \
    'PROMPT="%F{green}%1~%f %F{green}❯%f "'

_add_prompt "Double_Arrow" \
    ">> ~/path >> " \
    'PS1="\[\033[93m\]>>\[\033[0m\] \[\033[97m\]\W\[\033[0m\] \[\033[93m\]>>\[\033[0m\] "' \
    'PROMPT="%F{yellow}>>%f %F{white}%1~%f %F{yellow}>>%f "'

_add_prompt "Triple_Chevron" \
    ">>> ~/path " \
    'PS1="\[\033[91m\]>>>\[\033[0m\] \[\033[97m\]\W\[\033[0m\] "' \
    'PROMPT="%F{red}>>>%f %F{white}%1~%f "'

_add_prompt "Powerline_Simple" \
    " user  ~/path  $ " \
    'PS1="\[\033[42m\]\[\033[30m\] \u \[\033[0m\]\[\033[32m\]\[\033[44m\]\[\033[97m\] \W \[\033[0m\]\[\033[34m\] \[\033[0m\]\$ "' \
    'PROMPT="%K{green}%F{black} %n %k%f%F{green}%K{blue}%F{white} %1~ %k%f%F{blue}%f $ "'

_add_prompt "Square_Bracket" \
    "[user@host ~/path]$ " \
    'PS1="\[\033[94m\][\[\033[97m\]\u\[\033[94m\]@\[\033[97m\]\h \[\033[93m\]\W\[\033[94m\]]\[\033[0m\]\$ "' \
    'PROMPT="%F{blue}[%F{white}%n%F{blue}@%F{white}%m %F{yellow}%1~%F{blue}]%f$ "'

_add_prompt "Emoji_Rocket" \
    "🚀 ~/path $ " \
    'PS1="🚀 \[\033[96m\]\W\[\033[0m\] \$ "' \
    'PROMPT="🚀 %F{cyan}%1~%f $ "'

_add_prompt "Emoji_Fire" \
    "🔥 user ~/path > " \
    'PS1="🔥 \[\033[91m\]\u\[\033[0m\] \[\033[93m\]\W\[\033[0m\] > "' \
    'PROMPT="🔥 %F{red}%n%f %F{yellow}%1~%f > "'

_add_prompt "Time_Prompt" \
    "[12:34:56] user ~/path $ " \
    'PS1="\[\033[2m\][\t]\[\033[0m\] \[\033[92m\]\u\[\033[0m\] \[\033[94m\]\W\[\033[0m\] \$ "' \
    'PROMPT="%F{245}[%T]%f %F{green}%n%f %F{blue}%1~%f $ "'

_add_prompt "Classic_Bash" \
    "user@host:~/path$ " \
    'PS1="\u@\h:\w\$ "' \
    'PROMPT="%n@%m:%~$ "'

_add_prompt "Colored_Classic" \
    "user@host:~/path$ " \
    'PS1="\[\033[92m\]\u\[\033[97m\]@\[\033[96m\]\h\[\033[97m\]:\[\033[93m\]\w\[\033[0m\]\$ "' \
    'PROMPT="%F{green}%n%F{white}@%F{cyan}%m%F{white}:%F{yellow}%~%f$ "'

_add_prompt "Multiline_Info" \
    "user@host | ~/path\n$ " \
    'PS1="\[\033[92m\]\u\[\033[97m\]@\[\033[96m\]\h\[\033[0m\] | \[\033[93m\]\w\[\033[0m\]\n\$ "' \
    'PROMPT="%F{green}%n%F{white}@%F{cyan}%m%f | %F{yellow}%~%f"$'"'"'\n'"'"'"$ "'

_add_prompt "Dot_Separator" \
    "user · ~/path · $ " \
    'PS1="\[\033[92m\]\u\[\033[2m\] · \[\033[0m\]\[\033[93m\]\W\[\033[2m\] · \[\033[0m\]\$ "' \
    'PROMPT="%F{green}%n%F{245} · %F{yellow}%1~%F{245} · %f$ "'

apply_prompt() {
    local name="$1"
    local rc_file; rc_file=$(get_rc_file)
    local sh; sh=$(detect_shell)

    local ps1_key="${name}_${sh}"
    local ps1="${PROMPTS[$ps1_key]}"

    if [ -z "$ps1" ]; then
        # fallback to bash
        ps1="${PROMPTS[${name}_bash]}"
    fi

    [ -z "$ps1" ] && { err_msg "Prompt not found."; return 1; }

    write_rc_block "$rc_file" "XTHEME_PROMPT" "export $ps1"
    # Also write to both rc files
    write_rc_block "$BASHRC" "XTHEME_PROMPT" "$ps1"
    write_rc_block "$ZSHRC"  "XTHEME_PROMPT" "$ps1"

    save_current "prompt" "$name"
    ok_msg "Prompt applied: $name"
    ok_msg "Restart Termux to see changes."
}

prompt_menu() {
    while true; do
        clear_screen
        _print_banner
        echo -e "\n  ${O}${B}+$(printf '%0.s=' {1..44})+${RST}"
        echo -e "  ${O}${B}|${G}         PROMPT MENU  --  X-THEME          ${O}|${RST}"
        echo -e "  ${O}${B}+$(printf '%0.s=' {1..44})+${RST}\n"

        local current; current=$(get_current "prompt")
        [ -n "$current" ] && info_msg "Current prompt: $current"
        echo ""

        local i=1
        for name in "${PROMPT_NAMES[@]}"; do
            local preview="${PROMPT_PREVIEWS[$name]}"
            printf "  ${O}${B}[%2d]${RST}  ${W}%-20s${RST}  ${DIM}%b${RST}\n" \
                   "$i" "$name" "$preview"
            (( i++ ))
        done

        echo ""
        separator
        echo -e "  ${O}${B}[0]${RST}  ${W}Back${RST}"
        separator

        local choice
        choice=$(prompt_input_fn "Enter prompt number or 0 to go back")
        [ "$choice" = "0" ] && return

        if [[ "$choice" =~ ^[0-9]+$ ]]; then
            local idx=$(( choice - 1 ))
            local name="${PROMPT_NAMES[$idx]}"
            if [ -n "$name" ]; then
                progress_bar "Applying $name"
                apply_prompt "$name"
                sleep 1
            else
                warn_msg "Invalid selection."
                sleep 1
            fi
        else
            warn_msg "Invalid input."
            sleep 1
        fi
    done
}

prompt_input_fn() {
    local msg="$1"
    echo -ne "\n  ${O}${B}>${RST}  ${W}${msg}${RST}  " >&2
    read -r val
    echo "$val"
}
