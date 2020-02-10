FROM debian:9

WORKDIR /root
RUN apt-get update && apt-get install -y openjdk-8-jdk vim-tiny git curl wget
RUN git clone https://github.com/eclipse/eclipse.jdt.ls.git
RUN cd eclipse.jdt.ls && ./mvnw clean verify
RUN apt-get install -y socat procps
