#!/bin/sh

lsb_release -i >/dev/null || exit 1

DISTRO=$(lsb_release -s -i | tr A-Z a-z)
CODENAME=$(lsb_release -s -c)
SOURCESD="/etc/apt/sources.list.d"
SOURCE_DEB="deb [ trusted=yes ]"
#SOURCEN=$(basename "$0" .sh| sed 's/install-repo-//'|sed 's/install-//')
SOURCEN="squeezeplay-dist"
SOURCE_URL="https://pssc.github.io/"${SOURCEN}
COMPONENTS="contrib"

SOURCE=${SOURCESD}"/"${SOURCEN}".list"

: > ${SOURCE}

for i in ${SOURCE_URL};do
cat <<EOF >>${SOURCE}

${SOURCE_DEB}  ${i} ${DISTRO}-${CODENAME} ${COMPONENTS}

EOF
done

