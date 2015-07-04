#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;
BEGIN: { use_ok( 'WG::API::WoT::Globalwar' ) };

can_ok( 'WG::API::WoT::Globalwar', qw/
    globalwar_clans globalwar_maps globalwar_provinces globalwar_tournaments globalwar_battles 
    globalwar_accountpoints globalwar_accountpointshistory globalwar_accountpointsrating 
    globalwar_clanpoints globalwar_clanpointshistory globalwar_clanpointsrating globalwar_clanprovinces/ );

my $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_clans(), 'get global war clans');
ok( ! $wot->globalwar_clans( map_id => 1 ), 'get global war clans');
ok( ! $wot->globalwar_clans( { app_id => 1 } ), 'get global war clans');
ok( ! $wot->globalwar_clans( { map_id => 'test' } ), 'get global war clans');
ok( $wot->status eq 'error', 'get global war clans' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( $wot->globalwar_clans( { map_id => '1' } ), 'get global war clans');
ok( $wot->status eq 'ok', 'get global war clans' );

   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_maps( fields => 'test' ), 'get global war maps');
ok( ! $wot->globalwar_maps( { fields => 'test' } ), 'get global war maps');
ok( $wot->status eq 'error', 'get global war maps' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( $wot->globalwar_maps( { fields => 'map_url' } ), 'get global war maps');
ok( $wot->status eq 'ok', 'get global war maps' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( $wot->globalwar_maps(), 'get global war maps');
ok( $wot->status eq 'ok', 'get global war maps' );

   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_provinces(), 'get global war provinces');
ok( ! $wot->globalwar_provinces( map_id => 1 ), 'get global war provinces');
ok( ! $wot->globalwar_provinces( { app_id => 1 } ), 'get global war provinces');
ok( ! $wot->globalwar_provinces( { map_id => 'test' } ), 'get global war provinces');
ok( $wot->status eq 'error', 'get global war provinces' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( $wot->globalwar_provinces( { map_id => '1' } ), 'get global war provinces');
ok( $wot->status eq 'ok', 'get global war provinces' );

   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_tournaments(), 'get global war tournaments');
ok( ! $wot->globalwar_tournaments( map_id => '1', province_id => 'YU_08' ), 'get global war tournaments');
ok( ! $wot->globalwar_tournaments( { app_id => '1', province_id => 'YU_08' } ), 'get global war tournaments');
ok( ! $wot->globalwar_tournaments( { map_id => '1', app_id => 'YU_08' } ), 'get global war tournaments');
ok( ! $wot->globalwar_tournaments( { map_id => 'test', province_id => 'test' } ), 'get global war tournaments');
ok( $wot->status eq 'error', 'get global war tournaments' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_tournaments( { map_id => 'test', province_id => 'YU_08' } ), 'get global war tournaments');
ok( $wot->status eq 'error', 'get global war tournaments' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
$wot->globalwar_tournaments( { map_id => '1', province_id => 'test' } );
ok( $wot->status eq 'ok', 'get global war tournaments' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
$wot->globalwar_tournaments( { map_id => '1', province_id => 'YU_08' } );
ok( $wot->status eq 'ok', 'get global war tournaments' );

   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_battles(), 'get global war battles');
ok( ! $wot->globalwar_battles( map_id => 1, clan_id => 1 ), 'get global war battles');
ok( ! $wot->globalwar_battles( { app_id => 1, clan_id => 1 } ), 'get global war battles');
ok( ! $wot->globalwar_battles( { map_id => 1, app_id => 1 } ), 'get global war battles');
ok( ! $wot->globalwar_battles( { map_id => 'test', clan_id => 'test' } ), 'get global war battles');
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_battles( { map_id => 1, clan_id => 'test' } ), 'get global war battles');
ok( $wot->status eq 'error', 'get global war battles' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_battles( { map_id => 'test', clan_id => 1 } ), 'get global war battles');
ok( $wot->status eq 'error', 'get global war battles' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( $wot->globalwar_battles( { map_id => 1, clan_id => 1 } ), 'get global war battles');
ok( $wot->status eq 'ok', 'get global war battles' );

   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_accountpoints(), 'get global war account pounts');
ok( ! $wot->globalwar_accountpoints( account_id => 1, map_id => 1 ), 'get global war account pounts');
ok( ! $wot->globalwar_accountpoints( { acc_id => 1, map_id => 1 } ), 'get global war account pounts');
ok( ! $wot->globalwar_accountpoints( { account_id => 1, app_id => 1 } ), 'get global war account pounts');
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_accountpoints( { account_id => 'test', map_id => 'test' } ), 'get global war account pounts');
ok( $wot->status eq 'error', 'get global war account points' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_accountpoints( { account_id => '1', map_id => 'test' } ), 'get global war account pounts');
ok( $wot->status eq 'error', 'get global war account points' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_accountpoints( { account_id => 'test', map_id => '1' } ), 'get global war account pounts');
ok( $wot->status eq 'error', 'get global war account points' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( $wot->globalwar_accountpoints( { account_id => 1, map_id => 1 } ), 'get global war account pounts');
ok( $wot->status eq 'ok', 'get globalwar account points' );

   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_accountpointshistory(), 'get global war account points history');
ok( ! $wot->globalwar_accountpointshistory( access_token => 'test', map_id => '1' ), 'get global war account points history');
ok( ! $wot->globalwar_accountpointshistory( { access_token => 'test', map_id => 'test' } ), 'get global war account points history');
ok( ! $wot->globalwar_accountpointshistory( { access_token => 'test', map_id => '1' } ), 'get global war account points history');

   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_accountpointsrating(), 'get global war account points rating');
ok( ! $wot->globalwar_accountpointsrating( map_id => 1 ), 'get global war account points rating');
ok( ! $wot->globalwar_accountpointsrating( { app_id => 1 } ), 'get global war account points rating');
ok( ! $wot->globalwar_accountpointsrating( { map_id => 'test' } ), 'get global war account points rating');
ok( $wot->status eq 'error', 'get global war account points rating' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
$wot->globalwar_accountpointsrating( { map_id => '1' } );
ok( $wot->status eq 'ok', 'get global war account points rating' );

   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_clanpoints(), 'get global war clan points');
ok( ! $wot->globalwar_clanpoints( map_id => 1, clan_id => 1 ), 'get global war clan points');
ok( ! $wot->globalwar_clanpoints( { app_id => 1, clan_id => 1 } ), 'get global war clan points');
ok( ! $wot->globalwar_clanpoints( { map_id => 1, app_id => 1 } ), 'get global war clan points');
ok( ! $wot->globalwar_clanpoints( { map_id => 'test', clan_id => 'test' } ), 'get global war clan points');
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_clanpoints( { map_id => 1, clan_id => 'test' } ), 'get global war clan points');
ok( $wot->status eq 'error', 'get global war clan points' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_clanpoints( { map_id => 'test', clan_id => 1 } ), 'get global war clan points');
ok( $wot->status eq 'error', 'get global war clan points' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
$wot->globalwar_clanpoints( { map_id => 1, clan_id => 1 } );
ok( $wot->status eq 'ok', 'get global war clan points' );

   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_clanpointshistory(), 'get global war clan points history');
ok( ! $wot->globalwar_clanpointshistory( map_id => 1, clan_id => 1 ), 'get global war clan points history');
ok( ! $wot->globalwar_clanpointshistory( { app_id => 1, clan_id => 1 } ), 'get global war clan points history');
ok( ! $wot->globalwar_clanpointshistory( { map_id => 1, app_id => 1 } ), 'get global war clan points history');
ok( ! $wot->globalwar_clanpointshistory( { map_id => 'test', clan_id => 'test' } ), 'get global war clan points history');
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_clanpointshistory( { map_id => 1, clan_id => 'test' } ), 'get global war clan points history');
ok( $wot->status eq 'error', 'get global war clan points history' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_clanpoints( { map_id => 'test', clan_id => 1 } ), 'get global war clan points history');
ok( $wot->status eq 'error', 'get global war clan points history' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
$wot->globalwar_clanpointshistory( { map_id => 1, clan_id => 1 } );
ok( $wot->status eq 'ok', 'get global war clan points history' );

   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_clanpointsrating(), 'get global war clan points rating');
ok( ! $wot->globalwar_clanpointsrating( map_id => 1 ), 'get global war clan points rating');
ok( ! $wot->globalwar_clanpointsrating( { app_id => 1 } ), 'get global war clan points rating');
ok( ! $wot->globalwar_clanpointsrating( { map_id => 'test' } ), 'get global war clan points rating');
ok( $wot->status eq 'error', 'get global war clan points rating' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
$wot->globalwar_clanpointsrating( { map_id => '1' } );
ok( $wot->status eq 'ok', 'get global war clan points rating' );

   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
ok( ! $wot->globalwar_clanprovinces(), 'get global war clan provinces');
ok( ! $wot->globalwar_clanprovinces( clan_id => '1' ), 'get global war clan provinces');
ok( ! $wot->globalwar_clanprovinces( { clan_id => 'test' } ), 'get global war clan provinces');
ok( $wot->status eq 'error', 'get wot global war clan provinces' );
   $wot = WG::API::WoT::Globalwar->new( { application_id => 'demo' } );
$wot->globalwar_clanprovinces( { clan_id => '1' } );
ok( $wot->status eq 'ok', 'get wot global war clan provinces' );

done_testing();
