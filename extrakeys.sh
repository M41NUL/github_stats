#!/data/data/com.termux/files/usr/bin/bash
# ─────────────────────────────────────────
#  X-THEME — extrakeys.sh
#  Dev: Md. Mainul Islam (CODEX-M41NUL)
# ─────────────────────────────────────────

source "$(dirname "$0")/utils.sh"

EXTRAKEYS_FILE="$HOME/.termux/termux.properties"

# Preset extra key layouts
declare -A LAYOUTS
declare -a LAYOUT_NAMES
declare -A LAYOUT_PREVIEWS

_add_layout() {
    local name="$1"
    local preview="$2"
    local layout="$3"
    LAYOUTS["$name"]="$layout"
    LAYOUT_PREVIEWS["$name"]="$preview"
    LAYOUT_NAMES+=("$name")
}

_add_layout "Hacker" \
    "/ | LS | \$ | ~ | EXIT | * / EX | CTRL | ALT | ← | ↓ | → | F2" \
    'extra-keys = [["/"," LS","\$","~","EXIT","*"],["EX","CTRL","ALT","LEFT","DOWN","RIGHT","F2"]]'

_add_layout "Developer" \
    "ESC | TAB | CTRL | ALT | { | } | [ | ] / | | ` | \" | ; | < | > | DEL" \
    'extra-keys = [["ESC","TAB","CTRL","ALT","{","}","[","]"],["PIPE","GRAVE","QUOTE","SEMICOLON","<",">","DEL"]]'

_add_layout "Coder_Pro" \
    "ESC | TAB | ~ | / | | | \$ | { | } / CTRL | ALT | ← | ↑ | ↓ | → | DEL" \
    'extra-keys = [["ESC","TAB","~","/","PIPE","\$","{","}"],["CTRL","ALT","LEFT","UP","DOWN","RIGHT","DEL"]]'

_add_layout "Vim_User" \
    "ESC | : | / | w | q | ! | u / CTRL | ← | ↑ | ↓ | → | G | g" \
    'extra-keys = [["ESC","COLON","/","w","q","!","u"],["CTRL","LEFT","UP","DOWN","RIGHT","G","g"]]'

_add_layout "Python_Dev" \
    "TAB | : | ( | ) | [ | ] | # / CTRL | ALT | ' | \" | = | DEL | BKSP" \
    'extra-keys = [["TAB","COLON","(",")","\[","\]","#"],["CTRL","ALT","APOSTROPHE","QUOTE","=","DEL","BACKSPACE"]]'

_add_layout "Git_Tools" \
    "ESC | TAB | git | add | push | pull | log / CTRL | ALT | status | diff | ← | → | DEL" \
    'extra-keys = [["ESC","TAB","git ","add ","push","pull","log"],["CTRL","ALT","status","diff","LEFT","RIGHT","DEL"]]'

_add_layout "Navigation" \
    "HOME | ↑ | END | PGUP / ← | ↓ | → | PGDN" \
    'extra-keys = [["HOME","UP","END","PGUP"],["LEFT","DOWN","RIGHT","PGDN"]]'

_add_layout "Minimal" \
    "ESC | TAB | CTRL | ← | ↓ | ↑ | → / BKSP | DEL" \
    'extra-keys = [["ESC","TAB","CTRL","LEFT","DOWN","UP","RIGHT"],["BACKSPACE","DEL"]]'

_add_layout "Full_Keys" \
    "ESC | F1-F4 | TAB | CTRL | ALT / HOME | ↑ | END | PGUP | DEL / ← | ↓ | → | PGDN | BKSP" \
    'extra-keys = [["ESC","F1","F2","F3","F4","TAB","CTRL","ALT"],["HOME","UP","END","PGUP","DEL"],["LEFT","DOWN","RIGHT","PGDN","BACKSPACE"]]'

_add_layout "Number_Row" \
    "1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 / ESC | TAB | CTRL | ALT | ← | → | DEL" \
    'extra-keys = [["1","2","3","4","5","6","7","8","9","0"],["ESC","TAB","CTRL","ALT","LEFT","RIGHT","DEL"]]'

_add_layout "Default_Termux" \
    "ESC | / | - | HOME | ↑ | END | PGUP / TAB | CTRL | ALT | ← | ↓ | → | PGDN" \
    'extra-keys = [["ESC","/","-","HOME","UP","END","PGUP"],["TAB","CTRL","ALT","LEFT","DOWN","RIGHT","PGDN"]]'

_add_layout "Custom" "" ""

apply_layout() {
    local name="$1"
    local layout="${LAYOUTS[$name]}"

    mkdir -p "$HOME/.termux"

    if [ "$name" = "Custom" ]; then
        echo ""
        info_msg "Format example:"
        dim_msg 'extra-keys = [["ESC","TAB","CTRL","ALT","LEFT","RIGHT","DEL"]]'
        echo ""
        local custom_input
        custom_input=$(prompt_input_fn "Enter your custom extra-keys layout")
        [ -z "$custom_input" ] && { warn_msg "Cancelled."; return; }
        layout="$custom_input"
    fi

    # Update or create termux.properties
    if [ -f "$EXTRAKEYS_FILE" ]; then
        sed -i '/^extra-keys/d' "$EXTRAKEYS_FILE"
    fi
    echo "$layout" >> "$EXTRAKEYS_FILE"

    save_current "extrakeys" "$name"
    ok_msg "Extra keys applied: $name"
    apply_termux
}

extrakeys_menu() {
    while true; do
        clear_screen
        _print_banner
        echo -e "\n  ${O}${B}+$(printf '%0.s=' {1..44})+${RST}"
        echo -e "  ${O}${B}|${G}       EXTRA KEYS MENU  --  X-THEME        ${O}|${RST}"
        echo -e "  ${O}${B}+$(printf '%0.s=' {1..44})+${RST}\n"

        local current; current=$(get_current "extrakeys")
        [ -n "$current" ] && info_msg "Current layout: $current"
        echo ""

        local i=1
        for name in "${LAYOUT_NAMES[@]}"; do
            local preview="${LAYOUT_PREVIEWS[$name]}"
            printf "  ${O}${B}[%2d]${RST}  ${W}%-18s${RST}  ${DIM}%s${RST}\n" \
                   "$i" "$name" "$preview"
            (( i++ ))
        done

        echo ""
        separator
        echo -e "  ${O}${B}[0]${RST}  ${W}Back${RST}"
        separator

        local choice
        choice=$(prompt_input_fn "Enter layout number or 0 to go back")
        [ "$choice" = "0" ] && return

        if [[ "$choice" =~ ^[0-9]+$ ]]; then
            local idx=$(( choice - 1 ))
            local name="${LAYOUT_NAMES[$idx]}"
            if [ -n "$name" ]; then
                progress_bar "Applying $name"
                apply_layout "$name"
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
