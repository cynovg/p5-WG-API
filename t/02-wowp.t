#!/usr/bin/env perl
use 5.014;
use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok( 'WG::API::WoWp' )               || say "WG::API::WoWp loaded";
    use_ok( 'WG::API::WoWp::Accounts' )     || say "WG::API::WoWp::Accounts loaded";
    use_ok( 'WG::API::WoWp::Ratings' )      || say "WG::API::WoWp::Ratings loaded";
}

my $wowp = WG::API::WoWp->new( application_id =>'demo' );
ok( $wowp && ref $wowp, 'create class' );

#can_ok( $wowp, qw// );
#can_ok( $wowp, qw// );
#can_ok( $wowp, qw// );
#
#SKIP: {
#    skip 'developers only', 5  unless $ENV{ 'WGMODE' } && $ENV{ 'WGMODE' } eq 'dev';
#    ok( $wowp->test, '' );
#    ok( $wowp->test, '' );
#    ok( $wowp->test, '' );
#    ok( $wowp->test, '' );
#    ok( $wowp->test, '' );
#    ok( $wowp->test, '' );
#};

done_testing();
