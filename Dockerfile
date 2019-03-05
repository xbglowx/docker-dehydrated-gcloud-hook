FROM alpine:latest
LABEL maintainer="Brian Glogower <xbglowx@gmail.com>"

ENV PATH=/google-cloud-sdk/bin:$PATH
RUN apk --no-cache add bash bind-tools curl openssl openssl-dev python && \
    curl -O https://raw.githubusercontent.com/lukas2511/dehydrated/master/dehydrated && \
    curl -O https://raw.githubusercontent.com/spfguru/dehydrated4googlecloud/master/hook.sh && \
    chmod +x dehydrated hook.sh && \
    curl -L https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.tar.gz | \
    tar -xzvf- && \
    google-cloud-sdk/install.sh -q

ENTRYPOINT ["./dehydrated"]
CMD ["-c", "-k", "./hook.sh"]
