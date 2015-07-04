#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;

BEGIN: { use_ok( 'WG::API::WoT::Accounts' ) };

can_ok( 'WG::API::WoT::Accounts', qw/account_list account_info account_tanks account_achievements/ );

my $wot = WG::API::WoT::Accounts->new( { application_id => 'demo' } );
ok( ! $wot->account_list(), 'get account list without params');
ok( ! $wot->account_list( search => '1234' ), 'get account list without valid params');
ok( ! $wot->account_list( { src => '1234' } ), 'get account list without required fields');
ok( $wot->account_list( { search => '1234' } ), 'get account list with search field');
ok( $wot->status eq 'ok', 'get status for account list with search field' );
   $wot = WG::API::WoT::Accounts->new( { application_id => 'demo' } );
ok( ! $wot->account_list( { search => '1', type => 'startswith' } ), 'get account list');
ok( $wot->status eq 'error', 'get account list' );
   $wot = WG::API::WoT::Accounts->new( { application_id => 'demo', debug => 1 } );
ok( ! $wot->account_list( { search => '12', type => 'exact' } ), 'get account list with search string eq 12 and type exact');
ok( $wot->status eq 'error', 'get status for request account list with search string eq 12 and type exact' );
   $wot = WG::API::WoT::Accounts->new( { application_id => 'demo' } );
ok( $wot->account_list( { search => '1234', type => 'exact' } ), 'get account list');
ok( $wot->status eq 'ok', 'get account list' );
   $wot = WG::API::WoT::Accounts->new( { application_id => 'demo' } );
ok( $wot->account_list( { search => '1234', type => 'startswith' } ), 'get account list with search and type fields');
ok( $wot->status eq 'ok', 'get account list' );

$wot = WG::API::WoT::Accounts->new( { application_id => 'demo' } );
ok( ! $wot->account_info(), 'get account info' );
ok( ! $wot->account_info( account_id => 'test' ), 'get account info' );
ok( ! $wot->account_info( { acc_id => 'test' } ), 'get account info' );
ok( ! $wot->account_info( { account_id => 'test' } ), 'get account info' );
ok( $wot->status eq 'error', 'get account info' );
$wot = WG::API::WoT::Accounts->new( { application_id => 'demo' } );
ok( $wot->account_info( { account_id => '1' } ), 'get account info' );
ok( $wot->status eq 'ok', 'get account info' );

$wot = WG::API::WoT::Accounts->new( { application_id => 'demo', dumper => 1 } );
ok( ! $wot->account_tanks(), 'get account tanks' );
ok( ! $wot->account_tanks( account_id => 'test' ), 'get account tanks' );
ok( ! $wot->account_tanks( { acc_id => 'test' } ), 'get account tanks' );
ok( ! $wot->account_tanks( { account_id => 'test' } ), 'get account tanks' );
ok( $wot->status eq 'error', 'get account tanks' );
ok( $wot->account_tanks( { account_id => '1' } ), 'get account tanks for account_id = 1' );
ok( $wot->status eq 'ok', 'get status for requrst account tanks for account_id = 1' );

$wot = WG::API::WoT::Accounts->new( { application_id => 'demo' } );
ok( ! $wot->account_achievements(), 'get account achievements' );
ok( ! $wot->account_achievements( account_id => 'test' ), 'get account achievements' );
ok( ! $wot->account_achievements( { acc_id => 'test' } ), 'get account achievements' );
ok( ! $wot->status, 'get account achievements' );
   $wot = WG::API::WoT::Accounts->new( { application_id => 'demo' } );
ok( ! $wot->account_achievements( { account_id => 'test' } ), 'get account achievements' );
ok( $wot->status eq 'error', 'get account achievements' );
   $wot = WG::API::WoT::Accounts->new( { application_id => 'demo' } );
ok( $wot->account_achievements( { account_id => '1' } ), 'get account achievements' );
ok( $wot->status eq 'ok', 'get account achievements' );
  
done_testing();
