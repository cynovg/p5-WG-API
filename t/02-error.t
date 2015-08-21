#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use lib( './lib');
use WG::API::Clans;
use Data::Dumper;

use Test::More;

my $wg = WG::API::Clans->new( { 
            application_id  => 'demo1',
            lang            => 'ru',
            api_uri         => 'api.worldoftanks.ru/wgn',
        } );
ok( $wg,                                            'create class with all params from ref' );
ok( ! $wg->clans_list,                                'get clans list without valid application_id' );
ok( $wg->status eq 'error',                         'status eq error' );
ok( $wg->error,                                     'get error object' );

ok( $wg->error->code,                               'get error code' );
ok( $wg->error->message,                            'get error message' );
ok( $wg->error->field,                              'get error field' );
ok( $wg->error->value,                              'get value for error field' );

    $wg = WG::API::Clans->new( { 
            application_id  => 'demo',
            lang            => 'ru',
            api_uri         => 'api.worldoftanks.ru/wgn',
        } );
ok( $wg,                                            'create class with all params from ref' );
ok( $wg->clans_list( { limit => '1' } ),            'get clans list without access_token' );
ok( $wg->status eq 'ok',                            'status eq ok' );
ok( $wg->error,                                     'get error object' );

ok( ! $wg->error->code,                             'get error code' );
ok( ! $wg->error->message,                          'get error message' );
ok( ! $wg->error->field,                            'get error field' );
ok( ! $wg->error->value,                            'get value for error field' );

my $error = $wg->error;
ok( $error->new,                                'create error object from ref' );

done_testing();
