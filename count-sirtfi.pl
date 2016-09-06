# how many IdPs/SPs have the sirtfi tag?
# perl -n ./count-sirtfi.pl < eduGAIN-metadata.xml
if (/SPSSODescriptor/) {
  if (defined($sirtfi) && $sirtfi) {
    print "SP $eid\n";
    $sirtfi = 0;
    $sp++;
  } else {
#    print "SP not sirtfi!\n";
  }
} elsif (/IDPSSODescriptor/) {
  if (defined($sirtfi) && $sirtfi) {
    print "IdP $eid\n";
    $sirtfi = 0;
    $idp++
  } else {
#    print "IdP not sirtfi!\n";
  }
} elsif (/sirtfi/) {
  $sirtfi = 1;
} elsif (/entityID=\"(\S*)\"/) {
  $eid = $1;
}
END {
  print "-----\n$idp sirtfi IdPs.\n$sp sirtfi SPs.\n";
}
