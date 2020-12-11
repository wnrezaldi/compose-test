# Import docker image of Python 3.7 from Docker Hub
FROM python:3.7-alpine

# Set the working directory
WORKDIR /code

# Set the environment variables used by Flask command
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Install dependencies
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Add metadata to the image to describe that the container is listening on port 5000
EXPOSE 5000

# Copy the current directory . in the project to the workdir . in the image.
COPY . .

# Set the default command for the container to flask run.
CMD ["flask", "run"]
