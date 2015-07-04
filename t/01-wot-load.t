#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok( 'WG::API::WoT' || say "WG::API::WoT loaded");
    use_ok( 'WG::API::WoT::Accounts' || say "WG::API::WoT::Accounts loaded");
    use_ok( 'WG::API::WoT::Clans' || say "WG::API::WoT::Clans loaded");
    use_ok( 'WG::API::WoT::Stronghold' || say "WG::API::WoT::Stronghold loaded");
    use_ok( 'WG::API::WoT::Globalwar' || say "WG::API::WoT::Globalwar loaded");
    use_ok( 'WG::API::WoT::Ratings' || say "WG::API::WoT::Ratings loaded");
    use_ok( 'WG::API::WoT::ClansRatings' || say "WG::API::WoT::ClansRatings loaded");
    use_ok( 'WG::API::WoT::Tanks' || say "WG::API::WoT::Tanks loaded");
    use_ok( 'WG::API::WoT::Regularteams' || say "WG::API::WoT::Regularteams loaded");
}
diag( "WG::API::WoT                 $WG::API::WoT::VERSION,                 Perl $], $^X" );
diag( "WG::API::WoT::Accounts       $WG::API::WoT::Accounts::VERSION,       Perl $], $^X" );
diag( "WG::API::WoT::Clans          $WG::API::WoT::Clans::VERSION,          Perl $], $^X" );
diag( "WG::API::WoT::Stronghold     $WG::API::WoT::Stronghold::VERSION,     Perl $], $^X" );  
diag( "WG::API::WoT::Globalwar      $WG::API::WoT::Globalwar::VERSION,      Perl $], $^X" );
diag( "WG::API::WoT::Ratings        $WG::API::WoT::Ratings::VERSION,        Perl $], $^X" );
diag( "WG::API::WoT::ClansRatings   $WG::API::WoT::ClansRatings::VERSION,   Perl $], $^X" );
diag( "WG::API::WoT::Tanks          $WG::API::WoT::Tanks::VERSION,          Perl $], $^X" );
diag( "WG::API::WoT::Regularteams   $WG::API::WoT::Regularteams::VERSION,   Perl $], $^X" );

done_testing();
