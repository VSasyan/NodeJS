Installation of NodeJS
======================

Version
-------

Choose between the LTS and the Stable version :
* LTS : https://nodejs.org/en/download/
* Stable : https://nodejs.org/en/download/stable/

Choose the version for ARM6/ARM7 () :
* Raspberry Pi Model A, B, B+ and Compute Module : ARM6
* Raspberry Pi 2 Model B : ARM7

Copy the good link (in January 2016, for the ARM7 version it was : https://nodejs.org/dist/v5.4.1/node-v5.4.1-linux-armv7l.tar.xz).

Installation
------------

Then execute that (replace the URL by the good one) :

    wget https://nodejs.org/dist/v5.4.1/node-v5.4.1-linux-armv7l.tar.xz
    tar -xvf node-v5.4.1-linux-armv7l.tar.xz
    cd node-v5.4.1-linux-armv7l
    sudo cp -R * /usr/local/

Verification
------------

Check that NodeJS is installed : `nodejs -v`

Links
-----

Original link : http://blog.wia.io/installing-node-js-v4-0-0-on-a-raspberry-pi/
