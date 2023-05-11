FROM miaowoo/wine:latest
COPY root/ /
# init with GUI
ARG WECHAT_DONWLOAD_URL
ARG INJECT_DLL_DONWLOAD_URL
RUN bash -c 'nohup /entrypoint.sh 2>&1 &' \
    && curl -sSL ${WECHAT_DONWLOAD_URL} -o /WeChatSetup.exe \
    && curl -sSL ${INJECT_DLL_DONWLOAD_URL} -o /WeChatInject.dll \
    && sleep 5 \
    && /payloads.sh \
    && rm -rf /WeChatSetup.exe \
    && sudo cp -r /wechat-etc/* /etc/ \
    && sudo rm /tmp/.X0-lock
# VNC
EXPOSE 8080
# API
EXPOSE 19088
#settings
ENTRYPOINT ["/wx-entrypoint.sh"]
