FROM mongo:4.0.14-xenial
ENV CLOUD_SDK_VERSION=276.0.0
ENV PATH="/google-cloud-sdk/bin:${PATH}"
RUN apt-get update && \
  apt-get install -y --no-install-recommends curl python3 && \
  curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
  tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
  rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
  gcloud config set core/disable_usage_reporting true && \
  gcloud config set component_manager/disable_update_check true && \
  gcloud config set metrics/environment github_docker_image && \
  gcloud --version && \
  apt-get autoremove -y && \
  rm -Rf /tmp/* /var/lib/apt/lists/*
  