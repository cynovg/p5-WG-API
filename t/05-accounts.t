#!/usr/bin/ent perl
#

use strict;
use warnings;
use lib( 'lib' );
use Test::More;
use WG::API::Accounts;
use Data::Dumper;

my $wg = WG::API::Accounts->new( application_id => 'demo' );
ok ( $wg && ref $wg eq 'WG::API::Accounts', 'create object' );

my $result;

SKIP: {
    skip 'developers only', 2 unless $ENV{ 'WGMODE' } && $ENV{ 'WGMODE' } eq 'dev';

    $result = $wg->account_info( account_id => 1 );
    ok ( ! $result, 'get deleted account info' );

    $result = $wg->account_info( account_id => 244468 );
    ok ( $result && ref $result eq 'WG::API::Data', 'get account info' );
}

done_testing();
