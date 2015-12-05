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

my $wot = WG::API::WoT->new( application_id => 'demo' );
ok( $wot && ref $wot, 'create class' );

#can_ok( $wot, qw// );
#can_ok( $wot, qw// );
#can_ok( $wot, qw// );
#
#SKIP: {
#    skip 'developers only', 5 unless $ENV{ 'WGMODE' } && $ENV{ 'WGMODE' } eq 'dev';
#    ok( $wot->test, '' );
#    ok( $wot->test, '' );
#    ok( $wot->test, '' );
#    ok( $wot->test, '' );
#    ok( $wot->test, '' );
#};

done_testing();
