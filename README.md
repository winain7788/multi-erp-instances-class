# multi-erp-instances-class
This respository provide an initial template for setting up multiple instances of Dolibarr ERP syste for use in a class room.

1) Manually download Dolibarr ERP from "https://sourceforge.net/projects/dolibarr/files/Dolibarr%20ERP-CRM/8.0.0/dolibarr-8.0.0.tgz/download"

2) Unpack dolibarr-8.0.0.tgz and duplicate the folder as many folder as the number of instance that you need.

3) Edit docker-compose.yml -> Make sure each individual ERP service points to its own dolibarr folder that you create in the prior step.

4) This docker-compose.yml provide a proxy service using nginx, which you have to create your own SSL key/certificate. (In this case I use SSLforFree powered by Let's Encrypt).

5) Edit proxy/proxy.conf for your own domain and local ip addresses for each ERP instance.
