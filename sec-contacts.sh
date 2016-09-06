# how many security contacts in InCommon metadata?
METADATA=$HOME/InCommon-metadata.xml
perl -n sec-contacts.pl < $METADATA > sec-contacts.txt &&
echo number of security contacts: &&
wc -l < sec-contacts.txt
echo number of unique orgs: &&
awk 'BEGIN {FS = "\t+" } { print $2}' < sec-contacts.txt | sort -u | wc -l &&
echo number of unique emails: &&
awk 'BEGIN {FS = "\t+" } { print $4}' < sec-contacts.txt | sort -u | wc -l &&
echo number of unique IdPs: &&
egrep "^IDP" sec-contacts.txt | wc -l &&
echo number of unique SPs: &&
egrep "^SP" sec-contacts.txt | wc -l
