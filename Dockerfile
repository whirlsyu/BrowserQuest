FROM ingcsmoreno/browserquest:latest

ENV SERVER_PORT 8000
ENV NB_PLAYERS 200
ENV NB_WORLDS 5
ENV REDIS_HOST redis
ENV REDIS_PORT 6379
ENV DOCKERIZE_VERSION v0.4.0
COPY . /gamequest

RUN npm install -d

WORKDIR /gamequest

EXPOSE 8000

CMD dockerize -template /gamequest/server/config.tmpl:/gamequest/server/config.json node server/js/main.js
#CMD node server/js/main.js