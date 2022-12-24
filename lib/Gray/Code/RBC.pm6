unit class Gray::Code::RBC:ver<0.0.4>;

sub gray-encode ( $n  is copy where Int|Str --> Int ) is export {
    $n.=Int;
    $n +^ ( $n +> 1 ) }

sub gray-decode ( $n is copy where Int|Str --> Int ) is export {
    $n.=Int;
    my $mask = 2 +< ($n.msb // 0);
    $n +^= $mask +> 1 if $n +& $mask while $mask +>= 1;
    $n
}


=begin pod

=head1 NAME
Gray::Code::RBC

A simple implementation of reflected binary Gray code

=head1 SYNOPSIS

=begin code :lang<raku>

use Gray::Code::RBC;

say gray-encode(73);
# 93

say gray-encode(73).fmt: '%b';
# 1101101

say gray-decode(93);
# 73

say gray-encode("١٢٣");
# 70

=end code

=head1 DESCRIPTION

Gray code is an integer encoding such that adjacent values differ by at most one bit.

=begin code :lang<raku>
                  binary   decimal     de-    round-
number  binary    encoded  encoded    coded    trip
 0:      0000  =>   0000      0   =>   0000      0
 1:      0001  =>   0001      1   =>   0001      1
 2:      0010  =>   0011      3   =>   0010      2
 3:      0011  =>   0010      2   =>   0011      3
 4:      0100  =>   0110      6   =>   0100      4
 5:      0101  =>   0111      7   =>   0101      5
 6:      0110  =>   0101      5   =>   0110      6
 7:      0111  =>   0100      4   =>   0111      7
 8:      1000  =>   1100     12   =>   1000      8
 9:      1001  =>   1101     13   =>   1001      9
10:      1010  =>   1111     15   =>   1010     10
11:      1011  =>   1110     14   =>   1011     11
12:      1100  =>   1010     10   =>   1100     12
13:      1101  =>   1011     11   =>   1101     13
14:      1110  =>   1001      9   =>   1110     14
15:      1111  =>   1000      8   =>   1111     15
=end code

Gray::Code::RBC is a simple implementation of the most common: reflected binary
code Gray code. (Note that the spelling is always U<Gray> as it is named after
L<Bell Labs scientist: Frank Gray|https://en.wikipedia.org/wiki/Frank_Gray_(researcher)>
who originally popularized and patented it.)

(There are other types of Gray code but this module doesn't provide them.)

Exports two routines:

    C<gray-encode()> - Convert a decimal Integer to Gray code (Takes an Integer, returns an Integer).

and

    C<gray-decode()> - Convert a Gray code value to a decimal Integer (Takes an Integer, returns an Integer).

Both routines only accept and return Integers (or a String that can be coerced
to an Integer). Any conversion to or from binary falls to other code.

Not limited by integer size. It is not unusual that Gray codes in practice are
limited to some small (12, 16, 32) power of two. These routines are not thus limited
and will handle arbitrarily large Integers.

=head1 AUTHOR

Steve Schulze (thundergnat)

=head1 COPYRIGHT AND LICENSE

Copyright 2020 thundergnat

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
