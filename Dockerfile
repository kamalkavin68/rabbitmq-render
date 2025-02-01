# Use the official RabbitMQ image with management plugin
FROM rabbitmq:3-management

# Set environment variables
ENV RABBITMQ_DEFAULT_USER=user
ENV RABBITMQ_DEFAULT_PASS=password
ENV RABBITMQ_DEFAULT_VHOST=/
ENV RABBITMQ_SSL_VERIFY=verify_none
ENV RABBITMQ_LOGS="-"

# Copy custom configuration file
COPY rabbitmq.conf /etc/rabbitmq/rabbitmq.conf

# Expose ports
EXPOSE 5672 15672

# Create and set permissions for data directory
RUN mkdir -p /var/lib/rabbitmq/mnesia && \
    chown -R rabbitmq:rabbitmq /var/lib/rabbitmq

# Add healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD rabbitmq-diagnostics check_port_connectivity

# Set default command
CMD ["rabbitmq-server"]
