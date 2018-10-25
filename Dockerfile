FROM docker.elastic.co/beats/filebeat:6.4.2
VOLUME /var/lib/docker/containers
COPY filebeat.yml /usr/share/filebeat/filebeat.yml
USER root
RUN chown root:filebeat /usr/share/filebeat/filebeat.yml
USER filebeat
