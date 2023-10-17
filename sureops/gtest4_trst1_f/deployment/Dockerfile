FROM alpine/git:v2.30.1 AS code
ARG BUILD_ID
RUN echo $BUILD_ID
LABEL stage=builder
LABEL build_id=$BUILD_ID
RUN mkdir repo
WORKDIR /repo
RUN git clone https://Gauravrk215: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@github.com/Gauravrk215/gtest4.git
FROM debian:latest AS build-env
RUN apt-get update
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"
RUN flutter doctor -v
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web
RUN mkdir /app/
COPY --from=code /repo/gtest4/gtest4_trst1_f/authsec_flutter/authsec_flutter/ /app/
WORKDIR /app/
RUN flutter build web
FROM nginx:1.21.1-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html