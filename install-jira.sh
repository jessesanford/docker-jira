#!/bin/bash -x

JIRA_VERSION=6.4.4

tmpfile=$(mktemp)

curl -LSs http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-${JIRA_VERSION}.tar.gz -o $tmpfile
mkdir -p /opt/jira
tar zxf $tmpfile --strip=1 -C /opt/jira

useradd --create-home --home-dir /usr/local/jira --shell /bin/bash jira

mkdir -p /opt/jira-home
echo "jira.home = /opt/jira-home" > /opt/jira/atlassian-jira/WEB-INF/classes/jira-application.properties

