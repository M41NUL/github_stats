#!/data/data/com.termux/files/usr/bin/bash
# ─────────────────────────────────────────
#  X-THEME — installer.sh
#  Dev: Md. Mainul Islam (CODEX-M41NUL)
# ─────────────────────────────────────────

G="\033[92m"
R="\033[91m"
O="\033[38;5;208m"
W="\033[97m"
B="\033[1m"
DIM="\033[2m"
RST="\033[0m"

clear

echo -e "${G}${B}"
echo "  ██╗  ██╗      ████████╗██╗  ██╗███████╗███╗   ███╗███████╗"
echo "  ╚██╗██╔╝      ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝"
echo "   ╚███╔╝  █████╗  ██║   ███████║█████╗  ██╔████╔██║█████╗  "
echo "   ██╔██╗  ╚════╝  ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  "
echo "  ██╔╝ ██╗         ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗"
echo "  ╚═╝  ╚═╝         ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝"
echo -e "${RST}"
echo -e "  ${O}${B}Installer  v1.0.0  |  github.com/M41NUL${RST}"
echo -e "  ${W}Termux Theme, Font, Banner, Prompt, Keys Customizer${RST}"
echo ""
echo -e "  ${O}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RST}"
echo ""

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
        printf "\r  ${W}%-22s${RST}  ${bc}${B}[%-28s]${RST}  ${W}%3d%%${RST}" \
               "$label" "${arrow}${empty}" "$pct"
        sleep 0.03
    done
    echo ""
}

ok_msg()   { echo -e "  ${G}${B}+${RST}  ${W}$1${RST}"; }
skip_msg() { echo -e "  ${O}${B}o${RST}  ${DIM}${W}$1  (already installed)${RST}"; }
step_msg() { echo -e "\n  ${O}${B}>${RST}  ${W}$1${RST}"; }

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FLAG_FILE="$SCRIPT_DIR/.installed"
STORAGE_FLAG="$SCRIPT_DIR/.storage_granted"

if [ -f "$FLAG_FILE" ]; then
    echo -e "  ${G}${B}+  Already installed! Launching X-THEME...${RST}\n"
    sleep 1
    cd "$SCRIPT_DIR"
    bash x-theme.sh
    exit 0
fi

step_msg "Updating package lists..."
progress_bar "apt update"
apt update -y -q 2>/dev/null
ok_msg "Package lists updated"

step_msg "Checking curl..."
if command -v curl &>/dev/null; then
    skip_msg "curl"
else
    progress_bar "Installing curl"
    apt install -y -q curl 2>/dev/null
    ok_msg "curl installed"
fi

step_msg "Checking git..."
if command -v git &>/dev/null; then
    skip_msg "git"
else
    progress_bar "Installing git"
    apt install -y -q git 2>/dev/null
    ok_msg "git installed"
fi

step_msg "Checking termux-tools..."
if command -v termux-reload-settings &>/dev/null; then
    skip_msg "termux-tools"
else
    progress_bar "Installing termux-tools"
    apt install -y -q termux-tools 2>/dev/null
    ok_msg "termux-tools installed"
fi

echo ""
echo -e "  ${O}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RST}"

if [ -f "$STORAGE_FLAG" ] || [ -d "/sdcard/Android" ]; then
    echo -e "\n  ${G}${B}+  Storage permission already granted. Skipping.${RST}"
else
    echo -e "\n  ${G}${B}  Requesting Android storage permission...${RST}"
    echo -e "  ${W}A dialog will appear -- tap ALLOW to enable /sdcard access.${RST}\n"
    termux-setup-storage
    sleep 2
    touch "$STORAGE_FLAG"
    ok_msg "Storage permission granted"
fi

# Make all scripts executable
chmod +x "$SCRIPT_DIR"/*.sh

touch "$FLAG_FILE"

echo ""
echo -e "  ${O}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RST}"
echo -e "\n  ${G}${B}+  Installation complete!${RST}\n"

for i in 3 2 1; do
    printf "\r  ${O}${B}Starting X-THEME in ${G}$i${O}...${RST}   "
    sleep 1
done
echo -e "\r  ${G}${B}Launching X-THEME...${RST}              \n"

cd "$SCRIPT_DIR"
bash x-theme.sh
