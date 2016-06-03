FROM ubuntu:14.04

RUN set -x         && \
    apt-get update && \
    apt-get clean

RUN set -x                                                             && \
    apt-get install -y openssl libcurl4-openssl-dev libxml2 libssl-dev    \
                       libxml2-dev pinentry-curses curl make unzip     && \
    apt-get clean

RUN apt-get install -y gettext-base

ENV VER 0.8.1

RUN set -x                                                               && \
    curl -OL https://github.com/lastpass/lastpass-cli/archive/${VER}.zip && \
    echo bdc9f7526525a359d23d75d7afe5db77 ${VER}.zip | md5sum -c -       && \
    unzip ${VER}.zip && rm ${VER}.zip                                    && \
    cd lastpass-cli-${VER}                                               && \
    make && make install                                                 && \
    cd / && rm -rf /lastpass-cli-${VER}

ADD bin/bash-askpass /usr/local/bin/bash-askpass
ADD bin/quiet-askpass /usr/local/bin/quiet-askpass

VOLUME /root/.lpass

ENTRYPOINT ["/usr/bin/lpass"]
