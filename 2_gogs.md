Setup a Gogs server
===================

How to setup a Gogs (Git) server on your RaspberryPi?

Initialize container
--------------------

    docker run -d --restart=always --name go-git --publish 8022:22 --publish 8443:3000 --volume /var/go-git/:/data hypriot/rpi-gogs-raspbian

Details:
* `--restart=always`: auto restart the container on failure/reboot;
* `--name go-git`: this container have a long life expectancy, so give it a simple name;
* `--publish 8022:22`: the port 8022 of your device will be used to get ssh on the container;
* `--publish 8443:3000`: the port 8443 of your device will be user to get web access on the container
* `--volume /var/go-git/:/data`: all the files to save will be kept in the `` folder on the raspberry pi. **Do back-up of this folder!**

Configure the container
-----------------------

It is really important to have HTTPS access to the web interface, so change server confiuration in the file `/var/go-git/gogs/config/app.ini` for :

    [server]
    PROTOCOL = https
    DOMAIN = octocat.ddns.net:8022
    HTTP_PORT = 3000
    ROOT_URL = https://octocat.ddns.net/
    CERT_FILE = /data/gogs/cert.pem
    KEY_FILE = /data/gogs/key.pem

You have to create/have a certificate and a public key for your server.

Add the CA certificate on the client
------------------------------------

    wget https://raw.githubusercontent.com/VSasyan/CA/master/Ma_CA_RPI_1.pem
    sudo mv Ma_CA_RPI_1.pem /usr/local/share/ca-certificates/Ma_CA_RPI_1.crt
    sudo update-ca-certificates
  
Links
-----

* http://blog.hypriot.com/post/run-your-own-github-like-service-with-docker/
* https://github.com/gogits/gogs/issues/235
