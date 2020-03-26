FROM centos:centos7

ENV SCALA_VERSION 2.12.7
ENV SBT_VERSION 1.2.8

# Install Java8 
RUN yum install -y java-1.8.0-openjdk-devel

# Install Scala and SBT
RUN yum install -y https://downloads.lightbend.com/scala/2.12.7/scala-2.12.7.rpm
RUN yum install -y https://dl.bintray.com/sbt/rpm/sbt-1.2.8.rpm

RUN yum install -y git curl wget

ADD . /code
WORKDIR /code

RUN env CI=true sbt docs/previewSite
