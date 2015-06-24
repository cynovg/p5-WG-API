#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;

BEGIN: { use_ok( 'WG::API::WoT::ClansRatings' ) };

can_ok( 'WG::API::WoT::ClansRatings', qw/clanratings_types clanratings_dates clanratings_clans clanratings_neighbors clanratings_top/ );

my $wot = WG::API::WoT::ClansRatings->new( { application_id => 'demo' } );
ok( ! $wot->clanratings_types( fields => 'type' ), 'get clan ratings types' );
ok( $wot->clanratings_types( { fields => 'type' } ), 'get clan ratings types' );
ok( $wot->status eq 'ok', 'get clan ratings types' );
   $wot = WG::API::WoT::ClansRatings->new( { application_id => 'demo' } );
ok( $wot->clanratings_types(), 'get clan ratings types' );
ok( $wot->status eq 'ok', 'get clan ratings types' );

   $wot = WG::API::WoT::ClansRatings->new( { application_id => 'demo' } );
ok( ! $wot->clanratings_dates(), 'get clan ratings dates' );
ok( ! $wot->clanratings_dates( acc_id => 1 ), 'get clan ratings dates' );
ok( ! $wot->clanratings_dates( { acc_id => 1 }), 'get clan ratings dates' );
ok( ! $wot->clanratings_dates( { type => 'test' } ), 'get clan ratings dates' );
ok( $wot->status eq 'error', 'get clan ratings dates' );
ok( $wot->clanratings_dates( { type => '1' } ), 'get clan ratings dates' );
ok( $wot->status eq 'ok', 'get clan ratings dates' );

   $wot = WG::API::WoT::ClansRatings->new( { application_id => 'demo' } );
ok( ! $wot->clanratings_clans(), 'get clan ratings clans' );
ok( ! $wot->clanratings_clans( clan_id => 1, type => 1 ), 'get clan ratings clans' );
ok( ! $wot->clanratings_clans( { clan_id => 1 } ), 'get clan ratings clans' );
ok( ! $wot->clanratings_clans( { type => 1 } ), 'get clan ratings clans' );
   $wot = WG::API::WoT::ClansRatings->new( { application_id => 'demo' } );
ok( ! $wot->clanratings_clans( { clan_id => 'test', type => 1 } ), 'get clan ratings clans' );
ok( $wot->status eq 'error', 'get clan ratings clans' );
   $wot = WG::API::WoT::ClansRatings->new( { application_id => 'demo' } );
ok( ! $wot->clanratings_clans( { clan_id => 1, type => 'test' } ), 'get clan ratings clans' );
ok( $wot->status eq 'error', 'get clan ratings clans' );
   $wot = WG::API::WoT::ClansRatings->new( { application_id => 'demo' } );
ok( $wot->clanratings_clans( { clan_id => 1, type => 1 } ), 'get clan ratings clans' );
ok( $wot->status eq 'ok', 'get clan ratings clans' );

TODO: {
    todo_skip 'not implemented', '5';

    ok( $wot->clanratings_neighbors(), 'get clan ratings neighbors' );
    ok( $wot->clanratings_top(), 'get clan ratings top' );
};

done_testing();
