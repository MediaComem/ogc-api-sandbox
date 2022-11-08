FROM python:3.8.10-slim-buster

LABEL maintainer="Maxime Collombin <maxime.collombin@heig-vd.ch>"

# mkdocs default & additional plugins:

# https://github.com/blueswen/mkdocs-glightbox/

RUN pip install mkdocs mkdocs-material \
    mkdocs-glightbox

COPY ./src/ /docs/

WORKDIR /docs/

EXPOSE 8000

CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]
