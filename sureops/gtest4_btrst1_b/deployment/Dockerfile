#pulling from github

FROM alpine/git:v2.30.1 AS code
ARG BUILD_ID
RUN echo $BUILD_ID
LABEL stage=builder
LABEL build_id=$BUILD_ID
RUN mkdir repo
WORKDIR /repo
RUN git clone http://Gauravrk215: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@github.com/Gauravrk215/gtest4.git
#************* Stage 2 - Maven Build **************
FROM maven AS mvn
LABEL stage=builder
LABEL build=$BUILD_ID
WORKDIR /workspace/app
COPY --from=code /repo/gtest4/gtest4_btrst1_b/authsec_springboot/backend/ /workspace/app
RUN mkdir builder/
RUN mvn install -Dmaven.test.skip

#******** Stage 3 - Docker Build *********

#FROM java:8-jdk-alpine
FROM openjdk:8-jdk-alpine
LABEL stage=app
LABEL build=$BUILD_ID
RUN mkdir /usr/app
COPY --from=mvn /workspace/app/target/*jar /usr/app/gtest.jar
RUN mkdir /usr/app/sureops
WORKDIR /usr/app
EXPOSE 9292
ENTRYPOINT ["java", "-jar", "gtest.jar"]