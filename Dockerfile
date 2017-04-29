FROM xbglowx/dehydrated:latest
MAINTAINER Brian Glogower <xbglowx@gmail.com>

WORKDIR /dehydrated
RUN mkdir -p hooks && \
    git clone https://github.com/spfguru/dehydrated4googlecloud.git hooks/google-cloud
RUN apk --no-cache add python && \
    curl -L https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-153.0.0-linux-x86_64.tar.gz | \
    tar -xzvf- && \
    google-cloud-sdk/install.sh --path-update true -q

ENTRYPOINT ["./dehydrated"]
CMD ['-h']
