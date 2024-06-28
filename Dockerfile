FROM python:3.10-alpine

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /DOC_HOME

# Copy the requirements file
COPY requirements.txt /DOC_HOME/

# Install the dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /DOC_HOME/

# Expose the port
EXPOSE 8001

# Copy the entrypoint.sh script specifically
COPY entrypoint.sh /DOC_HOME/entrypoint.sh

# Make entrypoint.sh executable
RUN chmod +x /DOC_HOME/entrypoint.sh

# Run the entrypoint script
ENTRYPOINT ["/DOC_HOME/entrypoint.sh"]

# Default command to run when the container starts
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]
