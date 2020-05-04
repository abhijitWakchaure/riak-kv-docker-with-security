FROM basho/riak-kv
LABEL maintainer="awakchau@tibco.com"

COPY genCert.sh /usr/bin
COPY updateConf.sh /usr/bin
COPY enable-security /usr/bin
COPY riak.conf.mod /etc/riak