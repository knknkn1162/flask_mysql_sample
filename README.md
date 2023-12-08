# README

## dev



```sh
# db周りの調査をしたい
docker-compose exec db /bin/bash
# test userで実行
mysql -u test -D mydb -p
```

```sh
docker-compse up
# --volumes: 名前付き
docker-compose down --volumes
```