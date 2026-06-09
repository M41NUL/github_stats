#!/data/data/com.termux/files/usr/bin/bash
# ─────────────────────────────────────────
#  X-THEME — fonts.sh
#  Dev: Md. Mainul Islam (CODEX-M41NUL)
# ─────────────────────────────────────────

source "$(dirname "$0")/utils.sh"

FONT_BASE_URL="https://raw.githubusercontent.com/M41NUL/X-THEME/main/fonts"

# Font list: name|filename
FONT_LIST=(
    "JetBrains Mono|JetBrainsMono-Regular.ttf"
    "Fira Code|FiraCode-Regular.ttf"
    "Hack|Hack-Regular.ttf"
    "Source Code Pro|SourceCodePro-Regular.ttf"
    "Inconsolata|Inconsolata-Regular.ttf"
    "Ubuntu Mono|UbuntuMono-Regular.ttf"
    "Cascadia Code|CascadiaCode-Regular.ttf"
    "Iosevka|Iosevka-Regular.ttf"
    "Mononoki|Mononoki-Regular.ttf"
    "Space Mono|SpaceMono-Regular.ttf"
    "Roboto Mono|RobotoMono-Regular.ttf"
    "Cousine|Cousine-Regular.ttf"
    "DejaVu Sans Mono|DejaVuSansMono.ttf"
    "Liberation Mono|LiberationMono-Regular.ttf"
    "Noto Mono|NotoMono-Regular.ttf"
    "Overpass Mono|OverpassMono-Regular.ttf"
    "Share Tech Mono|ShareTechMono-Regular.ttf"
    "Anonymous Pro|AnonymousPro-Regular.ttf"
    "IBM Plex Mono|IBMPlexMono-Regular.ttf"
    "Caskaydia Cove|CaskaydiaCoVE-Regular.ttf"
    "Victor Mono|VictorMono-Regular.ttf"
    "Maple Mono|MapleMono-Regular.ttf"
    "Rec Mono|RecMono-Regular.ttf"
    "Commit Mono|CommitMono-Regular.ttf"
    "Geist Mono|GeistMono-Regular.ttf"
    "Lilex|Lilex-Regular.ttf"
    "Fantasque Sans|FantasqueSansMono-Regular.ttf"
    "Agave|Agave-Regular.ttf"
    "BigBlue Terminal|BigBlue_Terminal_437TT.ttf"
    "Terminus|Terminus.ttf"
    "Proggy Clean|ProggyClean.ttf"
    "Envy Code R|EnvyCodeR-Regular.ttf"
    "Oxygen Mono|OxygenMono-Regular.ttf"
    "PT Mono|PTMono-Regular.ttf"
    "Cutive Mono|CutiveMono-Regular.ttf"
    "Nova Mono|NovaMono-Regular.ttf"
    "VT323|VT323-Regular.ttf"
    "Press Start 2P|PressStart2P-Regular.ttf"
    "Pixelify Sans|PixelifySans-Regular.ttf"
    "Silkscreen|Silkscreen-Regular.ttf"
    "Courier Prime|CourierPrime-Regular.ttf"
    "Martian Mono|MartianMono-Regular.ttf"
    "Azeret Mono|AzeretMono-Regular.ttf"
    "B612 Mono|B612Mono-Regular.ttf"
    "DM Mono|DMMono-Regular.ttf"
    "Syne Mono|SyneMono-Regular.ttf"
    "Xanh Mono|XanhMono-Regular.ttf"
    "Major Mono|MajorMonoDisplay-Regular.ttf"
    "Chivo Mono|ChivoMono-Regular.ttf"
    "Fragment Mono|FragmentMono-Regular.ttf"
)

apply_font() {
    local name="$1"
    local filename="$2"
    local url="$FONT_BASE_URL/$filename"

    info_msg "Downloading: $name"
    progress_bar "Downloading font"

    if curl -fsSL "$url" -o "$FONT_FILE" 2>/dev/null; then
        save_current "font" "$name"
        ok_msg "Font applied: $name"
        apply_termux
    else
        err_msg "Download failed. Check internet connection."
        warn_msg "URL: $url"
    fi
}

reset_font() {
    rm -f "$FONT_FILE"
    save_current "font" "Default"
    ok_msg "Font reset to Termux default."
    apply_termux
}

font_menu() {
    while true; do
        clear_screen
        _print_banner
        echo -e "\n  ${O}${B}+$(printf '%0.s=' {1..44})+${RST}"
        echo -e "  ${O}${B}|${G}           FONT MENU  --  X-THEME          ${O}|${RST}"
        echo -e "  ${O}${B}+$(printf '%0.s=' {1..44})+${RST}\n"

        local current; current=$(get_current "font")
        [ -n "$current" ] && info_msg "Current font: $current"
        echo ""

        local i=1
        for entry in "${FONT_LIST[@]}"; do
            local fname; fname=$(echo "$entry" | cut -d'|' -f1)
            printf "  ${O}${B}[%2d]${RST}  ${W}%s${RST}\n" "$i" "$fname"
            (( i++ ))
        done

        echo ""
        echo -e "  ${O}${B}[r]${RST}  ${W}Reset to default font${RST}"
        echo -e "  ${O}${B}[0]${RST}  ${W}Back${RST}"
        separator

        local choice
        choice=$(prompt_input "Enter font number or 0 to go back")

        [ "$choice" = "0" ] && return
        [ "$choice" = "r" ] && { reset_font; sleep 1; continue; }

        if [[ "$choice" =~ ^[0-9]+$ ]]; then
            local idx=$(( choice - 1 ))
            local entry="${FONT_LIST[$idx]}"
            if [ -n "$entry" ]; then
                local fname; fname=$(echo "$entry" | cut -d'|' -f1)
                local ffile; ffile=$(echo "$entry" | cut -d'|' -f2)
                apply_font "$fname" "$ffile"
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

prompt_input() {
    local msg="$1"
    echo -ne "\n  ${O}${B}>${RST}  ${W}${msg}${RST}  " >&2
    read -r val
    echo "$val"
}
