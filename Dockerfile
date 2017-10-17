FROM alpine:3.6

RUN apk update && apk add python2 py-pip

RUN pip install mdv

COPY README.md README.md

CMD ["mdv","README.md"]
