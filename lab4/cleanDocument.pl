#!/usr/bin/env perl
# -----------------------------------------------------------------------------------------------------------------
# Write a program named "cleanDocument.pl" that will do the following:
# Reads two parameters from the command line (@ARGV)
# Opens a text file that is passed as a command line argument (the first command line argument is the name of the document)
# Loops through each line of the text file and replaces a word with dashes (the word to replace is the second command line argument)
# It then overwrites the file with the new replaced data
# Below is an example of how the program works:
#
# Calling the Perl file on the command line like so:
#
# $ cleanDocument.pl document.txt bobsled
#
# If the file looks like below:
#
# $ cat document.txt
#
# I like to use my bobsled during the winter. Whenever I bobsled I have a lot of fun.
#
# Then it will be become:
#
# $ cat document.txt
#
# I like to use my ------- during the winter. Whenever I ------- I have a lot of fun.
#
# -----------------------------------------------------------------------------------------------------------------
#
# Michael Gates
# 13 April 2018
# Assignment #4
use warnings;

my ($fileName, $word) = @ARGV;

if(not defined $fileName)
{
    die "File name required\n";
}
if(not defined $word)
{
    die "Word to censor required\n";
}


@newLines = ();

open(my $fhr, '<', $fileName) or die "Could not open file '$filename' $!\n";
while (my $row = <$fhr>)
{
    chomp $row;

    $replacement = "-" x length($word);
    if($row =~ m/$word/)
    {
        $row =~ s/$word/$replacement/g;
    }

    push @newLines, $row;
    #print "$row\n";
}
print "Opened file and replaced instances of $word with $replacement\n";

open(my $fhw, '>', $fileName) or die "Could not open file '$filename' $!\n";
for(@newLines)
{
    print $fhw "$_\n";
}
print "Saved replacements\n";
