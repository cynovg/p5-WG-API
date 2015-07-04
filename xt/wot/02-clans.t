#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;
BEGIN: { use_ok( 'WG::API::WoT::Clans' ) };

can_ok( 'WG::API::WoT::Clans', qw/clan_provinces/ );

my $wot = WG::API::WoT::Clans->new( { application_id => 'demo' } );
ok( ! $wot->clan_provinces(), 'get clan provinces' );
ok( ! $wot->clan_provinces( clan_id => 1 ), 'get clan provinces' );
ok( ! $wot->clan_provinces( { app_id => 1 } ), 'get clan provinces' );
ok( ! $wot->clan_provinces( { clan_id => 'test' } ), 'get clan provinces' );
ok( $wot->status eq 'error', 'get clan provinces' );
   $wot = WG::API::WoT::Clans->new( { application_id => 'demo' } );
ok( $wot->clan_provinces( { clan_id => '1' } ), 'get clan provinces' );
ok( $wot->status eq 'ok', 'get clan provinces' );

done_testing();
