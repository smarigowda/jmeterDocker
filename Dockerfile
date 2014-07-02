# Pull base image.
FROM dockerfile/ubuntu

# Install Java.
RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer

# Install JMeter
RUN \
  cd /tmp && \
  wget http://www.mirrorservice.org/sites/ftp.apache.org//jmeter/binaries/apache-jmeter-2.11.tgz && \
  tar xvzf apache-jmeter-2.11.tgz && \
  rm -f apache-jmeter-2.11.tgz && \
  mv /tmp/apache-jmeter-2.11 /apache-jmeter-2.11

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/apache-jmeter-2.11/bin
# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data
