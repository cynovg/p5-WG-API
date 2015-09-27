#!/usr/bin/ent perl
#

use strict;
use warnings;
use lib ( 'lib' );
use Test::More;
use WG::API::Servers;

my $wg = WG::API::Servers->new( application_id => 'demo' );
ok ( $wg && ref $wg eq 'WG::API::Servers', 'create object' );

my $result;

SKIP: {
    skip 'developers only', 3 unless $ENV{ 'WGMODE' } eq 'dev';

    $result = $wg->servers_info();
    ok ( $result && ref $result eq 'WG::API::Data', 'return all servers info' );

    $result = $wg->servers_info( game => 'wot' );
    ok ( $result && ref $result eq 'WG::API::Data', 'return wot servers info' );

    $result = $wg->servers_info( game => 'wowf' );
    ok ( ! $result && $wg->error, 'return info abount non-existent game' );
};

done_testing();
