#!/usr/bin/env perl
#
#

use 5.014;
use warnings;
use Test::More;

BEGIN {
    use_ok( 'WG::API::WoWs' || say 'WG::API::WoWs loaded' );
    use_ok( 'WG::API::WoWs::Accounts' || say 'WG::API::WoWs::Accounts loaded' );
    use_ok( 'WG::API::WoWs::Warships' || say 'WG::API::WoWs::Warships loaded' );
}

my $wows = WG::API::WoWs->new( application_id => 'demo' );
ok( $wows && ref $wows, 'create class' );

#can_ok( $wows, qw// );
#can_ok( $wows, qw// );
#can_ok( $wows, qw// );
#
#SKIP: {
#    skip 'developers only', 5 unless $ENV{ 'WGMODE' } && $ENV{ 'WGMODE' } eq 'dev';
#    ok( $wows->test, '' );
#    ok( $wows->test, '' );
#    ok( $wows->test, '' );
#    ok( $wows->test, '' );
#    ok( $wows->test, '' );
#}

done_testing();
