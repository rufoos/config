#!/bin/bash

menu() {
    local prompt="$1"
    local options="$2"
    local extra="$3"
    local preselect="$4"

    read -r -a args <<<"$extra"

    if [[ -n "$preselect" ]]; then
        local index
        index=$(echo -e "$options" | grep -nxF "$preselect" | cut -d: -f1)
        if [[ -n "$index" ]]; then
            args+=("-c" "$index")
        fi
    fi

    echo -e "$options" | omarchy-launch-walker --dmenu --width 295 --minheight 1 --maxheight 630 -p "$prompt…" "${args[@]}" 2>/dev/null
}

show_system_menu() {
    case $(menu "Language" "English\nRussian\n──────────────\nRestart\nConfigure\nExit\n") in
    *English*) fcitx5-remote -s keyboard-us ;;
    *Russian*) fcitx5-remote -s keyboard-ru ;;
    *Restart*) fcitx5-remote -r ;;
    *Configure*) fcitx5-configtool & ;;
    *Exit*) fcitx5-remote -x ;;
    esac
}

show_system_menu
