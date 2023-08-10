#!/usr/bin/env bash

function wechat() {
    while true; do
        if [ "$(pgrep -f wechat-start)" == "" ]; then
            wechat-start >/dev/null 2>&1 &
        fi
        sleep 5
    done
}

/entrypoint.sh >/dev/null 2>&1 &
sleep 5
sudo chown app:app '/home/app/WeChat Files/'
wine REG ADD 'HKEY_CURRENT_USER\Software\Tencent\WeChat' /v NeedUpdateType /t REG_DWORD /d 0 /f >/dev/null 2>&1
tail /tmp/wechat-forward.log -f &
tail /tmp/wechat-monitor.log -f &
wechat &
wait
