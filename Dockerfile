FROM node:12.16.0 as builder

RUN useradd -m builder

ENV VERS=1.0
ENV HOME=/home/builder

COPY package.json package-lock.json lerna.json $HOME/app/
COPY packages/ $HOME/app/packages/
COPY services/ $HOME/app/services/
RUN chown -R builder:builder $HOME/*

USER builder
WORKDIR $HOME/app
RUN npm install --ignore-optional
RUN npx lerna bootstrap
RUN npx lerna run build

# CMD ["node", "$HOME/services/server/dist/bundle.js"]

FROM node:12.16.0

RUN useradd -m app

ENV VERS=1.0
ENV HOME=/home/app

WORKDIR $HOME/api

COPY --from=builder /home/builder/app/services/server/dist/bundle.js .

RUN chown -R app:app $HOME/*

CMD ["node", "bundle.js"]
