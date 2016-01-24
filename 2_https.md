HTTPS
=====

Code
----

Create a folder to host your site.

I choose this organization :

    /var/www/nodeJS
        /certs
        /www
            site.js
        create_certs.sh

Copy the code in the `site.js` file :

    var http = require('http');
    
    var server = http.createServer(function(req, res) {
      res.writeHead(200);
      res.end('Hello World!');
    });
    
    server.listen(8443, "0.0.0.0");

Port
----

You can't run NodeJS on the port 443 without use the `sudo` command. So you have to make routing :

    iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to 8443
    iptables -t nat -A OUTPUT -p tcp -d your.ip.address --dport 443 -j REDIRECT --to 8443

Replace **your.ip.address** byt he local ip of your device.

Let's try
---------

Go in the `www` folder and run : `nodejs site.js`. You can access to the website at : http://localhost/
Now the idea is to **add encryption**.

Certificates
------------

### Use HTTPS in NodeJS

Update the code in the `site.js` file :

    const https = require('https');
    const fs = require('fs');
    
    const options = {
        key: fs.readFileSync('../certs/server/my-server.key.pem'),
        cert: fs.readFileSync('../certs/server/my-server.crt.pem')
    };
    
    var server = https.createServer(options, function(req, res) {
        res.writeHead(200);
      res.end('Hello World!');
    });
    
    server.listen(8443, "0.0.0.0");

### Create the certificates

Download the `create_certs.sh` file in the `nodeJS` folder, and execute :

    sudo chmod +x create_certs.sh
    ./create_certs.sh 'yourdomaine.org'

### Certificate Authority Public Key

Add the `certs/client/my-root-ca-crt.pem` to you browser. You can share it anywhere, it is the public key of the Certificate Authority.

The connexion is secured!

Links
-----

* Port configuration : http://zotonic.com/docs/latest/manuals/deployment/privilegedports.html
* Certificates generation : https://github.com/coolaj86/nodejs-self-signed-certificate-example