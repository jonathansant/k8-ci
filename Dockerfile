FROM alpine

RUN apk add --no-cache curl

RUN apk add --update nodejs

RUN apk --update add git openssh && \
	rm -rf /var/lib/apt/lists/* && \
	rm /var/cache/apk/*

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
	&& curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.9.0/bin/linux/amd64/kubectl \
	&& chmod +x ./kubectl \
	&& mv ./kubectl /usr/local/bin/kubectl

RUN  apk add --update docker

RUN echo node version: $(node -v)
RUN echo npm version: $(npm -v)
RUN echo npm version: $(kubectl version --client)