# node-red on RPi with resin.io

Interested in running applications on devices that are connected to the Internet?  I have found that these pieces of Hardware/Software/Service have a great potential:

**Raspberry Pi (RPi)**: a small & inexpensive "linux" machine that could be running "in the field" collecting data, controlling appliances and connected to the Internet.

**resin.io**: a service that "magically" allows you to push your applications into yoru devices distributed through the Internet

**node-red**: a nodejs based software/concept that allows you to wire different nodes (pieces of software) that communicate & process messages ... and also connect to services & storage services in the Internet.

I am not going through all the details of these great components (you can google and visit their pages & documentation).  I will assume that you are familiar with them and share my experiencie working with the three of them together.

Resin.io has good documentation to let you up & running with a node.js application on a RPi.  But when I tried to run node-red, there where pieces of the puzzle that I couldn't find in the docs (by the way [Using Resin.io with Node-RED](http://blog.thiseldo.co.uk/?p=1322) is a great post that gave me many lights ... but unfortunately I couldn't get all working with their instructions).

I know that you know this, but let's put together some of the pieces of a resin repository:
- Dockerfile: if you are not using the "prebuilt" facilities that resin provides for nodejs applications, you will need to have a Dockerfile which allows you to define how resin will build an image for your Operating System and software components.  If you don't have a Dockerfile, but you do have a node application (with it's package.json file) then resin will provide you with a prebuilt nodejs image which is preconfigured to make your life simple.

- package.json: if you work with nodejs applications, you know what this is.  I just want to highlight that thsi files defines the "scripts" that will be run before your application starts (for example to install additional pieces of software such as node-red) and then run your actual application:

*package.json*
```
  (...)
  "scripts": {
    "preinstall": "bash deps.sh",
    "start": "sh start.sh"
  },
  (...)
```
In this example the script "deps.sh" will be run before the application and the script "start.sh" will be the application itself.  Normally your node application would be run with "node server.js", but you will see later why I am using start.sh.

- deps.sh (this can have any name you define in package.json): Here is were I can actually install node-red in the image, before I start my application.  What worked for me was to have a "global" installation of node-red whith the following script:

*deps.sh*
```
#!/bin/bash
set -o errexit
npm install -g -unsafe-perm node-red
```
`node-red` command is installed in `/usr/local/bin` as well as  `node-red-pi` which is recommended for running node-red in RPi due to limited memory constrains (see http://nodered.org/docs/hardware/raspberrypi.html).

- start.sh (this can have any name you define in package.json): Our application will be an instance of node-red that loads a specific settings.js file and a specific file with the node-red flow definition (which in my case is flows.js).  I decided to create a new directory in my repository which contains my node-red application files (settings.js, flows.js and another package.json in case node-red nodes and/or dependencies are required for your node-red application). 

*start.sh*
```
#!/bin/bash
node-red-pi --max-old-space-size=128 --userDir /app/my-node-red -v
```

--max-old-space-size=128  "limits the space it can use to 128MB before cleaning up" and --userDir let's you define the directory where your settings.js will be located.

## Example node-red flow (application)
I have deployed a basic node-red flow that allows me to get some information from the Rasbberry OS (memory, cpu load, ...) and expose it as a restful API:


I am NOT using the RPi gpio so I did not explored the installation configuration of this (actually I did explore it without success, but since I was not going to use it I did not explored it further).

- ./my-node-red/settings.js: 




