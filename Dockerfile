FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install -y build-essential libgtest-dev cmake
RUN apt-get install -y gcc-12 g++-12
RUN apt install -y doxygen indent python3 python3-pip

RUN apt install -y libboost-random-dev libboost-log-dev libboost-thread-dev libboost-filesystem-dev
RUN apt install -y flex bison
RUN pip install strictdoc
RUN cd /usr/src/googletest && cmake . && cmake --build . --target install
COPY entry.sh /entry.sh
# Used for pretty formatting
ENV LANG en_US.UTF-8

# Imposta i compilatori GCC 12 come predefiniti
ENV CC=/usr/bin/gcc-12
ENV CXX=/usr/bin/g++-12


ENTRYPOINT ["bash","/entry.sh"]
