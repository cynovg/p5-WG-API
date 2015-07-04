#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;

BEGIN: { use_ok( 'WG::API::WoT::Regularteams' ) };

can_ok( 'WG::API::WoT::Regularteams', qw/regularteams_list regularteams_info/ );
    
my $wot = WG::API::WoT::Regularteams->new( { application_id => 'demo' } );
ok( ! $wot->regularteams_list( account_id => 1 ), 'get regular teams list' );
ok( ! $wot->status, 'get regular teams list' );
ok( $wot->regularteams_list(), 'get regular teams list' );
ok( $wot->status eq 'ok', 'get regular teams list' );
   $wot = WG::API::WoT::Regularteams->new( { application_id => 'demo' } );
ok( $wot->regularteams_list( { search => 'test' } ), 'get regular teams list' );
ok( $wot->status eq 'ok', 'get regular teams list' );

   $wot = WG::API::WoT::Regularteams->new( { application_id => 'demo' } );
ok( ! $wot->regularteams_info(), 'get regular teams info' );
ok( ! $wot->regularteams_info( account_id => 1 ), 'get regular teams info' );
ok( ! $wot->regularteams_info( { acc_id => 1 } ), 'get regular teams info' );
ok( ! $wot->regularteams_info( { team_id => 'test' } ), 'get regular teams info' );
ok( $wot->status eq 'error', 'get regular teams info' );
   $wot = WG::API::WoT::Regularteams->new( { application_id => 'demo' } );
ok( $wot->regularteams_info( { team_id => 1 } ), 'get regular teams info' );
ok( $wot->status eq 'ok', 'get regular teams info' );

done_testing();
