FROM fluentd:v1.16.2-debian-1.1

USER root
RUN gem install fluent-plugin-elasticsearch