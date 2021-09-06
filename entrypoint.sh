#!/bin/sh -l 
POM_PATH=${1-.}
POM_VERSION=$(mvn -s ./settings.xml -f $POM_PATH/pom.xml help:evaluate -Dexpression=project.version -q -DforceStdout)
POM_ARTIFACT=$(mvn -s ./settings.xml -f $POM_PATH/pom.xml help:evaluate -Dexpression=project.artifactId -q -DforceStdout)
POM_GROUP=$(mvn -s ./settings.xml -f $POM_PATH/pom.xml help:evaluate -Dexpression=project.groupId -q -DforceStdout)
echo "Founded version ${POM_VERSION} artifactId ${POM_ARTIFACT} groupId ${POM_GROUP} "
echo ::set-output name=version::$POM_VERSION
echo ::set-output name=artifactId::$POM_ARTIFACT
echo ::set-output name=groupId::$POM_GROUP
