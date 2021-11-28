my @array_of_strings = ("My Name Is Chewy Zoi!", "Hello Chewy Zoi!", "Chewy Zoi! My Name", "Chewy Hey!", "Boi! Here","Chewy Boi! My Name", "Chewy Boi! My Name","Chewy Boi! My Name");
#my %hash = ('Sales' =>    {
#    'Brown' => 'Manager',
#    'Smith' => 'Salesman',
#    'Albert' => 'Salesman',
#});


my %counts = ();
sub seq {
    for @array_of_strings -> $value {
        my @term = split(" ", $value).Array;
        my $var = 0;
        while $var != @term.elems - 1 {
            if (%counts{@term[$var]}{@term[$var + 1]}:exists) {
                %counts{@term[$var]}{@term[$var + 1]}++;
            }
            else {
                %counts{@term[$var]}{@term[$var + 1]}++;
            }
            $var++;
        }
    }
}

sub value_to_use {
    my $word = @_[0];
    my $other = @_[1];
    my $var = $word ~ " " ~ $other;
    my $temp = "\n";
    my $otherone = "";

    if (not $temp eq "\nfdsa") {
        say "Hello!";
    }
    #return $var;

}

sub another_function {
    my $another_val = "Hello!";
    my $other = "World!";
    value_to_use ($another_val, $other);
    #say $var;
}


sub sequence {

    if (%counts{"Chewy"}) {
        my @maxvalue = 0;
        my @maxkey;
        for %counts{"Chewy"}.sort -> (:key($k), :value($v)) {
            if ($v gt @maxvalue) {
                @maxvalue = $v;
                @maxkey = $k;
            }
            say @maxvalue, @maxkey;
        }
        say @maxvalue, @maxkey;
    }
}

another_function;
##say %var.kv.first.max;
#my @var1 = %var.values.max;
#say %var.keys(@var1).first;

#say %counts;
#my @term = split(" ", @string).Array;
#say @term.elems;
#for @term -> $item {
#    say $item;
#}