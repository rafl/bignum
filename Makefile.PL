use ExtUtils::MakeMaker;

sub MY::metafile {
  package MY;
  my $self = shift;
  if (!eval { require YAML; 1 })
  {
    warn ("YAML not installed, 'make dist' will not override META.yml");
    return $self->SUPER::metafile_target(@_);
  };

  my $node = new YAML::Node {};

  $node->{name}			= $self->{DISTNAME};
  $node->{version}		= $self->{VERSION};
  $node->{version_from}		= $self->{VERSION_FROM};
  $node->{license}		= 'perl';
  $node->{distribution_type}	= 'module';
  $node->{generated_by}		= "$self->{DISTNAME} version $self->{VERSION}";
  $node->{installdirs}		= 'perl';
  $node->{requires}		= $self->{PREREQ_PM};

  my $dump = YAML::Dump( $node );

  $dump =~ s/^(.*)$/\t\$(NOECHO) \$(ECHO) "$1" >>META.yml/gm;
  $dump =~ s/>>META\.yml/>META.yml/;

  return "metafile:\n$dump";
}

WriteMakefile(
    'NAME'		=> 'bignum',
    'VERSION_FROM'	=> 'lib/bignum.pm', # finds $VERSION
    'PREREQ_PM'		=> {
			Math::BigInt => 1.75,
			Math::BigFloat => 1.50,
			Math::BigRat => 0.15,
			},
    'INSTALLDIRS'       => 'perl',
    'LIBS'		=> [''], # e.g., '-lm'
    'DEFINE'		=> '', # e.g., '-DHAVE_SOMETHING'
    'INC'		=> '', # e.g., '-I/usr/include/other'
);
