use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'bignum',
    'VERSION_FROM'	=> 'lib/bignum.pm', # finds $VERSION
    'PREREQ_PM'		=> {
			Math::BigInt => 1.70,
			Math::BigFloat => 1.44,
			Math::BigRat => 0.12,
			}, # e.g., Module::Name => 1.1
    'INSTALLDIRS'       => 'perl',
    'LIBS'		=> [''], # e.g., '-lm'
    'DEFINE'		=> '', # e.g., '-DHAVE_SOMETHING'
    'INC'		=> '', # e.g., '-I/usr/include/other'
);
