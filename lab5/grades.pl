#!/usr/bin/env perl
# Michael Gates
# Program that reads grades from a file and prints report card
# April 2018

# Assignment #6 will be to modify to check for the exitence
# of the first command line parameter (in @ARGV)
# and use that for the grade file if its is passed
$grade_file = "grades.txt";

sub avg
{
   # write this subroutine to calculate and return an average
   # for a list of numbers that is passed to this function
    my @arr = @_;
    my $sum = 0;
    for (@arr)
    {
        $sum += $_;
    }
    return $sum / scalar(@arr);
}

sub by_grade_lname
{
    # write an advanced sorting subroutine that will first NUMERICALLY
    # compare the grade VALUE in a hash and then, for grades that are
    # the same (OR clause) will sort by the alpha value (lowercase) of
    # the student's last name
    $grades{$b} <=> $grades{$a}
        or
    (split " ", $a)[0]
        cmp
    (split " ", $b)[0]
}

sub by_fname
{
    # write a simple sorting subroutine that will sort results
    # by the first name (you will need to use split in here
    (split " ", $a)[1]
        cmp
    (split " ", $b)[1]
}

# Assignment #6 asks you change the open command below to be
# inside a conditional and send a message and stop execution if the
# file trying to be opened does not exist, also print a list of
# suggested files (.txt files in the directory)
open FILE, "<", $grade_file;

# We create a while loop to read each line of the file
while($line = <FILE>)
{
    # Using use split and slicing to break up the name from the grades
    ($fullname, $grade_list) = split(": ", $line);
    # We use split to get an array of grades (splitting on the space)
    @grades = split(" ", $grade_list);
    # We use the full name as the key and the average of the grades as a value
    $grades{$fullname} = &avg(@grades);
}
# #6 asks you to use slicing to get get the 3 lines of code in the above
# while loop down to one single line of code

# === YOU SHOULD NOT MODIFY THE PRINT STATEMENTS BELOW === #

# We sort our hash by both grade and last name then print the pairs
@sorted_by_grades_then_lname = sort by_grade_lname keys %grades;
print "== Gradebook Sorted by Grades then Last Name ==\n\n";
foreach(@sorted_by_grades_then_lname)
{
    printf "%-20s \t %.2f \n", $_, $grades{$_};
}

print "\n";

# We sort our hash by first name then print the key value pairs
@sorted_by_fname = sort by_fname keys %grades;
print "== Gradebook Sorted by First Name Only ==\n\n";
foreach(@sorted_by_fname)
{
    printf "%-20s \t %.2f \n", $_, $grades{$_};
}
