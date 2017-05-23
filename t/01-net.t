#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use lib ( 'lib' );

use WG::API;

use Test::More;

my $wg = WG::API->new( application_id => $ENV{ 'WG_KEY' } || 'demo' );
ok( $wg && ref $wg, 'create class' );
ok( $wg = $wg->net, 'get WG::API::NET instance');
isa_ok( $wg, 'WG::API::NET', 'valid instance');

can_ok( $wg, qw/servers_info/ );
can_ok( $wg, qw/accounts_list account_info/ );
can_ok( $wg, qw/clans_list clans_info clans_membersinfo clans_glossary clans_messageboard/ );

SKIP: {
    skip 'developers only', 8 unless $ENV{ 'WGMODE' } && $ENV{ 'WGMODE' } eq 'dev';

    ok( $wg->servers_info, 'get servers info without params' );
    ok( $wg->servers_info( game => 'wot' ), 'get servers info with params' );
    ok( $wg->servers_info( game => 'wot', fields => 'server' ), 'get servers info with params' );
    ok( $wg->servers_info( game => 'wot', fields => 'server, players_online' ), 'get servers info with params' );
    ok( $wg->servers_info( fields => 'server, players_online' ), 'get servers info with params' );
    ok( $wg->servers_info( fields => 'server' ), 'get servers info with params' );
    ok( ! $wg->servers_info( fields => 'sever' ), 'get servers info with invalid params' );
    ok( $wg->error, 'error with invalid field name' );

    #accounts
    my $accounts;
    is( $accounts = $wg->accounts_list( game => 'wot' ), undef, 'Get accounts without search field' );
    is( $wg->error->code, '997', 'get error' );
    ok( $accounts = $wg->accounts_list( search => 'test' ), 'Search accounts' );
    is( $wg->error, undef, 'search accounts without errors' );
    
    my $account;
    ok( $account = $wg->account_info( account_id => $accounts->[0]->{'account_id'} ), 'Get account info' );
    is( $wg->error, undef, 'Get account info without errors' );
    like( $account->{nickname}, qr/test/i, 'Verified account' );
    
    is( $wg->account_info( account_id => undef ), undef, 'Get account info without account_id' );
    is( $wg->account_info( account_id => 'test' ), undef, 'Get account info with invalid account_id' );
};

done_testing();
