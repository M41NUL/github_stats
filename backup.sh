#!/data/data/com.termux/files/usr/bin/bash
# ─────────────────────────────────────────
#  X-THEME — backup.sh
#  Dev: Md. Mainul Islam (CODEX-M41NUL)
# ─────────────────────────────────────────

source "$(dirname "$0")/utils.sh"

BACKUP_DIR="$HOME/.xtheme_backup"

do_backup() {
    mkdir -p "$BACKUP_DIR"
    local ts; ts=$(date +"%Y%m%d_%H%M%S")
    local bdir="$BACKUP_DIR/$ts"
    mkdir -p "$bdir"

    [ -f "$COLORS_FILE" ]       && cp "$COLORS_FILE"       "$bdir/colors.properties"
    [ -f "$FONT_FILE" ]         && cp "$FONT_FILE"          "$bdir/font.ttf"
    [ -f "$HOME/.termux/motd" ] && cp "$HOME/.termux/motd"  "$bdir/motd"
    [ -f "$HOME/.termux/termux.properties" ] && cp "$HOME/.termux/termux.properties" "$bdir/termux.properties"
    [ -f "$BASHRC" ]            && cp "$BASHRC"             "$bdir/.bashrc"
    [ -f "$ZSHRC" ]             && cp "$ZSHRC"              "$bdir/.zshrc"
    [ -f "$CURRENT_FILE" ]      && cp "$CURRENT_FILE"       "$bdir/.xtheme_current"

    ok_msg "Backup saved: $ts"
    echo "$ts" > "$BACKUP_DIR/latest"
}

list_backups() {
    if [ ! -d "$BACKUP_DIR" ] || [ -z "$(ls -A "$BACKUP_DIR" 2>/dev/null)" ]; then
        warn_msg "No backups found."
        return 1
    fi
    local i=1
    local dirs=()
    for d in "$BACKUP_DIR"/*/; do
        [ -d "$d" ] && dirs+=("$(basename "$d")")
    done
    for name in "${dirs[@]}"; do
        printf "  ${O}${B}[%2d]${RST}  ${W}%s${RST}\n" "$i" "$name"
        (( i++ ))
    done
    echo "${dirs[@]}"
}

do_restore() {
    local ts="$1"
    local bdir="$BACKUP_DIR/$ts"
    [ ! -d "$bdir" ] && { err_msg "Backup not found: $ts"; return 1; }

    mkdir -p "$HOME/.termux"
    [ -f "$bdir/colors.properties" ] && cp "$bdir/colors.properties" "$COLORS_FILE"
    [ -f "$bdir/font.ttf" ]          && cp "$bdir/font.ttf"          "$FONT_FILE"
    [ -f "$bdir/motd" ]              && cp "$bdir/motd"               "$HOME/.termux/motd"
    [ -f "$bdir/termux.properties" ] && cp "$bdir/termux.properties"  "$HOME/.termux/termux.properties"
    [ -f "$bdir/.bashrc" ]           && cp "$bdir/.bashrc"            "$BASHRC"
    [ -f "$bdir/.zshrc" ]            && cp "$bdir/.zshrc"             "$ZSHRC"
    [ -f "$bdir/.xtheme_current" ]   && cp "$bdir/.xtheme_current"    "$CURRENT_FILE"

    ok_msg "Restored: $ts"
    apply_termux
}

delete_backup() {
    local ts="$1"
    local bdir="$BACKUP_DIR/$ts"
    [ -d "$bdir" ] && rm -rf "$bdir" && ok_msg "Deleted: $ts"
}

backup_menu() {
    while true; do
        clear_screen
        _print_banner
        echo -e "\n  ${O}${B}+$(printf '%0.s=' {1..44})+${RST}"
        echo -e "  ${O}${B}|${G}        BACKUP MENU  --  X-THEME           ${O}|${RST}"
        echo -e "  ${O}${B}+$(printf '%0.s=' {1..44})+${RST}\n"

        _option_line "1" "Create Backup"  "Save current theme/font/prompt/keys"
        _option_line "2" "Restore Backup" "Restore a previous backup"
        _option_line "3" "Delete Backup"  "Remove a saved backup"
        _option_line "4" "List Backups"   "Show all saved backups"
        _option_line "0" "Back"           ""
        separator

        local choice
        choice=$(prompt_input_fn "Select option")

        case "$choice" in
            1)
                progress_bar "Creating backup"
                do_backup
                sleep 1 ;;
            2)
                echo ""
                info_msg "Available backups:"
                local dirs=()
                for d in "$BACKUP_DIR"/*/; do
                    [ -d "$d" ] && dirs+=("$(basename "$d")")
                done
                if [ ${#dirs[@]} -eq 0 ]; then
                    warn_msg "No backups found."
                    sleep 1; continue
                fi
                local i=1
                for name in "${dirs[@]}"; do
                    printf "  ${O}${B}[%2d]${RST}  ${W}%s${RST}\n" "$i" "$name"
                    (( i++ ))
                done
                local sel
                sel=$(prompt_input_fn "Select backup number")
                if [[ "$sel" =~ ^[0-9]+$ ]]; then
                    local idx=$(( sel - 1 ))
                    [ -n "${dirs[$idx]}" ] && { progress_bar "Restoring"; do_restore "${dirs[$idx]}"; }
                fi
                sleep 1 ;;
            3)
                echo ""
                local dirs=()
                for d in "$BACKUP_DIR"/*/; do
                    [ -d "$d" ] && dirs+=("$(basename "$d")")
                done
                if [ ${#dirs[@]} -eq 0 ]; then
                    warn_msg "No backups found."
                    sleep 1; continue
                fi
                local i=1
                for name in "${dirs[@]}"; do
                    printf "  ${O}${B}[%2d]${RST}  ${W}%s${RST}\n" "$i" "$name"
                    (( i++ ))
                done
                local sel
                sel=$(prompt_input_fn "Select backup to delete")
                if [[ "$sel" =~ ^[0-9]+$ ]]; then
                    local idx=$(( sel - 1 ))
                    [ -n "${dirs[$idx]}" ] && delete_backup "${dirs[$idx]}"
                fi
                sleep 1 ;;
            4)
                echo ""
                list_backups
                echo ""
                prompt_input_fn "Press ENTER to continue" >/dev/null ;;
            0) return ;;
            *) warn_msg "Invalid option."; sleep 1 ;;
        esac
    done
}

_option_line() {
    echo -e "  ${O}${B}[$1]${RST}  ${G}${B}$2${RST}"
    [ -n "$3" ] && echo -e "        ${DIM}${W}$3${RST}"
    echo ""
}

prompt_input_fn() {
    local msg="$1"
    echo -ne "\n  ${O}${B}>${RST}  ${W}${msg}${RST}  " >&2
    read -r val
    echo "$val"
}
