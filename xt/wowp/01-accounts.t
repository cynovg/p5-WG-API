#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use WG::API::WoWp::Accounts;

use Test::More;

can_ok( 'WG::API::WoWp::Accounts', qw/account_list account_info account_planes/);

my $wowp = WG::API::WoWp::Accounts->new( { application_id => 'demo' } );
ok( $wowp,                                                              'accounts-class created' );
ok( ! $wowp->account_list(),                                            'get account list without params' );
ok( ! $wowp->account_list( search => 'test' ),                          'get account list with invalid params');
ok( ! $wowp->account_list( { type => 'exact' } ),                       'get account list with invalid params');
ok( ! $wowp->account_list( { search => 't' } ),                         'get account list with too short search string for default type');
ok( ! $wowp->account_list( { search => 't', type => 'exact' } ),        'get account list with short search string for exact type');

ok( $wowp->account_list( { search => 'test' } ),                        'get account list with valid search string');
my $response = $wowp->response->[ 0 ];

$wowp = WG::API::WoWp::Accounts->new( { application_id => 'demo' } );
ok( ! $wowp->account_info(), 'get account info without params' );
ok( ! $wowp->account_info( cid => 1 ), 'get account info with scalar param' );
ok( ! $wowp->account_info( { cid => 1 } ), 'get account info with invalid param' );
ok( ! $wowp->account_info( { account_id => 'test' } ), 'get account info with invalid account id' );
ok( $wowp->account_info( { account_id => $response->{ 'account_id' } } ), 'get account info with valid param' );

$wowp = WG::API::WoWp::Accounts->new( { application_id => 'demo' } );
ok( ! $wowp->account_planes(), 'get account planes without params' );
ok( ! $wowp->account_planes( cid => 1 ), 'get account planes with scalar param' );
ok( ! $wowp->account_planes( { cid => 1 } ), 'get account planes with invalid param' );
ok( ! $wowp->account_planes( { account_id => 'test' } ), 'get account planes with invalid account id' );
ok( $wowp->account_planes( { account_id => $response->{ 'account_id' } } ), 'get account planes with valid params' );

done_testing();
