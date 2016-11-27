FROM java:8-jdk

MAINTAINER Luis Miguel <yovendielmundo@gmail.com> (@yovendielmundo)

ENV GRADLE_VERSION 2.13
ENV GRADLE_URL https://downloads.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip
ENV GRADLE_SHA1 01078159f79fbe09fc006b040886423d8736dae8

RUN cd /usr/lib \
  && wget -q "$GRADLE_URL" -O gradle-bin.zip \
  && echo "$GRADLE_SHA1  gradle-bin.zip" | sha1sum -c - \
  && unzip "gradle-bin.zip" \
  && ln -s "/usr/lib/gradle-${GRADLE_VERSION}/bin/gradle" /usr/bin/gradle \
  && rm "gradle-bin.zip"

ENV GRADLE_HOME /usr/lib/gradle
ENV PATH $PATH:$GRADLE_HOME/bin
