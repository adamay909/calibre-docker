
FROM frolvlad/alpine-glibc

LABEL maintainer="Masahiro Yamada <adamay909@gmail.com>"

# Install required packages and calibre.

RUN	apk --no-cache add \
		python2 libstdc++ xdg-utils wget xz bash mesa-gl fontconfig && \
	wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin && \
	mkdir /calibre &&\
	chown 1001:1001 /calibre

USER 1001:1001

EXPOSE 8080

ENTRYPOINT [ "calibre-server" ]

CMD [ "--help" ]


	
