#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use lib ( 'lib' );

use Test::More;
use DDP;

BEGIN: {
    use_ok( 'WG::API::NET'              || say "WG::API::NET loaded" );
}
diag( "WG::API::NET             $WG::API::NET::VERSION, Perl $], $^X" );

can_ok( 'WG::API::NET', qw/new/ );

my $wg = WG::API::NET->new( application_id => 'demo' );
ok( $wg && ref $wg, 'create class' );

can_ok( $wg, qw/servers_info/ );
ok( $wg->servers_info, 'get servers info without params' );
ok( $wg->servers_info( game => 'wot' ), 'get servers info with params' );
ok( $wg->servers_info( game => 'wot', fields => 'server' ), 'get servers info with params' );
ok( $wg->servers_info( game => 'wot', fields => 'server, players_online' ), 'get servers info with params' );
ok( $wg->servers_info( fields => 'server, players_online' ), 'get servers info with params' );
ok( $wg->servers_info( fields => 'server' ), 'get servers info with params' );

can_ok( $wg, qw/accounts_list account_info/ );
can_ok( $wg, qw/clans_list clans_info clans_membersinfo clans_glossary clans_messageboard/ );

done_testing();