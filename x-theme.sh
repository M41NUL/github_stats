#!/data/data/com.termux/files/usr/bin/bash
# ─────────────────────────────────────────
#  X-THEME — x-theme.sh  (main)
#  Dev: Md. Mainul Islam (CODEX-M41NUL)
# ─────────────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"
source "$SCRIPT_DIR/updater.sh"
source "$SCRIPT_DIR/themes.sh"
source "$SCRIPT_DIR/fonts.sh"
source "$SCRIPT_DIR/banners.sh"
source "$SCRIPT_DIR/prompts.sh"
source "$SCRIPT_DIR/extrakeys.sh"
source "$SCRIPT_DIR/backup.sh"

_print_banner() {
echo -e "${G}${B}"
echo "  ██╗  ██╗      ████████╗██╗  ██╗███████╗███╗   ███╗███████╗"
echo "  ╚██╗██╔╝      ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝"
echo "   ╚███╔╝  █████╗  ██║   ███████║█████╗  ██╔████╔██║█████╗  "
echo "   ██╔██╗  ╚════╝  ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  "
echo "  ██╔╝ ██╗         ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗"
echo "  ╚═╝  ╚═╝         ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝"
echo -e "${RST}"
}

_info_box() {
    local W_BOX=46
    echo -e "  ${O}${B}+$(printf '%0.s-' $(seq 1 $W_BOX))+${RST}"
    _center_row "X-THEME  v1.0.0  -  Termux Customizer" $W_BOX
    echo -e "  ${O}${B}+$(printf '%0.s-' $(seq 1 $W_BOX))+${RST}"
    _data_row  "Tool"     "X-THEME"                8 $W_BOX "$G"
    _data_row  "Version"  "1.0.0"                  8 $W_BOX "$G"
    _data_row  "Dev"      "Md. Mainul Islam"        8 $W_BOX "$O"
    _data_row  "Brand"    "CODEX-M41NUL"            8 $W_BOX "$O"
    echo -e "  ${O}${B}+$(printf '%0.s-' $(seq 1 $W_BOX))+${RST}"
    _data_row  "GitHub"   "github.com/M41NUL"       8 $W_BOX "$G"
    _data_row  "Telegram" "t.me/codexm41nul"        8 $W_BOX "$O"
    _data_row  "YouTube"  "youtube.com/@codexm41nul" 8 $W_BOX "$R"
    echo -e "  ${O}${B}+$(printf '%0.s-' $(seq 1 $W_BOX))+${RST}"
    _center_row "© 2026 CODEX-M41NUL. All Rights Reserved." $W_BOX "$O"
    echo -e "  ${O}${B}+$(printf '%0.s-' $(seq 1 $W_BOX))+${RST}"
    echo ""
}

_center_row() {
    local text="$1" W="$2" tc="${3:-$G}"
    local vlen=${#text}
    local lpad=$(( (W - vlen) / 2 ))
    local rpad=$(( W - vlen - lpad ))
    printf "  ${O}${B}|${RST}%*s${tc}${B}%s${RST}%*s${O}${B}|${RST}\n" \
           "$lpad" "" "$text" "$rpad" ""
}

_data_row() {
    local label="$1" value="$2" lw="$3" W="$4" lc="${5:-$O}"
    local lpad=$(( lw - ${#label} ))
    local used=$(( 1 + lw + 2 + ${#value} + 1 ))
    local rpad=$(( W - used ))
    printf "  ${O}${B}|${RST} ${lc}${B}%s${RST}%*s  ${W}%s${RST}%*s${O}${B}|${RST}\n" \
           "$label" "$lpad" "" "$value" "$rpad" ""
}

_main_menu() {
    while true; do
        clear_screen
        _print_banner
        _info_box

        # Show current config
        local ct cf cb cp ck
        ct=$(get_current "theme")
        cf=$(get_current "font")
        cb=$(get_current "banner")
        cp=$(get_current "prompt")
        ck=$(get_current "extrakeys")

        echo -e "  ${DIM}${W}Active: Theme=${ct:-none}  Font=${cf:-default}  Banner=${cb:-none}  Prompt=${cp:-none}${RST}\n"

        echo -e "  ${O}${B}+$(printf '%0.s=' {1..44})+${RST}"
        echo -e "  ${O}${B}|${G}          MAIN MENU  --  X-THEME          ${O}|${RST}"
        echo -e "  ${O}${B}+$(printf '%0.s=' {1..44})+${RST}\n"

        _menu_option "1" "Theme Menu"      "50+ color themes  (Dracula, Matrix, Cyberpunk...)"
        _menu_option "2" "Font Menu"       "50+ fonts  (JetBrains, FiraCode, Hack...)"
        _menu_option "3" "Banner Menu"     "30+ MOTD banners  (H4CK3R, Matrix, Ghost...)"
        _menu_option "4" "Prompt Menu"     "20+ prompt styles  (Hacker, Lambda, Powerline...)"
        _menu_option "5" "Extra Keys Menu" "Keyboard layouts  (Hacker, Developer, Vim...)"
        _menu_option "6" "Backup/Restore"  "Save and restore all settings"
        _menu_option "0" "Exit"            "Quit X-THEME"
        separator

        local choice
        choice=$(prompt_input_fn "Select option")

        case "$choice" in
            1) theme_menu ;;
            2) font_menu ;;
            3) banner_menu ;;
            4) prompt_menu ;;
            5) extrakeys_menu ;;
            6) backup_menu ;;
            0)
                echo -e "\n  ${G}${B}Goodbye from X-THEME!${RST}"
                echo -e "  ${O}github.com/M41NUL  |  t.me/codexm41nul${RST}\n"
                exit 0 ;;
            *) warn_msg "Invalid option."; sleep 1 ;;
        esac
    done
}

_menu_option() {
    echo -e "  ${O}${B}[$1]${RST}  ${G}${B}$2${RST}"
    echo -e "        ${DIM}${W}$3${RST}\n"
}

prompt_input_fn() {
    local msg="$1"
    echo -ne "\n  ${O}${B}>${RST}  ${W}${msg}${RST}  " >&2
    read -r val
    echo "$val"
}

# ── Entry point ───────────────────────────────────────────────────────────────
clear_screen
_print_banner
separator
info_msg "Initializing X-THEME..."
echo ""
check_and_update
echo ""
ok_msg "Ready! Loading main menu..."
sleep 1
_main_menu
