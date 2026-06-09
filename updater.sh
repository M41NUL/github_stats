#!/data/data/com.termux/files/usr/bin/bash
# ─────────────────────────────────────────
#  X-THEME — updater.sh
#  Dev: Md. Mainul Islam (CODEX-M41NUL)
# ─────────────────────────────────────────

source "$(dirname "$0")/utils.sh"

CURRENT_VERSION="1.0.0"
VERSION_URL="https://raw.githubusercontent.com/M41NUL/X-THEME/main/version.txt"
BASE_URL="https://raw.githubusercontent.com/M41NUL/X-THEME/main"
SCRIPT_DIR="$(dirname "$0")"

FILES_TO_UPDATE=(
    "x-theme.sh"
    "utils.sh"
    "themes.sh"
    "fonts.sh"
    "banners.sh"
    "prompts.sh"
    "extrakeys.sh"
    "backup.sh"
    "updater.sh"
)

_version_gt() {
    [ "$(printf '%s\n' "$2" "$1" | sort -V | head -n1)" != "$1" ]
}

check_and_update() {
    local frames=("|" "/" "-" "\\")
    local i=0
    local end_at=$(( $(date +%s) + 5 ))

    while [ "$(date +%s)" -lt "$end_at" ]; do
        printf "\r  ${G}${B}%s${RST}  ${W}Checking for updates...${RST}  " "${frames[$((i % 4))]}"
        sleep 0.1
        (( i++ ))
    done

    local remote_ver
    remote_ver=$(curl -fsSL "$VERSION_URL" 2>/dev/null | tr -d '[:space:]')

    if [ -z "$remote_ver" ]; then
        printf "\r  ${O}${B}!${RST}  ${W}Could not reach GitHub. Skipping update.${RST}      \n"
        return
    fi

    if _version_gt "$remote_ver" "$CURRENT_VERSION"; then
        printf "\r  ${G}${B}+${RST}  ${W}Update found: v%s -> v%s${RST}      \n" \
               "$CURRENT_VERSION" "$remote_ver"
        _apply_update
    else
        printf "\r  ${G}${B}+${RST}  ${W}Already up to date (v%s)${RST}      \n" \
               "$CURRENT_VERSION"
    fi
}

_apply_update() {
    info_msg "Downloading updates..."
    local failed=0
    for fname in "${FILES_TO_UPDATE[@]}"; do
        local url="$BASE_URL/$fname"
        local dst="$SCRIPT_DIR/$fname"
        if curl -fsSL "$url" -o "$dst" 2>/dev/null; then
            chmod +x "$dst"
        else
            warn_msg "Failed to update: $fname"
            (( failed++ ))
        fi
    done
    [ "$failed" -eq 0 ] && ok_msg "Update complete!" || warn_msg "Some files failed."
    sleep 1
}
