FROM ubuntu:24.04 AS base

WORKDIR /tmp/powershell

# Update
RUN apt-get update \
    && apt-get install -y wget apt-transport-https software-properties-common

# Install Requirement
RUN VERSION_ID=$(grep '^VERSION_ID=' /etc/os-release | cut -d '=' -f 2 | tr -d '"') \
    && wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb 

# Install Package
RUN apt-get update \
    && apt-get install -y powershell python3 curl

FROM base

WORKDIR /app

COPY main.py hello.ps1 /app/

CMD ["python3", "main.py"]