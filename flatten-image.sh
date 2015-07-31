
ID=$(docker run -d $1 /bin/bash)
echo "ID = "$ID
docker export $ID | docker import - $2
# Remove the container we used
docker rm $ID

