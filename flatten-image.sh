
ID=$(docker run -d $1 /bin/bash)
docker export $ID | docker import - flat-$1

