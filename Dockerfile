FROM resin/rpi-node
RUN npm install -g -unsafe-perm node-red
RUN mkdir -p /app 
COPY . /app
WORKDIR /app 
RUN npm install --unsafe-perm
CMD [ "npm", "start" ]