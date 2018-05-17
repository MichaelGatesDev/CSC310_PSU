#! /usr/bin/env perl
use warnings;

sub multiplyTwo{
    $first = shift;
    $second = shift;

    return $first * $second;
}

$name = "bob";
sub changeVar{
    $name = "fred";
}

print $name . "\n";
&changeVar;
print $name . "\n";
