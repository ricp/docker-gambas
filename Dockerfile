FROM ubuntu:22.10
USER root
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential g++ automake autoconf libtool libbz2-dev libzstd-dev libmysqlclient-dev unixodbc-dev libpq-dev libsqlite0-dev libsqlite3-dev libglib2.0-dev libgtk2.0-dev libcurl4-gnutls-dev libgtkglext1-dev libpcre3-dev libsdl-sound1.2-dev libsdl-mixer1.2-dev libsdl-image1.2-dev libxml2-dev libxslt1-dev librsvg2-dev libpoppler-dev libpoppler-private-dev libpoppler-glib-dev libpoppler-cpp-dev libasound2-dev libdirectfb-dev libxtst-dev libffi-dev libglew-dev libimlib2-dev libv4l-dev libsdl-ttf2.0-dev libgdk-pixbuf2.0-dev linux-libc-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libcairo2-dev libgsl-dev libncurses5-dev libgmime-3.0-dev llvm-dev llvm libalure-dev libgmp-dev libgtk-3-dev libsdl2-dev libsdl2-mixer-dev libsdl2-ttf-dev libsdl2-image-dev sane-utils libdumb1-dev libssl-dev libqt5opengl5-dev libqt5svg5-dev libqt5webkit5-dev libqt5x11extras5-dev qtbase5-dev qtwebengine5-dev libwebkit2gtk-4.0-dev git vim

# Version of Gambas to install
ARG GAMBAS_VERSION=3.17.3

RUN useradd -ms /bin/bash gambas
USER gambas

WORKDIR /home/gambas
RUN git clone https://gitlab.com/gambas/gambas.git src

WORKDIR /home/gambas/src
RUN git checkout tags/${GAMBAS_VERSION} -b v${GAMBAS_VERSION}-branch
RUN ./reconf-all
RUN ./configure -C -q --disable-keyring --disable-qt4
RUN make -j $(nproc)

USER root
RUN make install

USER gambas
WORKDIR /home/gambas
COPY --chmod=775 hello.gbs .
ARG CACHEBUST=1 # Force display output of hello.gbs
RUN echo $(./hello.gbs)

CMD ["/bin/bash"] 

