use v6.c;
use Test;
use Gray::Code::RBC;

plan 52;

my @t = <0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 23 30 37 44 51 58 65 72 12345678987654321 ١٢٣>;
my @g = <0 1 3 2 6 7 5 4 12 13 15 14 10 11 9 8 28 17 55 58 42 39 97 108 17506966710062825 70>;

for ^@t {
    is(@t[$_].&gray-encode, @g[$_], "{@t[$_]} encode");
    is(@g[$_].&gray-decode, +@t[$_], "{@g[$_]} decode");
}


done-testing;
