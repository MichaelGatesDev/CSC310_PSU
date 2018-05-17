#!/usr/bin/env perl
use warnings;


# Initialize empty hash
# %phones = ();

# Initialize has on the fly
#$phones{"Tyler"} = "5185551234";

# print $phones{"Tyler"} . "\n";

%phones = ("Tyler" => "5185551234",
            "John" => "5245556666");

# @keys = keys %phones;
# @vals = values %phones;

#for $item (@keys){ print $item . "\n"; }
#for $item (@vals){ print $item . "\n"; }


# while(($name, $phone) = each %phones){ print "$name: $phone\n"; }
# if(exists($phones{"John"})){ delete $phones{"John"}; }


# Keys are deleted with:
# delete $phones{"Tyler"}
# NOT
# $phones{"Tyler"} = undef;
