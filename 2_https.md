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

Keys
----

Update the code in the `site.js` file :

    const https = require('https');
    const fs = require('fs');
    const path = require('path')
    
    const options = {
        key: fs.readFileSync(path.join('../', 'certs', 'server', 'my-server.key.pem')),
        cert: fs.readFileSync(path.join('../', 'certs', 'server', 'my-server.crt.pem'))
    };
    
    var server = https.createServer(options, function(req, res) {
        res.writeHead(200);
        res.end('hello world\n');
    });
    
    server.listen(8000, "0.0.0.0");

Now let's create the keys.

Download the `create_certs.sh` file, and execute :

    sudo chmod +x create_certs.sh
    ./create_certs.sh 'yourdomaine.org'

Links
-----

* Port configuration : http://zotonic.com/docs/latest/manuals/deployment/privilegedports.html
* Certificates generation : https://github.com/coolaj86/nodejs-self-signed-certificate-example
