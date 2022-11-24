FROM python:3.10-alpine3.13 AS base

WORKDIR /app
ENTRYPOINT ["/app/main.py"]

# Install app depedencies
RUN pip install pipenv
COPY Pipfile* ./
RUN pipenv install --system --deploy

# Copy rest of the app
COPY . .
