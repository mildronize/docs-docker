FROM httpd:2.4
# Install tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends unzip curl && \
    mkdir -p /tmp/downloads
WORKDIR /tmp/downloads

# All environments
ENV PUBLIC_HTML_LOCATION=/usr/local/apache2/htdocs

ENV PYTHON_VERSION=3.5.1

# Copy extra files
COPY ./public_html/ ${PUBLIC_HTML_LOCATION}

# ------------------ Python Docs ------------------
RUN curl -jksSL -o python.zip https://docs.python.org/3/archives/python-${PYTHON_VERSION}-docs-html.zip && \
    unzip -q python.zip && \
    mkdir -p ${PUBLIC_HTML_LOCATION}/python && \
    mv python-${PYTHON_VERSION}-docs-html/* ${PUBLIC_HTML_LOCATION}/python

# Clear all downlaoded and unnecessary files
RUN rm -rf /tmp/downloads && \
  apt-get purge -y unzip curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN chmod 777 -R ${PUBLIC_HTML_LOCATION}
