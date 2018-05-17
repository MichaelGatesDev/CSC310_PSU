#!usr/bin/env perl
use warnings;

print "Currently logged in as user: $ENV{'USERNAME'}\n";
print "User's home dir is $ENV{'HOME'}\n";

@files = glob "$ENV{'HOME'}/*.py";

foreach(@files)
{
    print "$_\n";
}
