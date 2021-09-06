#!/bin/sh -l 
env
ls -la
POM_PATH=${1-.}
POM_VERSION=$(mvn -f $POM_PATH/pom.xml help:evaluate -Dexpression=project.version -q -DforceStdout)
POM_ARTIFACT=$(mvn -f $POM_PATH/pom.xml help:evaluate -Dexpression=project.artifactId -q -DforceStdout)
POM_GROUP=$(mvn -f $POM_PATH/pom.xml help:evaluate -Dexpression=project.groupId -q -DforceStdout)
echo "Founded version " 
echo "Founded version ${POM_VERSION} artifactId ${POM_ARTIFACT} groupId ${POM_GROUP} "
echo ::set-output name=version::$POM_VERSION
echo ::set-output name=artifactId::$POM_ARTIFACT
echo ::set-output name=groupId::$POM_GROUP
