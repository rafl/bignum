#!/usr/bin/perl -w

###############################################################################

use Test;
use strict;

BEGIN
  {
  $| = 1;
  chdir 't' if -d 't';
  unshift @INC, '../lib';
  plan tests => 9;
  }

use bigint;

###############################################################################
# general tests

my $x = 5; ok (ref($x),'Math::BigInt');		# :constant

# todo:  ok (2 + 2.5,4.5);				# should still work
# todo: $x = 2 + 3.5; ok (ref($x),'Math::BigFloat');

$x = 2 ** 255; ok (ref($x),'Math::BigInt');

ok (12->bfac(),479001600);
ok (9/4,2);

#bignum->accuracy(20);					# causes deep recursion

###############################################################################
# accurarcy and precision

# this might change!

ok_undef ($Math::BigInt::accuracy);
ok_undef ($Math::BigInt::precision);
bigint->accuracy(5);
ok ($Math::BigInt::accuracy,5);
bigint->precision(-2);
ok_undef ($Math::BigInt::accuracy);
ok ($Math::BigInt::precision,-2);

###############################################################################
###############################################################################
# Perl 5.005 does not like ok ($x,undef)

sub ok_undef
  {
  my $x = shift;

  ok (1,1) and return if !defined $x;
  ok ($x,'undef');
  }
