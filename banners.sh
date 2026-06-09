#!/data/data/com.termux/files/usr/bin/bash
# ─────────────────────────────────────────
#  X-THEME — banners.sh  (MOTD)
#  Dev: Md. Mainul Islam (CODEX-M41NUL)
# ─────────────────────────────────────────

source "$(dirname "$0")/utils.sh"

MOTD_FILE="$HOME/.termux/motd"

# ── Banner definitions ─────────────────────────────────────────────────────────
declare -A BANNERS
declare -a BANNER_NAMES

_add_banner() {
    local name="$1"; shift
    BANNERS["$name"]="$*"
    BANNER_NAMES+=("$name")
}

# Banners stored as escaped strings, will be eval'd on apply
_add_banner "H4CK3R_ASCII" '
\033[91m\033[1m
  ██╗  ██╗██╗  ██╗ ██████╗██╗  ██╗██████╗ ██████╗
  ██║  ██║██║  ██║██╔════╝██║ ██╔╝╚════██╗██╔══██╗
  ███████║███████║██║     █████╔╝  █████╔╝██████╔╝
  ██╔══██║╚════██║██║     ██╔═██╗  ╚═══██╗██╔══██╗
  ██║  ██║     ██║╚██████╗██║  ██╗██████╔╝██║  ██║
  ╚═╝  ╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝\033[0m
\033[38;5;208m  android \033[91m♥\033[38;5;208m termux\033[0m
'

_add_banner "Matrix_Rain" '
\033[92m\033[1m
  ╔╦╗╔═╗╔╦╗╦═╗╦═╗ ╦
  ║║║╠═╣ ║ ╠╦╝║╔╩╦╝
  ╩ ╩╩ ╩ ╩ ╩╚═╩╩ ╚═
\033[0m\033[2m\033[92m
  Wake up... The Matrix has you.
  Follow the white rabbit.\033[0m
'

_add_banner "Cyberpunk_City" '
\033[38;5;201m\033[1m
  ░█████╗░██╗░░░██╗██████╗░███████╗██████╗░
  ██╔══██╗╚██╗░██╔╝██╔══██╗██╔════╝██╔══██╗
  ██║░░╚═╝░╚████╔╝░██████╦╝█████╗░░██████╔╝
  ██║░░██╗░░╚██╔╝░░██╔══██╗██╔══╝░░██╔══██╗
  ╚█████╔╝░░░██║░░░██████╦╝███████╗██║░░██║
  ░╚════╝░░░░╚═╝░░░╚═════╝░╚══════╝╚═╝░░╚═╝\033[0m
\033[93m  night city never sleeps.\033[0m
'

_add_banner "Ghost_Shell" '
\033[97m\033[1m
   ██████╗ ██╗  ██╗ ██████╗ ███████╗████████╗
  ██╔════╝ ██║  ██║██╔═══██╗██╔════╝╚══██╔══╝
  ██║  ███╗███████║██║   ██║███████╗   ██║
  ██║   ██║██╔══██║██║   ██║╚════██║   ██║
  ╚██████╔╝██║  ██║╚██████╔╝███████║   ██║
   ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝\033[0m
\033[2m\033[97m  Stand Alone Complex\033[0m
'

_add_banner "Neon_Glow" '
\033[96m\033[1m
  ███╗   ██╗███████╗ ██████╗ ███╗   ██╗
  ████╗  ██║██╔════╝██╔═══██╗████╗  ██║
  ██╔██╗ ██║█████╗  ██║   ██║██╔██╗ ██║
  ██║╚██╗██║██╔══╝  ██║   ██║██║╚██╗██║
  ██║ ╚████║███████╗╚██████╔╝██║ ╚████║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝\033[0m
'

_add_banner "Minimal_Arrow" '
\033[92m\033[1m
  ──────────────────────────────
   >> TERMUX
   >> ANDROID
   >> READY
  ──────────────────────────────\033[0m
'

_add_banner "Hacker_News" '
\033[91m\033[1m
  [!] SYSTEM BREACH DETECTED
  [!] ACCESSING MAINFRAME...
  [!] BYPASSING FIREWALL...
  [*] ACCESS GRANTED\033[0m
\033[92m  root@termux:~#\033[0m
'

_add_banner "Retro_Box" '
\033[93m\033[1m
  ╔══════════════════════════════╗
  ║   WELCOME TO TERMUX          ║
  ║   android ♥ linux            ║
  ╚══════════════════════════════╝\033[0m
'

_add_banner "Dragon" '
\033[91m\033[1m
      \   ^__^
       \  (oo)\_______
          (__)\       )\/\
              ||----w |
              ||     ||\033[0m
\033[38;5;208m  here be dragons.\033[0m
'

_add_banner "Skull" '
\033[97m\033[1m
     ░░░░░░░░░░░░░░░░░░
    ░░    ░░░░░░    ░░░
    ░░  ██░░░░░░██  ░░░
    ░░  ████░░████  ░░░
    ░░    ░░░░░░    ░░░
    ░░░░ ░░░░░░░░ ░░░░░
    ░░░░░░░░░░░░░░░░░░░\033[0m
'

_add_banner "Robot" '
\033[92m\033[1m
     .---.
    |     |
    | o o |
    |  ▽  |
    |_____|
   /|     |\
  (_|     |_)\033[0m
\033[2m\033[92m  beep boop.\033[0m
'

_add_banner "Space" '
\033[96m\033[1m
  ✦  .  ·  ✦  .  ·  ✦  .  ·  ✦
  ·  SPACE STATION TERMUX  ·  ✦
  ✦  .  ·  ✦  .  ·  ✦  .  ·  ✦\033[0m
'

_add_banner "Wave" '
\033[94m\033[1m
  ～～～～～～～～～～～～～～～～
    ❯  TERMUX READY
  ～～～～～～～～～～～～～～～～\033[0m
'

_add_banner "Fire" '
\033[91m\033[1m
    (  .      )
  )           (              )
       .  '  .   )      (
   (         (   .     |
     ) (      )   _____.,,,,.
  .( '  )    .,----===;;;===" \033[38;5;208m- TERMUX\033[0m
'

_add_banner "Binary" '
\033[92m\033[2m
  01010100 01000101 01010010
  01001101 01010101 01011000
\033[0m\033[92m\033[1m  TERMUX  |  ANDROID  |  LINUX\033[0m
'

_add_banner "Glitch" '
\033[95m\033[1m
  T̷̢͠E̷͎͝R̴͓͑M̶̬̃U̴̜͝X̵̙̌
\033[0m\033[2m\033[95m  g̵l̸i̷t̶c̵h̷ ̴i̸n̵ ̵t̶h̷e̴ ̷m̵a̵t̷r̷i̸x̴\033[0m
'

_add_banner "Mainul_Custom" '
\033[92m\033[1m
  +--------------------------+
  |  MAINUL - X              |
  |  . .                     |
  |  oo                      |
  | /||\                     |
  | (_;/)                    |
  |  android ♥ termux        |
  +--------------------------+\033[0m
'

_add_banner "CODEX_M41NUL" '
\033[38;5;208m\033[1m
   ██████╗ ██████╗ ██████╗ ███████╗██╗  ██╗
  ██╔════╝██╔═══██╗██╔══██╗██╔════╝╚██╗██╔╝
  ██║     ██║   ██║██║  ██║█████╗   ╚███╔╝
  ██║     ██║   ██║██║  ██║██╔══╝   ██╔██╗
  ╚██████╗╚██████╔╝██████╔╝███████╗██╔╝ ██╗
   ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝\033[0m
\033[92m  M41NUL  |  github.com/M41NUL\033[0m
'

_add_banner "Simple_Dash" '
\033[97m
  ─────────────────────────────────
   user : '"$(whoami)"'
   host : termux
   os   : android
  ─────────────────────────────────\033[0m
'

_add_banner "Powerline_Style" '
\033[42m\033[30m TERMUX \033[0m\033[32m\033[0m\033[44m\033[97m ANDROID \033[0m\033[34m\033[0m\033[46m\033[30m LINUX \033[0m\033[36m\033[0m
'

_add_banner "None" ''

# ── Apply banner ──────────────────────────────────────────────────────────────
apply_banner() {
    local name="$1"
    local content="${BANNERS[$name]}"

    mkdir -p "$(dirname "$MOTD_FILE")"

    if [ "$name" = "None" ]; then
        echo -n "" > "$MOTD_FILE"
        save_current "banner" "None"
        ok_msg "Banner removed."
        return
    fi

    # Write banner with escape interpretation
    printf "%b" "$content" > "$MOTD_FILE"
    save_current "banner" "$name"
    ok_msg "Banner applied: $name"
}

banner_menu() {
    while true; do
        clear_screen
        _print_banner
        echo -e "\n  ${O}${B}+$(printf '%0.s=' {1..44})+${RST}"
        echo -e "  ${O}${B}|${G}          BANNER MENU  --  X-THEME         ${O}|${RST}"
        echo -e "  ${O}${B}+$(printf '%0.s=' {1..44})+${RST}\n"

        local current; current=$(get_current "banner")
        [ -n "$current" ] && info_msg "Current banner: $current"
        echo ""

        local i=1
        for name in "${BANNER_NAMES[@]}"; do
            printf "  ${O}${B}[%2d]${RST}  ${W}%s${RST}\n" "$i" "$name"
            (( i++ ))
        done

        echo ""
        separator
        echo -e "  ${O}${B}[0]${RST}  ${W}Back${RST}"
        separator

        local choice
        choice=$(prompt_input "Enter banner number or 0 to go back")
        [ "$choice" = "0" ] && return

        if [[ "$choice" =~ ^[0-9]+$ ]]; then
            local idx=$(( choice - 1 ))
            local name="${BANNER_NAMES[$idx]}"
            if [ -n "$name" ]; then
                apply_banner "$name"
                echo ""
                info_msg "Preview:"
                printf "%b" "${BANNERS[$name]}"
                echo ""
                sleep 2
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

prompt_input() {
    local msg="$1"
    echo -ne "\n  ${O}${B}>${RST}  ${W}${msg}${RST}  " >&2
    read -r val
    echo "$val"
}
