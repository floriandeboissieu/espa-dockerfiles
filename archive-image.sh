
ID=$(docker run -d $1 /bin/bash)
(docker export $ID | gzip -c > $1.gz)
