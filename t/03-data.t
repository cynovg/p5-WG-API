#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use lib( './lib');
use WG::API::Clans;
use Test::More;

my $wg = WG::API::Clans->new( { 
            application_id  => 'demo1',
            lang            => 'ru',
            api_uri         => 'api.worldoftanks.ru/wgn',
            debug           => '1',
        } );
# without data (invalid request)
$wg->clans_list( { limit => '1' } );
ok( ! $wg->response,                   'get response datas' );

    $wg = WG::API::Clans->new( { 
            application_id  => 'demo',
            lang            => 'ru',
            api_uri         => 'api.worldoftanks.ru/wgn',
            debug           => '1',
        } );
# with data (valid request)
$wg->clans_list( { limit => '1' } );
ok( $wg->response,                   'get response data' );
ok( scalar @{ $wg->response } == 1,     'response count ok' );

done_testing();