FROM python:3.7.3-stretch

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY ./hello.py requirements.txt /app/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port 80
EXPOSE 80

# Tell Flask where the app is
ENV FLASK_APP=hello.py

# Run app.py at container launch
CMD ["flask", "run", "--host=0.0.0.0"]

