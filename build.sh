VERSION=${1:-3.9.5.81}
docker build \
    --build-arg WECHAT_DONWLOAD_URL=https://github.com/circlecloud/wechat-installer/raw/master/WeChatSetup-${VERSION}.exe \
    --build-arg INJECT_DLL_DONWLOAD_URL=https://github.com/circlecloud/wechat-installer/raw/master/wxhelper-${VERSION}.dll \
    -t miaowoo/wechat:${VERSION} .
