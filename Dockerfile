FROM alpine:3.6

RUN apk update && apk add python2 py-pip

RUN pip install mdv

COPY checklist.md checklist.md

CMD ["mdv","checklist.md"]
