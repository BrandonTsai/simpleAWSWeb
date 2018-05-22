FROM k0st/alpine-apache-php

RUN apk update && \
    apk add bash bash-completion &&\ 
    apk add php-mysql jq

RUN apk update && \
    apk add python py-pip py-setuptools ca-certificates curl groff less

RUN pip install --upgrade pip && \    
    pip install awscli && \
    rm -rf /var/cache/apk/*

ADD index.php /app/
ADD entrypoint.sh /scripts/
WORKDIR /app/

EXPOSE 80
#ENTRYPOINT ["/bin/bash", "-ex", "/opt/efcsydney-roster/Entrypoint.sh", "dev"]
#ENTRYPOINT ["ping", "localhost"]
ENTRYPOINT ["sh", "/scripts/entrypoint.sh"]
#ENTRYPOINT ["/scripts/run.sh"]