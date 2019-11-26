FROM ubuntu:latest

ENV ACTIONS_VERSION 2.160.2

WORKDIR actions-runner

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y curl

RUN curl -LsSO https://githubassets.azureedge.net/runners/2.160.2/actions-runner-linux-x64-2.160.2.tar.gz
RUN tar xzf ./actions-runner-linux-x64-${ACTIONS_VERSION}.tar.gz
RUN ./config.sh --url https://github.com/piccobit/github-actions-test --token ${ACTIONS_TOKEN}
RUN rm ./actions-runner-linux-x64-${ACTIONS_VERSION}.tar.gz

CMD ./run.sh
