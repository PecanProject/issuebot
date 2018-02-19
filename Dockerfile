FROM node:alpine

WORKDIR /bot
COPY package.json /bot/
RUN npm install
COPY . /bot/

ENTRYPOINT ["./entrypoint.sh"]
CMD ["bot"]
