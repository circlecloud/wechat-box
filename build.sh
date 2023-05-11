docker build \
    --build-arg WECHAT_DONWLOAD_URL=https://github.com/circlecloud/wechat-installer/raw/master/WeChatSetup-3.9.2.23.exe \
    --build-arg INJECT_DLL_DONWLOAD_URL=https://github.com/circlecloud/wechat-installer/raw/master/wxhelper-3.9.2.23.dll \
    -t miaowoo/wechat .
