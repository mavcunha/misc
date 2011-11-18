#!/bin/sh

(
exec >&- 2>&-
cd /var/play/cdweb/
sudo play clean
sudo play start --%prod
)

count=0
until sudo play status --%prod; do
    echo "Waiting ..."
    sleep 3
    count=$((count + 1))

    if [ "$count" -ge 10 ]; then
        exit 1
    fi
done
