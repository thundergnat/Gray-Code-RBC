use v6.c;
unit class Gray::Code::RBC:ver<0.0.1>;

sub gray-encode ( Str(Int) \n --> Int ) is export { n +^ ( n +> 1 ) }

sub gray-decode ( Str(Int) $n is copy --> Int ) is export {
    my $mask = 1 +< (1 + ($n.msb // 0));
    $n +^= $mask +> 1 if $n +& $mask while $mask +>= 1;
    $n
}


=begin pod

=head1 NAME

Gray::Code::RBC - A simple implementation of reflected binary code Gray code

=head1 SYNOPSIS

=begin code :lang<perl6>

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

=begin code :lang<perl6>
                  binary   decimal     de-    round-
number  binary    encoded  encoded    coded    trip
 0:     00000  =>  00000      0   =>  00000      0
 1:     00001  =>  00001      1   =>  00001      1
 2:     00010  =>  00011      3   =>  00010      2
 3:     00011  =>  00010      2   =>  00011      3
 4:     00100  =>  00110      6   =>  00100      4
 5:     00101  =>  00111      7   =>  00101      5
 6:     00110  =>  00101      5   =>  00110      6
 7:     00111  =>  00100      4   =>  00111      7
 8:     01000  =>  01100     12   =>  01000      8
 9:     01001  =>  01101     13   =>  01001      9
10:     01010  =>  01111     15   =>  01010     10
11:     01011  =>  01110     14   =>  01011     11
12:     01100  =>  01010     10   =>  01100     12
13:     01101  =>  01011     11   =>  01101     13
14:     01110  =>  01001      9   =>  01110     14
15:     01111  =>  01000      8   =>  01111     15
=end code

Gray::Code::RBC is a simple implementation of the most common: reflected binary
Gray code. (Note that the spelling is always U<Gray> as it is named after
L<Bell Labs scientist: Frank Gray|https://en.wikipedia.org/wiki/Frank_Gray_(researcher)>
who originally patented it.

(There are other types of Gray code but this module doesn't provide them.)

Exports two routines:

    gray-encode() - (Takes an Integer, returns an Integer).

and

    gray-decode() - (Takes an Integer, returns an Integer).

Both routines only accept and return Integers (or a String that can be coerced
to an Integer). Any conversion to or from binary falls to other code.

Not limited by integer size. It is not unusual that Gray codes in practice are
limited to some samll (12, 16, 32) power of two. These routines are not limited
and will handle arbitrarily large Integers.

=head1 AUTHOR

Steve Schulze (thundergnat)

=head1 COPYRIGHT AND LICENSE

Copyright 2020 thundergnat

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
