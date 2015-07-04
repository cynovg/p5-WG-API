#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use WG::API::Clans;
use WG::API::Data;
use Test::More;

my $wg = WG::API::Clans->new( { 
            application_id  => 'demo1',
            lang            => 'ru',
            api_uri         => 'api.worldoftanks.ru/wgn',
        } );
# without data (invalid request)
$wg->clans_list( { limit => '1' } );
ok( ! $wg->response,                   'get response datas' );

    $wg = WG::API::Clans->new( { 
            application_id  => 'demo',
            lang            => 'ru',
            api_uri         => 'api.worldoftanks.ru/wgn',
        } );
# with data (valid request)
$wg->clans_list( { limit => '1' } );
ok( $wg->response,                   'get response data' );
ok( $wg->meta,                          'get response meta' );
ok( scalar @{ $wg->response } == $wg->meta->{ 'count' },     'response count ok' );

my $response = WG::API::Data->new;
ok( $response->new,                 'create data-object from ref' );

done_testing();
