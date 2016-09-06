# how many security contacts in InCommon metadata?
# see sec-contacts.sh
if (/<OrganizationName.*>(.*)<\/OrganizationName>/) {
  $org = $1;
  $sec = 0;
} elsif (/SPSSODescriptor/) {
  $SP = 1; $IDP = 0;
} elsif (/IDPSSODescriptor/) {
  $SP = 0; $IDP = 1;
} elsif (/http:\/\/id.incommon.org\/metadata\/contactType\/security/) {
  $sec = 1;
} elsif (/<GivenName>(.*)<\/GivenName>/) {
  $name = $1;
} elsif (/<EmailAddress>(.*)<\/EmailAddress>/) {
  $email = $1;
  if (defined($sec) && $sec) {
    if (defined($IDP) && $IDP) {
      print "IDP\t";
    }
    if (defined($SP) && $SP) {
      print "SP\t";
    }
    print $org, "\t", $name, "\t", $email, "\n";
  }
  $sec = 0;
}
