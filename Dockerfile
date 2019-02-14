FROM elixir:1.7.4-alpine

RUN apk update && apk add inotify-tools postgresql-client postgresql-dev yarn

WORKDIR /app

COPY mix* ./
RUN mix local.hex --force && mix local.rebar --force \
  && mix deps.get && mix deps.compile
COPY . .
COPY ./priv/static/images .priv/static/images

EXPOSE 4000

CMD ["./entrypoint.sh"]
# CMD ["mix", "phx.server"]