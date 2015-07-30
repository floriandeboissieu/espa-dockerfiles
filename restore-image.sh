
gzip -dc $1.tar.gz | docker import - $1
