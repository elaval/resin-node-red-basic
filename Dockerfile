FROM resin/rpi-node
RUN npm install -g -unsafe-perm node-red
RUN apt-get update \
	&& apt-get install -y python-dev python-pip
RUN pip install RPi.Gpio
RUN apt-get update \
 	&& apt-get install -y libudev-dev \
 	&& apt-get install -y libusb-1.0-0-dev \
 	&& apt-get install -y git
RUN npm install -g -unsafe-perm node-hid
RUN echo # v4
RUN mkdir -p /app 
COPY . /app
WORKDIR /app 
RUN npm install --unsafe-perm
CMD [ "npm", "start" ]