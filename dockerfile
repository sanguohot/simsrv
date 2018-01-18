FROM i386/alpine:3.6

RUN apk update && apk add --no-cache gcc musl-dev lksctp-tools

RUN mkdir -p /var/log/

ADD dinstar/bin/* /dinstar/bin/
ADD dinstar/cfg/* /dinstar/cfg/
RUN chmod 777 -R /dinstar

RUN touch /var/log/simsrv.log
RUN chmod 777 /var/log/simsrv.log

WORKDIR /dinstar/bin/
#CMD ["/bin/sh","-c","while true; do sleep 1; done"]
CMD ["./simsrv"]