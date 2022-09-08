FROM rocker/r-ver:4.2.1

RUN apt-get update &&  apt-get install -y --no-install-recommends \
        libcurl4-openssl-dev \
        libssl-dev \
        zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Without this, we are unable to pick up more recent packages
COPY docker/Rprofile.site /usr/local/lib/R/etc/Rprofile.site

RUN install2.r --error \
        --repos https://packagemanager.rstudio.com/all/__linux__/focal/latest \
        --repos https://mrc-ide.r-universe.dev \
        docopt \
        jsonlite \
        lgr \
        outpack \
        porcelain

EXPOSE 8001

COPY . /src
RUN R CMD INSTALL --install-tests /src && \
        cp /src/docker/outpack.server /usr/local/bin && \
        rm -rf /src

ENTRYPOINT ["/usr/local/bin/outpack.server"]
