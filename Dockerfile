FROM buildpack-deps:zesty

COPY . /phxpaxos

RUN cd /phxpaxos \
        && ./build.sh

WORKDIR /phxpaxos

ENTRYPOINT ["/phxpaxos/docker-entrypoint.sh"]
