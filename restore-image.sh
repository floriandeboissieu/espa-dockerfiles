
gzip -dc $1.gz | docker import - $1
