FROM debian:9

WORKDIR /root
RUN apt-get update && apt-get install -y openjdk-8-jdk vim-tiny git curl wget
RUN git clone https://github.com/eclipse/eclipse.jdt.ls.git
RUN cd eclipse.jdt.ls && git checkout 9d12fd5e4f84d65d24a1cb492d64fe43cffb8471 && ./mvnw clean verify
# TODO these version strings will change
WORKDIR /root/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository
CMD java  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
 -Dosgi.bundles.defaultStartLevel=4 \
 -Declipse.product=org.eclipse.jdt.ls.core.product \
 -Dlog.level=ALL \
 -DwatchParentProcess=false \
 -noverify \
 -Xmx1G \
 -jar ./plugins/org.eclipse.equinox.launcher_1.5.700.v20200107-1357.jar \
 -configuration ./config_linux \
 -data /root/data
