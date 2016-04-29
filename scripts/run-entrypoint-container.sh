
container_name="container-for-$USER"

image=$1
the_gid=`id -g`
the_uid=`id -u`

# Create the command components
d_head="docker run --interactive"
d_name="--name ${container_name}"
# Create the tail of the command, specifying the image and the user and group
# IDs to run as in the container for file creation problems
d_tail="-t ${image} ${the_gid} ${the_uid}"

cmd=""
cmd=${cmd}" "${d_head}
cmd=${cmd}" "${d_name}
cmd=${cmd}" "${d_tail}
cmd=${cmd}" "/bin/bash

# Remove any pre-existing version
docker rm ${container_name}
# Let the user know what we are doing, and then execute the command
echo $cmd
$cmd
