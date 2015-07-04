#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use WG::API::Servers;

use Test::More;

my $wgc = WG::API::Servers->new( { application_id => 'demo' } );
can_ok( 'WG::API::Servers', qw/servers_info/);

ok( $wgc->servers_info,                                         '');
ok( $wgc->servers_info( { game => 'wowp' } ),                   '');
ok( ! $wgc->servers_info( { game => 'wowa' } ),                 '');

done_testing();
