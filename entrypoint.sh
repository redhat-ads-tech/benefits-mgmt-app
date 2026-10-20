#!/bin/sh
catalina.sh start
for i in $(seq 1 30); do
  [ -d /usr/local/tomcat/webapps/ROOT/WEB-INF ] && break
  sleep 1
done
printf '{"sha":"%s","message":"%s","date":"%s"}' \
  "${REVISION_SHA}" "${REVISION_MSG}" "${REVISION_DATE}" \
  > /usr/local/tomcat/webapps/ROOT/revision.json 2>/dev/null || true
tail -f /usr/local/tomcat/logs/catalina.out
