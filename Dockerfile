# Use the official RabbitMQ image with management plugin
FROM rabbitmq:4.0-management

# Expose the necessary ports
EXPOSE 5672 15672

# Default command to run RabbitMQ server
CMD ["rabbitmq-server"]
