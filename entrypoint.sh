
#!/bin/sh -l 
POM_PATH="${1-.}" 
POM_VERSION=$(mvn -f $POM_PATH/pom.xml help:evaluate -Dexpression=project.version -q -DforceStdout)
POM_ARTIFACT=$(mvn -f $POM_PATH/pom.xml help:evaluate -Dexpression=project.artifactId -q -DforceStdout)
POM_GROUP=$(mvn -f $POM_PATH/pom.xml help:evaluate -Dexpression=project.groupId -q -DforceStdout)

cho "Founded version ${POM_VERSION}"
echo ::set-output name=version::$POM_VERSION

