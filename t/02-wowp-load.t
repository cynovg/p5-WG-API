#!/usr/bin/env perl
use 5.014;
use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok( 'WG::API::WoWp' )               || say "WG::API::WoWp loaded";
    use_ok( 'WG::API::WoWp::Accounts' )     || say "WG::API::WoWp::Accounts loaded";
    use_ok( 'WG::API::WoWp::Ratings' )      || say "WG::API::WoWp::Ratings loaded";
}

diag( "Testing WG::API::WoWp                $WG::API::WoWp::VERSION,            Perl $], $^X" );
diag( "Testing WG::API::WoWp::Accounts      $WG::API::WoWp::Accounts::VERSION,  Perl $], $^X" );
diag( "Testing WG::API::WoWp::Ratings       $WG::API::WoWp::Ratings::VERSION,   Perl $], $^X" );

done_testing();
