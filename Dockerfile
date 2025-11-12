# Use an official Python slim image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy project files into the container
COPY . /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install Pillow gunicorn

# Add recommended Django setting for BigAutoField
ENV DJANGO_SETTINGS_MODULE=ecommerce.settings

# Automatically run migrations, collect static files, and start Gunicorn
CMD ["sh", "-c", "python manage.py migrate && python manage.py collectstatic --noinput && gunicorn ecommerce.wsgi:application --bind 0.0.0.0:8000"]
