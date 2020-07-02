#! /bin/sh

VERSION=2.16.9
CHECKSUM=197b9338129000f5d085b37e93ae3bcdd785901356a426dfa1f948d6b7a5a744
ARCH=amd64
FILENAME=helm-v$VERSION-linux-$ARCH.tar.gz

apk add curl git

mkdir helm
cd helm
curl -O "https://get.helm.sh/$FILENAME" 2>&1

if ! (echo "$CHECKSUM  $FILENAME" | sha256sum -c); then
	echo "Invalid checksum"
	exit 1;
fi

tar xvf "$FILENAME"
cp linux-$ARCH/helm /usr/bin/
cd ..
rm -rf helm
