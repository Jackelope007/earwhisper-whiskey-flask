# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Install FFmpeg and git
RUN apt-get update && \
    apt-get install -y ffmpeg git

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install the Whisper package from GitHub
RUN pip install "git+https://github.com/openai/whisper.git"

# Make port 80 available to the world outside this container
EXPOSE 80

# Run app.py when the container launches
CMD [ "python", "-m" , "flask", "run", "--host=0.0.0.0"]
