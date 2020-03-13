#!/bin/bash
VERSION=$(curl -s "http://13.126.30.80:8081/nexus/service/local/repositories/releases/content/com/hcl/FavoriteBank/maven-metadata.xml" | grep "<version>.*</version>" | sort --version-sort | uniq | tail -n1 | sed -e "s#\(.*\)\(<version>\)\(.*\)\(</version>\)\(.*\)#\3#g")
echo $VERSION
GROUP_ID=$(curl -s "http://13.232.164.213:8081/nexus/service/local/repositories/releases/content/com/hcl/FavoriteBank/maven-metadata.xml" | grep "<groupId>.*</groupId>" | sort --version-sort | uniq | tail -n1 | sed -e "s#\(.*\)\(<groupId>\)\(.*\)\(</groupId>\)\(.*\)#\3#g" | sed -e 's#\.#/#g')
echo $GROUP_ID
ARTIFACT_ID=$(curl -s "http://13.232.164.213:8081/nexus/service/local/repositories/releases/content/com/hcl/FavoriteBank/maven-metadata.xml" | grep "<artifactId>.*</artifactId>" | sort --version-sort | uniq | tail -n1 | sed -e "s#\(.*\)\(<artifactId>\)\(.*\)\(</artifactId>\)\(.*\)#\3#g")
echo $ARTIFACT_ID
BASEURL=http://13.126.30.80:8081/nexus/service/local/repositories/releases/content/
echo $BASEURL
export BASEURL
wget "${BASEURL}${GROUP_ID}/${ARTIFACT_ID}/${VERSION}/${ARTIFACT_ID}-${VERSION}.jar"

http://13.232.164.213:8081/nexus/content/repositories/snapshots/com/hcl/FavoriteBank/0.0.1-SNAPSHOT/maven-metadata.xml


curl -s "http://13.232.164.213:8081/nexus/content/repositories/snapshots/com/hcl/FavoriteBank/0.0.1-SNAPSHOT/maven-metadata.xml" | grep "<value>.*</value>" | sort --version-sort | uniq | tail -n1 | sed -e "s#\(.*\)\(<value>\)\(.*\)\(</value>\)\(.*\)#\3#g"