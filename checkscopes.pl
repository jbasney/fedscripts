# do all IdPs have shibmd:Scope extensions?
# perl -n ./checkscopes.pl < eduGAIN-metadata.xml
if (/IDPSSODescriptor /) {
  $scope = 0;
  $idp++;
} elsif (/IDPSSODescriptor\>/) {
  if ($scope == 0) {
    print "IdP $eid has no shibmd:Scope!\n";
    $noscope++;
  }
} elsif (/shibmd:Scope/) {
  $scope = 1;
} elsif (/entityID=\"(\S*)\"/) {
  $eid = $1;
}
END {
  print "-----\n$idp IdPs, $noscope without scopes.\n";
}
