# Docker-Nextcloud
Full Nextcloud Install

Solution in docker compose
+ Nextcloud
+ MariaDB
+ Onlyoffice
+ Traeffic

ToDoList :
+ Modifier les versions de jitsi ne par mettre latest

Command :
```shell
sudo docker stop nextcloudfpmtraefik_web_1 nextcloudfpmtraefik_app_1 nextcloudfpmtraefik_db_1 nextcloudfpmtraefik_reverse_proxy_1

sudo docker rm nextcloudfpmtraefik_web_1 nextcloudfpmtraefik_app_1 nextcloudfpmtraefik_db_1 nextcloudfpmtraefik_reverse_proxy_1

sudo docker-compose up -d
```