FROM node:latest
WORKDIR /app
COPY package.json .
RUN npm install 
COPY . ./ 
##ENV REACT_APP_MOVIE_DB=9367e2a6
CMD ["npm","start"]