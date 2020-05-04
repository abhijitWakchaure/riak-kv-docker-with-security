#! /bin/sh
umask 077
site="/etc/riak"
mkdir -p $site
umask 277
CAKEY="$site/cakey.pem"
CACERT="$site/cacertfile.pem"
KEY="$site/key.pem"
REQ="$site/req.csr"
CERT="$site/cert.pem"

# certificate details for herenow script (configurable)
COUNTRY="IN"
STATE="Maharashtra"
LOCALITY="Pune"
ORGNAME="TIBCO"
ORGUNIT="Connectors"
EMAIL="awakchau@tibco.com"
COMMONNAMEFQDN=$(hostname -I | xargs)
CHALLENGE=""
COMPANY=""
DAYS="-days 365"

echo '\n*******  STEP 1/5: Creating private key for root CA  *******\n'
openssl genrsa -out $CAKEY 4096

echo '\n*******  STEP 2/5: Creating self signed root CA certificate  *******\n'
cat <<__EOF__ | openssl req -new -x509 $DAYS -key $CAKEY -out $CACERT
$COUNTRY
$STATE
$LOCALITY
$ORGNAME
$ORGUNIT
$COMMONNAMEFQDN
$EMAIL
__EOF__

echo '\n*******  STEP 3/5: Creating private key for creating subordinate CA   *******\n'
openssl genrsa -out $KEY 4096

echo '\n*******  STEP 4/5: Creating CSR for subordinate CA   *******\n'
cat <<__EOF__ | openssl req -new -key $KEY -out $REQ
$COUNTRY
$STATE
$LOCALITY
$ORGNAME
$ORGUNIT
$COMMONNAMEFQDN
$EMAIL
$CHALLENGE
$COMPANY
__EOF__

echo '\n*******  STEP 5/5: Processing request for the subordinate CA certificate and signing it by the root CA   *******\n'
openssl x509 -req $DAYS -in $REQ -CA $CACERT -CAkey $CAKEY -set_serial 01 -out $CERT

chmod 644 $CACERT
chmod 644 $CERT
chmod 644 $KEY