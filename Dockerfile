FROM miaowoo/wine:latest

COPY wechat-installer/ /
# init with GUI
ARG WECHAT_DONWLOAD_URL
ARG INJECT_DLL_DONWLOAD_URL
RUN bash -c 'nohup /entrypoint.sh 2>&1 &' \
    && sudo curl -sSL ${WECHAT_DONWLOAD_URL} -o /WeChatSetup.exe \
    && sudo curl -sSL ${INJECT_DLL_DONWLOAD_URL} -o /WeChatInject.dll \
    && sleep 5 \
    && /payloads.sh \
    && sudo rm -rf /WeChatSetup.exe /payloads /payloads.sh \
    && sudo rm /tmp/.X0-lock

COPY root/ /

COPY wechat-forward/ /

# VNC
EXPOSE 8080
# wxhelper API
EXPOSE 19088
# API
EXPOSE 9080
#settings
ENTRYPOINT ["/wx-entrypoint.sh"]
