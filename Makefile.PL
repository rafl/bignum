use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'bignum',
    'VERSION_FROM'	=> 'lib/bignum.pm', # finds $VERSION
    'PREREQ_PM'		=> {
			Math::BigInt => 1.53,
			Math::BigFloat => 1.30,
			Math::BigRat => 0.02,
			}, # e.g., Module::Name => 1.1
    'LIBS'		=> [''], # e.g., '-lm'
    'DEFINE'		=> '', # e.g., '-DHAVE_SOMETHING'
    'INC'		=> '', # e.g., '-I/usr/include/other'
);
