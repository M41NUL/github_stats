#!/data/data/com.termux/files/usr/bin/bash
# ─────────────────────────────────────────
#  X-THEME — themes.sh
#  Dev: Md. Mainul Islam (CODEX-M41NUL)
# ─────────────────────────────────────────

source "$(dirname "$0")/utils.sh"

# ── Theme definitions ─────────────────────────────────────────────────────────
# Format: name|background|foreground|color0..color15
# Each theme = name + 18 hex values (bg, fg, c0-c15)

declare -A THEMES
declare -a THEME_NAMES

_add_theme() {
    local name="$1"; shift
    THEMES["$name"]="$*"
    THEME_NAMES+=("$name")
}

# ── HACKER / CYBER themes ─────────────────────────────────────────────────────
_add_theme "Matrix"         "#0d0d0d #00ff41 #0d0d0d #003b00 #004d00 #006600 #008000 #009900 #00b300 #00cc00 #00e600 #00ff00 #39ff14 #57ff2f #75ff4a #93ff65"
_add_theme "H4CK3R"         "#0a0a0a #ff2052 #0a0a0a #1a0000 #330000 #4d0000 #800020 #cc0033 #ff0040 #ff2052 #ff4070 #ff6090 #ff80a8 #ffa0c0 #ffc0d8 #ffe0f0"
_add_theme "Cyberpunk"      "#0d0019 #ffe600 #0d0019 #1a0033 #2d0059 #4b0082 #6600cc #9900ff #b31aff #cc33ff #e066ff #ff00ff #ff33ff #ff66ff #ff99ff #ffccff"
_add_theme "Blood"          "#0a0000 #ff1a1a #0a0000 #1a0000 #330000 #4d0000 #660000 #800000 #990000 #b30000 #cc0000 #e60000 #ff0000 #ff1a1a #ff3333 #ff4d4d"
_add_theme "Ghost"          "#000000 #e8e8e8 #000000 #1c1c1c #383838 #555555 #717171 #8e8e8e #aaaaaa #c6c6c6 #e2e2e2 #ffffff #f0f0f0 #d8d8d8 #c0c0c0 #a8a8a8"
_add_theme "Neon"           "#0a0a0a #00ffff #0a0a0a #001a1a #003333 #004d4d #006666 #008080 #009999 #00b3b3 #00cccc #00e5e5 #00ffff #33ffff #66ffff #99ffff"
_add_theme "Midnight_Hack"  "#010409 #58a6ff #010409 #0d1117 #161b22 #21262d #30363d #484f58 #6e7681 #8b949e #b1bac4 #c9d1d9 #f0f6fc #58a6ff #79c0ff #a5d6ff"
_add_theme "Red_Alert"      "#0d0000 #ff4444 #0d0000 #1a0000 #2d0000 #400000 #520000 #660000 #7a0000 #8d0000 #a00000 #b30000 #cc0000 #ff0000 #ff3333 #ff6666"
_add_theme "Toxic"          "#001a00 #aaff00 #001a00 #003300 #004d00 #006600 #338000 #4da600 #66cc00 #80f200 #99ff00 #aaff00 #bbff33 #ccff66 #ddff99 #eeffcc"
_add_theme "Void"           "#000000 #cc00ff #000000 #0d0020 #1a0040 #260060 #330080 #4000a0 #4d00c0 #5900e0 #6600ff #7a1aff #8c33ff #a04dff #b366ff #cc80ff"

# ── POPULAR themes ────────────────────────────────────────────────────────────
_add_theme "Dracula"        "#282a36 #f8f8f2 #21222c #ff5555 #50fa7b #ffb86c #8be9fd #bd93f9 #ff79c6 #6272a4 #f1fa8c #ffffa5 #ff6e6e #69ff94 #d6acff #ff92df"
_add_theme "Nord"           "#2e3440 #d8dee9 #3b4252 #bf616a #a3be8c #ebcb8b #81a1c1 #b48ead #88c0d0 #4c566a #d08770 #e5e9f0 #eceff4 #8fbcbb #5e81ac #bf616a"
_add_theme "Monokai"        "#272822 #f8f8f2 #272822 #f92672 #a6e22e #f4bf75 #66d9e8 #ae81ff #a1efe4 #75715e #fd971f #f92672 #a6e22e #f4bf75 #66d9e8 #ae81ff"
_add_theme "Gruvbox_Dark"   "#282828 #ebdbb2 #282828 #cc241d #98971a #d79921 #458588 #b16286 #689d6a #a89984 #fb4934 #b8bb26 #fabd2f #83a598 #d3869b #8ec07c"
_add_theme "Gruvbox_Light"  "#fbf1c7 #3c3836 #fbf1c7 #9d0006 #79740e #b57614 #076678 #8f3f71 #427b58 #928374 #cc241d #98971a #d79921 #458588 #b16286 #689d6a"
_add_theme "Solarized_Dark" "#002b36 #839496 #073642 #dc322f #859900 #b58900 #268bd2 #d33682 #2aa198 #657b83 #cb4b16 #586e75 #657b83 #839496 #6c71c4 #93a1a1"
_add_theme "Solarized_Light" "#fdf6e3 #657b83 #eee8d5 #dc322f #859900 #b58900 #268bd2 #d33682 #2aa198 #073642 #cb4b16 #002b36 #839496 #657b83 #6c71c4 #93a1a1"
_add_theme "Tokyo_Night"    "#1a1b26 #c0caf5 #16161e #f7768e #9ece6a #e0af68 #7aa2f7 #bb9af7 #7dcfff #414868 #ff9e64 #73daca #b4f9f8 #2ac3de #89ddff #cfc9c2"
_add_theme "One_Dark"       "#282c34 #abb2bf #282c34 #e06c75 #98c379 #e5c07b #61afef #c678dd #56b6c2 #5c6370 #be5046 #2c313a #3e4452 #545862 #c8ccd4 #abb2bf"
_add_theme "Catppuccin"     "#1e1e2e #cdd6f4 #181825 #f38ba8 #a6e3a1 #f9e2af #89b4fa #cba6f7 #89dceb #45475a #fab387 #f38ba8 #a6e3a1 #f9e2af #89b4fa #cba6f7"
_add_theme "Rose_Pine"      "#191724 #e0def4 #1f1d2e #eb6f92 #31748f #f6c177 #9ccfd8 #c4a7e7 #ebbcba #26233a #21202e #403d52 #524f67 #6e6a86 #908caa #e0def4"
_add_theme "Kanagawa"       "#1f1f28 #dcd7ba #16161d #c34043 #76946a #c0a36e #7e9cd8 #957fb8 #6a9589 #717c7c #ff5d62 #98bb6c #e6c384 #7fb4ca #938aa9 #7aa89f"
_add_theme "Everforest"     "#2d353b #d3c6aa #343f44 #e67e80 #a7c080 #dbbc7f #7fbbb3 #d699b6 #83c092 #859289 #e69875 #e67e80 #a7c080 #dbbc7f #7fbbb3 #d699b6"

# ── MINIMAL / CLEAN themes ────────────────────────────────────────────────────
_add_theme "Pure_Dark"      "#0a0a0a #eeeeee #0a0a0a #1a1a1a #2a2a2a #3a3a3a #4a4a4a #5a5a5a #6a6a6a #7a7a7a #8a8a8a #9a9a9a #aaaaaa #bbbbbb #cccccc #dddddd"
_add_theme "Pure_Light"     "#ffffff #222222 #f5f5f5 #222222 #444444 #666666 #888888 #aaaaaa #cccccc #eeeeee #dddddd #bbbbbb #999999 #777777 #555555 #333333"
_add_theme "Paper"          "#f2efe2 #3d3d3d #e8e4d5 #b85c00 #3d6e00 #b8860b #2c5f8a #8a3d6e #2c8a6e #7a7a6a #d4721a #4d8a00 #d4a81a #3a7ab8 #b84d8a #3ab8a0"
_add_theme "Minimal_Blue"   "#0a0f1e #c8d8f0 #0f1a2e #1a3a6e #2a5a9e #3a7ace #4a9aee #5aaafe #6abafe #7acafe #8adafe #9aeafe #aafafe #bbfcff #ccfeff #ddfeff"

# ── RETRO themes ──────────────────────────────────────────────────────────────
_add_theme "Retro_Green"    "#0a0f0a #33ff33 #0a0f0a #001a00 #003300 #004d00 #006600 #008000 #009900 #00b300 #00cc00 #00e600 #33ff33 #66ff66 #99ff99 #ccffcc"
_add_theme "Retro_Amber"    "#0d0800 #ffb300 #0d0800 #1a1000 #2d1c00 #402800 #523300 #663f00 #7a4a00 #8d5600 #a06100 #b36c00 #cc7a00 #ffb300 #ffc933 #ffdb66"
_add_theme "C64"            "#40318d #7869c4 #000000 #883932 #55a049 #bfce72 #40318d #7869c4 #6c5eb5 #af2a29 #70a04a #ffffb2 #6c5eb5 #7869c4 #a57eab #ffffff"
_add_theme "DOS"            "#000000 #aaaaaa #000000 #aaaaaa #00aaaa #aa5500 #0000aa #aa00aa #00aaaa #555555 #5555ff #55ff55 #55ffff #ff5555 #ff55ff #ffff55"

# ── NATURE themes ─────────────────────────────────────────────────────────────
_add_theme "Forest"         "#1a2312 #c8d8a8 #1a2312 #2d3d1a #3d5522 #4d6e2b #5d8833 #6da23c #7dbc44 #8dd64d #9de055 #adea5e #bdf466 #cdfe6f #ddffa8 #eeffcc"
_add_theme "Ocean"          "#011627 #d6deeb #011627 #ef5350 #22da6e #addb67 #82aaff #c792ea #21c7a8 #575656 #7fdbca #f78c6c #ffeb95 #80cbc4 #c792ea #d6deeb"
_add_theme "Sunset"         "#1a0a0f #ffb3ba #1a0a0f #660033 #993344 #cc3355 #ff3366 #ff6688 #ff99aa #ffbbcc #ffd0d8 #ffe0e8 #ffb347 #ffcc44 #ffd966 #ffe680"
_add_theme "Arctic"         "#0d1b2e #e8f4f8 #0d1b2e #1a3a5c #2a5f8f #3a84c2 #4aaaf5 #7fc4f8 #aaddfb #cceeff #d5f0ff #e0f5ff #edfaff #f5fdff #ffffff #a8d8ea"

# ── SPECIAL themes ────────────────────────────────────────────────────────────
_add_theme "Synthwave"      "#2b213a #ff7edb #2b213a #ff2b6d #05ffa1 #ffd319 #0ff0fc #ff2b6d #f9f4da #3b2354 #ff6c00 #d1ff00 #ff71ce #b967ff #05ffa1 #fffb96"
_add_theme "Outrun"         "#0d0221 #ff7edb #0d0221 #ff2b6d #0aff12 #ffd319 #4d9bff #ff2b6d #05ffa1 #2b0d6e #ff6c00 #d1ff00 #ff71ce #b967ff #01cdfe #fffb96"
_add_theme "Vaporwave"      "#211e31 #cdd3de #211e31 #ff71ce #05ffa1 #fffb96 #01cdfe #b967ff #ff71ce #6b6882 #ff9de2 #4dffb4 #ffffba #4dffff #d4b3ff #ffffff"
_add_theme "Pastel"         "#fafafa #5c5c5c #fafafa #ff8a80 #ccff90 #ffd180 #80d8ff #ea80fc #a7ffeb #bdbdbd #ff6e40 #b2ff59 #ffff00 #40c4ff #e040fb #64ffda"
_add_theme "Mellow"         "#1e1e28 #cdd1de #1e1e28 #e28c8c #b1e3ad #ebdd9c #a4d1db #c3a8d1 #8cbdb9 #5b5e6f #e08080 #a8d4a3 #e8d88f #9cc9d5 #b8a0cc #84b5b1"

# ── Apply theme ───────────────────────────────────────────────────────────────
apply_theme() {
    local name="$1"
    local data="${THEMES[$name]}"
    if [ -z "$data" ]; then
        err_msg "Theme not found: $name"
        return 1
    fi

    mkdir -p "$HOME/.termux"
    local cols=($data)
    local bg="${cols[0]}"
    local fg="${cols[1]}"

    cat > "$COLORS_FILE" << COLORS
background=$bg
foreground=$fg
cursor=$fg
color0=${cols[2]}
color1=${cols[3]}
color2=${cols[4]}
color3=${cols[5]}
color4=${cols[6]}
color5=${cols[7]}
color6=${cols[8]}
color7=${cols[9]}
color8=${cols[10]}
color9=${cols[11]}
color10=${cols[12]}
color11=${cols[13]}
color12=${cols[14]}
color13=${cols[15]}
color14=${cols[2]}
color15=${cols[1]}
COLORS

    save_current "theme" "$name"
    ok_msg "Theme applied: $name"
    apply_termux
}

# ── Theme menu ────────────────────────────────────────────────────────────────
theme_menu() {
    while true; do
        clear_screen
        _print_banner
        echo -e "\n  ${O}${B}+$(printf '%0.s=' {1..44})+${RST}"
        echo -e "  ${O}${B}|${G}           THEME MENU  --  X-THEME         ${O}|${RST}"
        echo -e "  ${O}${B}+$(printf '%0.s=' {1..44})+${RST}\n"

        local current; current=$(get_current "theme")
        [ -n "$current" ] && info_msg "Current: $current"
        echo ""

        # Categories
        echo -e "  ${R}${B}[ HACKER / CYBER ]${RST}"
        _list_themes 0 9
        echo ""
        echo -e "  ${CY}${B}[ POPULAR ]${RST}"
        _list_themes 10 23
        echo ""
        echo -e "  ${G}${B}[ MINIMAL / RETRO / NATURE / SPECIAL ]${RST}"
        _list_themes 24 ${#THEME_NAMES[@]}
        echo ""
        separator
        echo -e "  ${O}${B}[0]${RST}  ${W}Back${RST}"
        separator

        local choice
        choice=$(prompt_input "Enter theme number or 0 to go back")
        [ "$choice" = "0" ] && return

        if [[ "$choice" =~ ^[0-9]+$ ]]; then
            local idx=$(( choice - 1 ))
            local name="${THEME_NAMES[$idx]}"
            if [ -n "$name" ]; then
                progress_bar "Applying $name"
                apply_theme "$name"
                ok_msg "Reloading Termux..."
                sleep 1
                apply_termux
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

_list_themes() {
    local start=$1
    local end=$2
    local i=$start
    while [ $i -lt $end ] && [ $i -lt ${#THEME_NAMES[@]} ]; do
        printf "  ${O}${B}[%2d]${RST}  ${W}%s${RST}\n" $(( i + 1 )) "${THEME_NAMES[$i]}"
        (( i++ ))
    done
}

prompt_input() {
    local msg="$1"
    echo -ne "\n  ${O}${B}>${RST}  ${W}${msg}${RST}  " >&2
    read -r val
    echo "$val"
}
