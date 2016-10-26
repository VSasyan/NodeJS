# Tunnel SSH


## Ajouter la connexion

### Depuis linux

    ssh -2NfCT -D 3128 tunnel@my_pi.me


## Configurer Firefox

### Le proxy :

    ![Configuration du proxy dans Firefox](../img/tunnel_ssh/proxy_firefox.png)
    Proxy SOCKS : SOCKS v5, localhost:3128

### about:config

Passer `network.proxy.socks_remote_dns` à `true`.

## Configure Chromium

Lancer la ligne de commande :

    chromium-browser --proxy-server="socks5://localhost:3128" --host-resolver-rules="MAP * 0.0.0.0 , EXCLUDE localhost" &

Voilà !

### Liens

https://arliguy.net/2013/06/18/proxy-socks-via-ssh-pour-firefox/
