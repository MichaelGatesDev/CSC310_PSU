#!/usr/bin/env perl

# -----------------------------------------------------------------------------------------------------------------
# Create a new Perl program named "identification.pl" that continuously asks the user for input (in a while loop).
# Each iteration should ask the user for their selection from a menu. The menu should be as follows:
#
# Option 1: Will ask the user for a name and ID number and then store it in a hash where the ID is the key and the name is the value
# Option 2: Will ask the user to look up an ID to find the persons's name that the ID belongs to, it will then print their name
# Option 3: Will quit, but will print all of the key->value pairs of the hash before exiting
#
# DO NOT use Data::Dumper to output all of the values in the hash. It is ugly.
# A short video of the program functioning is displayed below.
# Due April 6th.
# -----------------------------------------------------------------------------------------------------------------
#
# Michael Gates
# 6 April 2018
# Assignment #3

use warnings;


printMenu();
$response = askSelection();
while(defined($response) && !($response eq "3"))
{
    if($response eq "1")
    {
        print "Enter a name: ";
        chomp( my $name = <STDIN> // return undef);
        print "Enter an ID number: ";
        chomp( my $id = <STDIN> // return undef);
        $database{$id} = $name;
        print "($id: $name) was stored in the hash.\n";
        print "\n";
    }
    if($response eq "2")
    {
        print "Enter an ID to lookup: ";
        chomp( my $id = <STDIN> // return undef);

        if(exists($database{$id}))
        {
            my $name = $database{$id};
            print "The ID ($id) belongs to ($name)\n";
        }
        else
        {
            print "The ID ($id) does not exist in the hash.\n";
        }

        print " \n";
    }

    printMenu();
    $response = askSelection();

    last if $response eq "3"
}
printAndQuit();


sub printAndQuit
{
    print "The ID-Name list is as follows:\n\n";
    for $key (keys %database)
    {
        $value = $database{$key};
        print "$key: $value\n";
    }
    print "\nThanks for using the program. Exiting.\n\n";
}

sub askSelection
{
    my $response = prompt("\nEnter your selection as a number: ");
    return $response;
}

sub printMenu
{
    print "[ Welcome to the Identification Program ]\n";
    print "-----------------------------------------\n";
    print "What action would you like to take?\n";
    print "1. Add a name to the ID list.\n";
    print "2. Pick a name in the ID list.\n";
    print "3. Quit the program and print the ID list.\n";
}

sub prompt
{
  my ($msg) = @_;
  print $msg;
  chomp( my $response = <STDIN> // return undef);
  return $response;
}
