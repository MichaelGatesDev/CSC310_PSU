#!/usr/bin/env perl
use warnings;

# Michael Gates
# 2 March 2018
# A program that keeps tracks of products



# ------------------------------------------------------------------------------------------------------------------
#                                       INSTRUCTIONS:
# Your loop will iterate through every element of the @products array and call a &processEntry subroutine that you write.
#
# If the given index of the array is even the subroutine should prepend the text "Product: " to the list entry.
#
# If the the index is odd it should prepend the text "000" to the entry.
#
# Additionally, the subroutine should add both those data values to the @products_concise array, including the prepended text
#
# ------------------------------------------------------------------------------------------------------------------


@products = qw/759230-Diapers 272616-Trashbags 267112-ToiletPaper2 987456-Condoms 231948-Pencils 898923-Pillows 123997-Crayons 231223-Sheets 235442-Paper 124409-Cups 029399-Napkins/;
@products_concise = ();

sub processEntry
{
    my $itemVal = "000" . shift;
    my $itemName = "Product: " . shift;

    print $itemName . "\n";
    print $itemVal . "\n";
    push(@products_concise, $itemName);
    push(@products_concise, $itemVal);
}

print "== PRODUCTS LIST ==\n";
while(<@products>)
{
    my $product = $_;
    my ($itemVal, $itemName) = split(/-/, $product);

    #print "{Name: $itemName, Value: $itemVal} from \'$product\' \n";
    &processEntry($itemVal, $itemName);
}


print "== CONCISE PRODUCTS LIST ==\n";
my $lcv = 0;
for(@products_concise)
{
    my $item = $_;
    if($lcv % 2 == 0)
    {
        print $item  . " - ";
    }
    else
    {
        print $item . "\n";
    }
    $lcv++;
}
