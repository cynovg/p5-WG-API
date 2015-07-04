#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;
use Data::Dumper;
BEGIN: { use_ok( 'WG::API::WoT::Stronghold' ) };

can_ok( 'WG::API::WoT::Stronghold', qw/stronghold_info stronghold_buildings stronghold_accountstats/ );

my $wot = WG::API::WoT::Stronghold->new( { application_id => 'demo' } );
ok( ! $wot->stronghold_info(), 'get info about stronghold' );
ok( ! $wot->stronghold_info( clan_id => 1 ), 'get info about stronghold' );
ok( ! $wot->stronghold_info( { acc_id => 1 } ), 'get info about stronghold' );
ok( ! $wot->stronghold_info( { clan_id => 'test' } ), 'get info about stronghold' );
ok( $wot->status eq 'error', 'get info about stronghold' );
ok( $wot->stronghold_info( { clan_id => 1 } ), 'get info about stronghold' );
ok( $wot->status eq 'ok', 'get info about stronghold' );

   $wot = WG::API::WoT::Stronghold->new( { application_id => 'demo' } );
ok( ! $wot->stronghold_buildings( fields => 'title' ), 'get info about stronghold buildings' );
ok( $wot->stronghold_buildings(), 'get info about stronghold buildings' );
ok( $wot->status eq 'ok',   'get info abount stronghold buildings' );
ok( $wot->stronghold_buildings( { fields => 'title' } ), 'get info about stronghold buildings' );
ok( $wot->status eq 'ok',   'get info abount stronghold buildings' );

   $wot = WG::API::WoT::Stronghold->new( { application_id => 'demo' } );
ok( ! $wot->stronghold_accountstats(), 'get info about account stats' );
ok( ! $wot->stronghold_accountstats( account_id => 1 ), 'get info about account stats' );
ok( ! $wot->stronghold_accountstats( { acc_id => 1 }), 'get info about account stats' );
ok( ! $wot->stronghold_accountstats( { account_id => 'test' } ), 'get info about account stats' );
ok( $wot->status eq 'error', 'get info about account stats' );
ok( $wot->stronghold_accountstats( { account_id => 1 } ), 'get info about account stats' );
ok( $wot->status eq 'ok', 'get info about account stats' );

done_testing();
