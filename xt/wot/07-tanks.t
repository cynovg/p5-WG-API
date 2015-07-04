#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;

BEGIN: { use_ok( 'WG::API::WoT::Tanks' ) };

can_ok( 'WG::API::WoT::Tanks', qw/tanks_stats tanks_achievements/ );

my $wot = WG::API::WoT::Tanks->new( { application_id => 'demo' } );
ok( ! $wot->tanks_stats(), 'get tanks stats' );
ok( ! $wot->status, 'get tansk stats' );
ok( ! $wot->tanks_stats( account_id => 1 ), 'get tanks stats' );
ok( ! $wot->status, 'get tansk stats' );
ok( ! $wot->tanks_stats( { acc_id => 1 } ), 'get tanks stats' );
ok( ! $wot->status, 'get tansk stats' );
ok( ! $wot->tanks_stats( { account_id => 'test' } ), 'get tanks stats' );
ok( $wot->status eq 'error', 'get tanks stats' );
ok( $wot->tanks_stats( { account_id => 1 } ), 'get tanks stats' );
ok( $wot->status eq 'ok', 'get tanks stats' );

   $wot = WG::API::WoT::Tanks->new( { application_id => 'demo' } );
ok( ! $wot->tanks_achievements(), 'get tanks achievements' );
ok( ! $wot->status, 'get tanks achievements' );
ok( ! $wot->tanks_achievements( account_id => 1 ), 'get tanks achievements' );
ok( ! $wot->status, 'get tanks achievements' );
ok( ! $wot->tanks_achievements( { acc_id => 1 } ), 'get tanks achievements' );
ok( ! $wot->status, 'get tanks achievements' );
ok( ! $wot->tanks_achievements( { account_id => 'test' } ), 'get tanks achievements' );
ok( $wot->status eq 'error', 'get tanks achievements' );
ok( $wot->tanks_achievements( { account_id => '1' } ), 'get tanks achievements' );
ok( $wot->status eq 'ok', 'get tanks achievements' );

done_testing();
