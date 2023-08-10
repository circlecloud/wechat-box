#!/usr/bin/env bash
## https://gitlab.com/cunidev/gestures/-/wikis/xdotool-list-of-key-codes
function install() {
    while :
    do
        xdotool search 'Mono' >/dev/null 2>&1
        CHECK_MONO=$?
        if [ "$CHECK_MONO" == "0" ]; then
            xdotool key Return
        fi
        xdotool search 'unpack' >/dev/null 2>&1
        NOTFOUND=$?
        if [ "$NOTFOUND" == "0" ]; then
            break;
        fi
        sleep 0.5
    done
    echo "安装包开始解压..."
    while :
    do
        xdotool search 'unpack' >/dev/null 2>&1
        NOTFOUND=$?
        if [ "$NOTFOUND" != "0" ]; then
            break;
        fi
        sleep 0.5
    done
    echo "安装包解压完成 开始安装..."
    sleep 1
    while :
    do
        xdotool search '微信安装向导' >/dev/null 2>&1
        NOTFOUND=$?
        if [ "$NOTFOUND" == "0" ]; then
            sleep 1
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key space
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Return
            sleep 16
            xdotool key Tab
            sleep 0.5
            xdotool key Tab
            sleep 0.5
            xdotool key Return
            break
        fi
        sleep 3
    done
}

wine /WeChatSetup.exe >/dev/null 2>&1 &
echo "启动微信安装包..."
install
wait
sleep 5
