FROM node:16

WORKDIR /app

COPY app/ ./

RUN npm install

RUN chmod -R 755 .

CMD ["npm", "run", "dev"]
