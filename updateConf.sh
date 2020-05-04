#! /bin/bash
echo -e '\n*******  Editing Riak Configuration File  *******\n'

CONFFILE="/etc/riak/riak.conf"
NODEIP=$(hostname -I | xargs)
PROTOBUFFPORT="8087"
HTTPSPORT="8098"

echo -e '\n*******  Current Settings  *******'
echo "Config file path: $CONFFILE"
echo "Node IP: $NODEIP"
echo "Protobuff port: $PROTOBUFFPORT"
echo "HTTPS port: $HTTPSPORT"
    
echo -e "\n*******  Updating Configuration File   *******"
echo -e '\nssl.certfile = $(platform_etc_dir)/cert.pem' >> $CONFFILE
echo 'ssl.keyfile = $(platform_etc_dir)/key.pem' >> $CONFFILE
echo 'ssl.cacertfile = $(platform_etc_dir)/cacertfile.pem' >> $CONFFILE
echo "nodename = riak@$NODEIP" >> $CONFFILE
echo "listener.protobuf.internal = $NODEIP:$PROTOBUFFPORT" >> $CONFFILE
echo "listener.https.internal = $NODEIP:$HTTPSPORT" >> $CONFFILE
#sed -i '285s/.*/#/' /etc/riak/riak.conf
echo -e "*******  Saving Configuration File   *******"