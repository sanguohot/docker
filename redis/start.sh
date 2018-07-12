docker run -v /opt/docker/redis/etc/redis.conf:/usr/local/etc/redis/redis.conf \
-p 6379:6379 \
--name redis \
-d daocloud.io/library/redis:3.0-alpine \
redis-server /usr/local/etc/redis/redis.conf