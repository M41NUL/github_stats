#!/data/data/com.termux/files/usr/bin/bash
# ─────────────────────────────────────────
#  X-THEME — utils.sh
#  Dev: Md. Mainul Islam (CODEX-M41NUL)
# ─────────────────────────────────────────

# Colors
G="\033[92m"
R="\033[91m"
O="\033[38;5;208m"
W="\033[97m"
B="\033[1m"
DIM="\033[2m"
CY="\033[96m"
PU="\033[95m"
YE="\033[93m"
RST="\033[0m"

# Paths
TERMUX_HOME="$HOME"
COLORS_DIR="$HOME/.termux"
COLORS_FILE="$HOME/.termux/colors.properties"
FONT_FILE="$HOME/.termux/font.ttf"
BASHRC="$HOME/.bashrc"
ZSHRC="$HOME/.zshrc"
BACKUP_DIR="$HOME/.xtheme_backup"
CURRENT_FILE="$HOME/.xtheme_current"

ok_msg()   { echo -e "  ${G}${B}+${RST}  ${W}$1${RST}"; }
err_msg()  { echo -e "  ${R}${B}x${RST}  ${W}$1${RST}"; }
info_msg() { echo -e "  ${O}${B}>${RST}  ${W}$1${RST}"; }
warn_msg() { echo -e "  ${O}${B}!${RST}  ${W}$1${RST}"; }
dim_msg()  { echo -e "  ${DIM}${W}$1${RST}"; }

separator() { echo -e "  ${O}$(printf '%0.s-' {1..55})${RST}"; }

progress_bar() {
    local label="$1"
    local total=35
    local bar_width=28
    for i in $(seq 1 $total); do
        filled=$(( bar_width * i / total ))
        arrow=""
        [ $filled -gt 1 ] && arrow=$(printf '%0.s=' $(seq 1 $(( filled - 1 ))))
        [ $filled -gt 0 ] && arrow="${arrow}>"
        empty=$(printf '%0.s ' $(seq 1 $(( bar_width - filled ))))
        pct=$(( 100 * i / total ))
        if   [ $pct -lt 40 ]; then bc="${R}"
        elif [ $pct -lt 80 ]; then bc="${O}"
        else bc="${G}"; fi
        printf "\r  ${W}%-20s${RST}  ${bc}${B}[%-28s]${RST}  ${W}%3d%%${RST}" \
               "$label" "${arrow}${empty}" "$pct"
        sleep 0.03
    done
    echo ""
}

clear_screen() { clear; }

apply_termux() {
    # Reload termux settings and restart
    termux-reload-settings 2>/dev/null
}

detect_shell() {
    if [ -n "$ZSH_VERSION" ]; then echo "zsh"
    else echo "bash"; fi
}

get_rc_file() {
    local sh; sh=$(detect_shell)
    if [ "$sh" = "zsh" ]; then echo "$ZSHRC"
    else echo "$BASHRC"; fi
}

write_rc_block() {
    # Write a tagged block to rc file
    local rc_file="$1"
    local tag="$2"
    local content="$3"
    # Remove old block
    if [ -f "$rc_file" ]; then
        sed -i "/# BEGIN $tag/,/# END $tag/d" "$rc_file" 2>/dev/null
    fi
    # Append new block
    printf "\n# BEGIN %s\n%s\n# END %s\n" "$tag" "$content" "$tag" >> "$rc_file"
}

remove_rc_block() {
    local rc_file="$1"
    local tag="$2"
    [ -f "$rc_file" ] && sed -i "/# BEGIN $tag/,/# END $tag/d" "$rc_file" 2>/dev/null
}

save_current() {
    local key="$1"
    local val="$2"
    mkdir -p "$(dirname "$CURRENT_FILE")"
    if [ -f "$CURRENT_FILE" ]; then
        sed -i "/^${key}=/d" "$CURRENT_FILE" 2>/dev/null
    fi
    echo "${key}=${val}" >> "$CURRENT_FILE"
}

get_current() {
    local key="$1"
    [ -f "$CURRENT_FILE" ] && grep "^${key}=" "$CURRENT_FILE" | cut -d= -f2
}
