#!/usr/bin/env perl

use Modern::Perl '2015';

use WG::API;

use Log::Any::Test;
use Log::Any qw($log);
use Test::More;

my $wot = WG::API->new( application_id => $ENV{'WG_KEY'} || 'demo' )->wot;
isa_ok( $wot, 'WG::API::WoT' );

can_ok( $wot, qw/account_list account_info account_tanks account_achievements/ );
can_ok( $wot, qw/clanratings_dates clanratings_dates clanratings_clans clanratings_neighbors/ );
can_ok( $wot, qw/tanks_stats tanks_achievements/ );

SKIP: {
    skip 'developers only', 14 unless $ENV{'WGMODE'} && $ENV{'WGMODE'} eq 'dev';

    subtest 'accounts' => sub {
        ok( !$wot->account_list, 'get account list without params' );
        ok( $wot->account_list( search => 'test' ), 'get account list with params' );
        ok( !$wot->account_info, 'get account info without params' );
        ok( $wot->account_info( account_id => '244468' ), 'get account info with params' );
        ok( !$wot->account_tanks, 'get account tanks without params' );
        ok( $wot->account_tanks( account_id => '244468' ), 'get account tanks with params' );
        ok( !$wot->account_achievements, 'get account achievements without params' );
        ok( $wot->account_achievements( account_id => '244468' ), 'get account achievements with params' );
    };

    subtest 'clan ratings' => sub {
        ok( $wot->clanratings_types,  "get clan ratings types" );
        ok( $wot->clanratings_dates,  "get clan ratings dates" );
        ok( !$wot->clanratings_clans, "can't get clan ratings wo required fields" );

        my $net = WG::API->new( application_id => $ENV{'WG_KEY'} )->net;
        my $clan = $net->clans_list( limit => 1, fields => 'clan_id' )->[0];
        ok( $wot->clanratings_clans( clan_id => $clan->{clan_id} ), "get clan ratings clan" );

        my $type = $wot->clanratings_types();
        ok( !$wot->clanratings_neighbors, "can't get clan ratings neighbors wo required fields" );
        ok( $wot->clanratings_neighbors( clan_id => $clan->{clan_id}, rank_field => $type->{all}->{rank_fields}->[0] ), "get clan ratings neighbors" );
    };

    subtest 'tanks' => sub {
        ok( !$wot->tanks_stats, 'get tanks stats without params' );
        ok( !$wot->tanks_stats( account_id => 'xxx' ), 'get tanks stats with invalid params' );
        ok( $wot->tanks_stats( account_id => '244468' ), 'get tanks stats with valid params' );
        ok( !$wot->tanks_achievements, 'get tanks achievements without params' );
        ok( !$wot->tanks_achievements( account_id => 'xxx' ), 'get tanks achievements with invalid params' );
        ok( $wot->tanks_achievements( account_id => '244468' ), 'get tanks achievements with valid params' );
    };
}

$wot->set_debug(1);
$wot->account_info( account_id => '123' );
$log->contains_ok( qr/METHOD GET/, 'params for GET request logged' );

done_testing();
