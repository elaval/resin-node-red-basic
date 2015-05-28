# node-red on RPi with resin.io

Interested in running applications on devices that are connected to the Internet?  I have found that these pieces of Hardware/Software/Service have a great potential:

**Raspberry Pi (RPi)**: a small & inexpensive "linux" machine that could be running "in the field" collecting data, controlling appliances and connected to the Internet.

**resin.io**: a service that "magically" allows you to push your applications into yoru devices distributed through the Internet

**node-red**: a nodejs based software/concept that allows you to wire different nodes (pieces of software) that communicate & process messages ... and also connect to services & storage services in the Internet.

I am not going through all the details of these great components (you can google and visit their pages & documentation).  I will assume that you are familiar with them and share my experiencie working with the three of them together.

Resin.io has good documentation to let you up & running with a node.js application on a RPi.  But when I tried to run node-red, there where pieces of the puzzle that I couldn't find in the docs (by the way [Using Resin.io with Node-RED[(http://blog.thiseldo.co.uk/?p=1322) is a great post that gave me many lights ... but unfortunately I couldn't get all working with their instructions).


