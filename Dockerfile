# Use the official RabbitMQ Docker image
FROM rabbitmq:3-management

# Expose the default ports for RabbitMQ
EXPOSE 5672 15672

# Set environment variables
ENV RABBITMQ_DEFAULT_USER=admin \
    RABBITMQ_DEFAULT_PASS=admin123 \
    RABBITMQ_DEFAULT_VHOST=/

# Start RabbitMQ when the container starts
CMD ["rabbitmq-server"]
