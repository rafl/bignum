#!/usr/bin/perl -w

use Test::More;
use strict;

my $tests;

BEGIN
   {
   $tests = 3;
   plan tests => $tests;
   chdir 't' if -d 't';
   use lib '../lib';
   };

SKIP:
  {
  skip("Test::Pod::Coverage 1.08 required for testing POD coverage", $tests)
    unless do {
    eval "use Test::Pod::Coverage 1.08";
    $@ ? 0 : 1;
    };

  for my $m (qw/bignum bigint bigrat/)
    {
    pod_coverage_ok( $m, "All our ${m}s are covered" );
    }
  }

