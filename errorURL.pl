# do errorURLs in metadata work?
# perl errorURL.pl < eduGAIN-metadata.xml > eduGAIN-errorURLs.txt
require LWP::UserAgent;
my $ua = LWP::UserAgent->new;
while (<>) {
  if (/errorURL=\"(\S+)\"/) {
    my $response = $ua->head($1);
    if ($response->is_success) {
      print "$1 is OK\n";
    } else {
      print "$1 is NOT OK: ", $response->code, "\n";
    }
  }
}
