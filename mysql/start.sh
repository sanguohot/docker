MYSQL_DATA=/opt/docker/mysql/data
mkdir -p $MYSQL_DATA
docker run --name mysql \
-v $MYSQL_DATA:/var/lib/mysql \
-v /opt/docker/mysql/etc:/etc/mysql/conf.d \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=yaojinchao \
-d mysql:5.6
