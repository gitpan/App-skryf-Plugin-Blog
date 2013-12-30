requires "App::skryf::Util" => "0";
requires "DateTime" => "0";
requires "DateTime::Format::RFC3339" => "0";
requires "Mango::BSON" => "0";
requires "Method::Signatures" => "0";
requires "Mojo::Base" => "0";
requires "Mojo::JSON" => "0";

on 'test' => sub {
  requires "DDP" => "0";
  requires "FindBin" => "0";
  requires "List::Util" => "0";
  requires "Test::Mojo" => "0";
  requires "Test::More" => "0";
  requires "lib" => "0";
  requires "strict" => "0";
  requires "warnings" => "0";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "6.30";
};
