# Build the project
# docker build -t app:latest .
#
# Run docker image
# docker run -d -p 5000:5000 -p 8000:8000 --name app-restapi app:latest
#
# Integraion test to make sure the execution file is as we expect
# GOSS_FILES_PATH=test dgoss run --entrypoint=/test/gossEntrypoint.sh app:latest
