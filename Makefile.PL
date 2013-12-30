
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Skryf blog plugin",
  "AUTHOR" => "Adam Stokes <adamjs\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-skryf-Plugin-Blog",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "App::skryf::Plugin::Blog",
  "PREREQ_PM" => {
    "App::skryf::Util" => 0,
    "DateTime" => 0,
    "DateTime::Format::RFC3339" => 0,
    "Mango::BSON" => 0,
    "Method::Signatures" => 0,
    "Mojo::Base" => 0,
    "Mojo::JSON" => 0
  },
  "TEST_REQUIRES" => {
    "DDP" => 0,
    "FindBin" => 0,
    "List::Util" => 0,
    "Test::Mojo" => 0,
    "Test::More" => 0,
    "lib" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.001_02",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "App::skryf::Util" => 0,
  "DDP" => 0,
  "DateTime" => 0,
  "DateTime::Format::RFC3339" => 0,
  "FindBin" => 0,
  "List::Util" => 0,
  "Mango::BSON" => 0,
  "Method::Signatures" => 0,
  "Mojo::Base" => 0,
  "Mojo::JSON" => 0,
  "Test::Mojo" => 0,
  "Test::More" => 0,
  "lib" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



