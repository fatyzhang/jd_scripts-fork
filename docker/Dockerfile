FROM node:lts-alpine3.14

LABEL AUTHOR="none" \
      VERSION=0.1.4

ENV DEFAULT_LIST_FILE=crontab_list.sh \
    CUSTOM_LIST_MERGE_TYPE=append \
    COOKIES_LIST=/scripts/logs/cookies.list \
    REPO_URL=https://github.com.cnpmjs.org/Sirius2016/jd_scripts-fork.git \
    REPO_BRANCH=main

RUN set -ex \
    && echo "https://mirrors.aliyun.com/alpine/v3.14/main/" > /etc/apk/repositories \
    && echo "https://mirrors.aliyun.com/alpine/v3.14/community/" >> /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache bash tzdata git moreutils curl jq openssh-client python3 py3-pip \
    && rm -rf /var/cache/apk/* \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && git clone -b $REPO_BRANCH $REPO_URL /scripts \
    && cd /scripts \
    && mkdir logs \
	&& python3 -m pip install requests \
    && npm config set registry https://registry.npm.taobao.org \
    && npm install \
	&& npm install -g typescript \
	&& chmod +x /scripts/docker/*.sh \
    && cp /scripts/docker/docker_entrypoint.sh /usr/local/bin \
    && chmod +x /usr/local/bin/docker_entrypoint.sh

WORKDIR /scripts

ENTRYPOINT ["docker_entrypoint.sh"]

CMD [ "crond" ]