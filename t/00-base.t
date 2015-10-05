#!/usr/bin/env perl
use 5.014;
use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok( 'WG::API' ) || say "WG::API loaded";
    use_ok( 'WG::API::Error' ) || say "WG::API::Error loaded"; 
    use_ok( 'WG::API::Data' )  || say "WG::API::Data loaded"; 
    use_ok( 'WG::API::Auth' )  || say "WG::API::Auth loaded";
}

diag( "Testing WG::API          $WG::API::VERSION, Perl $], $^X" );
diag( "Testing WG::API::Error   $WG::API::Error::VERSION, Perl $], $^X" );
diag( "Testing WG::API::Data    $WG::API::Data::VERSION, Perl $], $^X" );
diag( "Testing WG::API::Auth    $WG::API::Auth::VERSION, Perl $], $^X" );

done_testing();
