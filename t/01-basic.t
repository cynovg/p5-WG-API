#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use lib( './lib');
use WG::API;
use Data::Dumper;

use Test::More;

my $app_id = 'demo';

ok( ! WG::API->new( ),                              'create object without app_id' );
ok( ! WG::API->new( $app_id ),                      'create object with invalid app_id' );
ok( ! WG::API->new( application_id => $app_id ),    'create object with invalid app_id' );

my $wg = WG::API->new( { application_id => $app_id } );
ok( $wg,                                            'create object with valid app_id' );
ok( ! $wg->login(),                                 'login without redirect_uri' );
ok( ! $wg->login( { 'test', 'test' } ),                 'login with invalid params' );
ok( $wg->login( 'api.worldoftanks.ru/wot/blank/' ), 'login with redirect_uri' );
ok( $wg->login( { redirect_uri => 'api.worldoftanks.ru/wot/blank/',
                    expires_at => '1',
                } ),                                'login with valid params' );
ok( $wg->login( { redirect_uri => 'api.worldoftanks.ru/wot/blank/',
                } ),                                'login with redirect_uri and withour expires' );
ok( $wg->status eq 'ok',                            'check status' );
ok( $wg->response,                                  'check response' );
ok( ! $wg->error,                                   'check error' );
ok( ! $wg->login( 'blank' ),                        'login with invalid redirect_uri' );
ok( $wg->error,                                     'check error' );
my $wgn = $wg->new( { 
            application_id  => 'demo1',
            lang            => 'ru',
            api_uri         => 'api.worldoftanks.ru/wgn',
            debug           => '1',
        } );
ok( $wgn,                                           'create class with all params from ref' );
ok( $wgn->clans_list,                               'get clans list without access_token' );
ok( ! $wgn->response,                               'get response' );
ok( $wgn->status eq 'error',                        'status eq error' );
ok( $wgn->error,                                    'get error object' );

done_testing();
