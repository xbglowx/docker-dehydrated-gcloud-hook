FROM xbglowx/dehydrated:latest
LABEL maintainer="Brian Glogower <xbglowx@gmail.com>"

ENV PATH=/dehydrated/google-cloud-sdk/bin:$PATH
WORKDIR /dehydrated
RUN mkdir -p hooks && \
    cd hooks && \
    curl -O https://raw.githubusercontent.com/AnalogJ/lexicon/master/examples/dehydrated.default.sh && \
    chmod +x dehydrated.default.sh
RUN apk --no-cache add bind-tools build-base libffi-dev libressl-dev python python-dev py-pip && \
    pip install dns-lexicon && \
    curl -L https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.tar.gz | \
    tar -xzvf- && \
    google-cloud-sdk/install.sh -q

ENTRYPOINT ["./dehydrated"]
CMD ['-h']
