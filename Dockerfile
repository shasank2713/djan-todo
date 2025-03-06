# Use an official Python image
FROM python:3.9

# Set working directory
WORKDIR /data

# Install dependencies
RUN apt-get update && apt-get install -y python3-distutils

# Install Django
RUN pip install django==3.2

# Copy project files
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose port
EXPOSE 8002

# Start Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
