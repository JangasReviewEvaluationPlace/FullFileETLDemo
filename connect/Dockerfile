FROM confluentinc/cp-kafka-connect-base:6.0.0

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:5.5.1 \
    && confluent-hub install --no-prompt confluentinc/kafka-connect-sftp:2.3.2

CMD ["/etc/confluent/docker/run", "sleep infinity"]
