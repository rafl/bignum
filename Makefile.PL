
use strict;

# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# The name of your distribution
name		'bignum';

# Get most of the details from the primary module
all_from	'lib/bignum.pm';

requires	'perl'		=> "5.006002";
requires	'Math::BigInt'	=> 1.79;
requires	'Math::BigRat'	=> 0.17;

build_requires	'Test::More'	=> 0.47;

license		'gpl';

author		'Tels <nospam-abuse@bloodgate.com>';

# install this over the version in the Perl core
makemaker_args INSTALLDIRS => 'perl';

# We cannot work without our prerequisites
makemaker_args PREREQ_FATAL => 1;

# Generate the Makefile
WriteAll;
