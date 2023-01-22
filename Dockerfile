FROM node:lts-alpine

WORKDIR /app

# copy frontend and backend apps files
COPY frontend/ /app/frontend
COPY backend/ /app/backend

# install dependencies
RUN cd /app/backend && npm install && npm ci
RUN cd /app/frontend && npm install && npm ci && npm run build

# start backend
CMD cd /app/backend && npm start &
# start frontend
CMD cd /app/frontend && npm start
