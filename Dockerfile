FROM alpine:latest
LABEL maintainer="Brian Glogower <xbglowx@gmail.com>"

ENV PATH=/dehydrated/google-cloud-sdk/bin:$PATH
RUN apk --no-cache add bind-tools build-base curl libffi-dev libressl-dev python python-dev py-pip && \
    mkdir -p hooks && \
    cd hooks && \
    curl -O https://raw.githubusercontent.com/AnalogJ/lexicon/master/examples/dehydrated.default.sh && \
    chmod +x dehydrated.default.sh && \
    cd - && \
    curl -O https://github.com/lukas2511/dehydrated/blob/master/dehydrated && \
    chmod +x dehydrated && \
    pip install dns-lexicon && \
    curl -L https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.tar.gz | \
    tar -xzvf- && \
    google-cloud-sdk/install.sh -q

ENTRYPOINT ["./dehydrated"]
CMD ['-h']
