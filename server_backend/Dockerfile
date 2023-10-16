# Use the official Python image as a parent image
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy the requirements file and install Python packages
COPY ./requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the FastAPI application code into the container
COPY ./server.py ./server.py

EXPOSE 9080

# Use the following command to run FastAPI on port 9080
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "9080"]
