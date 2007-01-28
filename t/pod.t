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
  skip( 'Test::Pod not installed on this system', $tests )
    unless do
      {
      eval "use Test::Pod;";
      $@ ? 0 : 1;
      };
  pod_file_ok( '../lib/bignum.pm' );
  pod_file_ok( '../lib/bigrat.pm' );
  pod_file_ok( '../lib/bigint.pm' );
  }

