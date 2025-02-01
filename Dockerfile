# Use the official RabbitMQ image with management plugin
FROM rabbitmq:3-management

# Set essential environment variables only
ENV RABBITMQ_DEFAULT_USER=admin
ENV RABBITMQ_DEFAULT_PASS=admin
ENV RABBITMQ_DEFAULT_VHOST=/

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
