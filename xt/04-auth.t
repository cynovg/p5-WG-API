#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use lib( './lib');
use WG::API::Auth;

use Test::More;

my $wg = WG::API::Auth->new( { application_id => 'demo' } );
ok( ! $wg->login( ),                                   'login without redirect_uri (default back_uri, nofollow 0)' );
ok( ! $wg->login( { 'test', 'test' } ),               'login with invalid params (invalid hash ignored)' );
ok( ! $wg->login( 'api.worldoftanks.ru/wot/blank/' ),   'login with invalid params (scalar)' );
ok( $wg->login( { 
            redirect_uri => 'api.worldoftanks.ru/wot/blank/',
            expires_at => '100',
            nofollow        => 1,
         } ),                                       'login with valid params' );
ok( ! $wg->prolongate(),                            'prolongate tocken without logged user' );
ok( ! $wg->prolongate( '100' ),                     'prolongate tocken without logged user and invalid params' );
ok( ! $wg->prolongate( {
            expires_at => '100',
        } ),                                        'prolongate tocken without logged user and valid params' );
ok( ! $wg->logout(),                                'logout without logged user' );

done_testing();
