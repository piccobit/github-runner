FROM scratch

ENV ACTIONS_VERSION 2.160.2

WORKDIR actions-runner

RUN curl -O https://githubassets.azureedge.net/runners/2.160.2/actions-runner-linux-x64-2.160.2.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${ACTIONS_VERSION}.tar.gz \
    && ./config.sh --url https://github.com/piccobit/github-actions-test --token ${ACTIONS_TOKEN} \
    && rm ./actions-runner-linux-x64-${ACTIONS_VERSION}.tar.gz

CMD ./run.sh
