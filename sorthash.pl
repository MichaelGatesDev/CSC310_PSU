#!/usr/bin/env perl
use warnings;


sub by_name
{
	lc($names{$a}) cmp lc($names{$b})
	or
	lc($a) cmp lc($b)
}


%names = qw/Bill Gates Michael Gates Gill Gates John Walker/;

@keys = sort by_name keys %names;

for $i (@keys)
{
	print $i . " " . $names{$i} . "\n";
}
