# README

```sh
docker-compose up
# access http://127.0.0.1
# container is shotdown
docker-compose down
# clean containers including volumes
docker-compose down --volumes
```

## dev



```sh
# db周りの調査をしたい
docker-compose exec db /bin/bash
# test userで実行
mysql -u test -D mydb -p
```