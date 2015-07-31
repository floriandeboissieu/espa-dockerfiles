REPO_NAME=base-development
OLD_VERSION=0.0.1
NEW_VERSION=0.0.1

LATEST_ID=$(docker inspect -f '{{ .Id }}' $REPO_NAME:latest)
OLD_ID=$(docker inspect -f '{{ .Id }}' $REPO_NAME:$OLD_VERSION)

cd $REPO_NAME
docker build -t $REPO_NAME:latest .

cd ..
./flatten-image.sh $REPO_NAME:latest $REPO_NAME:$NEW_VERSION

NEW_ID=$(docker inspect -f '{{ .Id }}' $REPO_NAME:$NEW_VERSION)

echo "Latest ID = "$LATEST_ID
echo "Old ID = "$OLD_ID
echo "New ID = "$NEW_ID

docker rmi $OLD_ID
