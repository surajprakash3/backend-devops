FROM node:22-alpine As build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build


FROM node:22-alpine

COPY --from=build /app .

EXPOSE 5050

CMD ["node","index.js"]