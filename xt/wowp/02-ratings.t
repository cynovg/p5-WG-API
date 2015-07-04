#!/usr/bin/env perl
#

use v5.014;
use strict;
use warnings;
use WG::API::WoWp::Ratings;
use WG::API::WoWp::Accounts;
use Data::Dumper;

use Test::More;

can_ok( 'WG::API::WoWp::Ratings', qw/ratings_types ratings_accounts ratings_neighbors ratings_top ratings_dates/);

my $wowp = WG::API::WoWp::Ratings->new( { application_id => 'demo' } );
ok( $wowp,                      'rating-class created' );

ok( ! $wowp->ratings_types( cid => 1 ), 'get ratings types with scalar param' );
ok( $wowp->ratings_types(), 'get ratings types without param' );

$wowp = WG::API::WoWp::Ratings->new( { application_id => 'demo' } );
ok( $wowp->ratings_types( { field => 'type' } ), 'get ratings types with param' );

my $account = WG::API::WoWp::Accounts->new( { application_id => 'demo' } );
$account = $account->account_list( { search => 'test' } )->[ 0 ];
$wowp = WG::API::WoWp::Ratings->new( { application_id => 'demo' } );

ok( ! $wowp->ratings_accounts(), 'get ratings accounts without params' );
ok( ! $wowp->ratings_accounts( cid => 1 ), 'get ratings accounts with scalar params' );
ok( ! $wowp->ratings_accounts( { cid => 1 } ), 'get ratings accounts with invalid params' );
ok( ! $wowp->ratings_accounts( { account_id => 'test' } ), 'get ratings accounts with invalid account_id' );
ok( ! $wowp->ratings_accounts( { account_id => $account->{ 'account_id' } } ), 'get ratings accounts walid account_id' );
ok( ! $wowp->ratings_accounts( { type => 'xxx' } ), 'get ratings accounts with invalid type' );
ok( ! $wowp->ratings_accounts( { type => 'all' } ), 'get ratings accounts with valid type' );
ok( ! $wowp->ratings_accounts( { type => 'all', account_id => 'test' } ), 'get ratings accounts with valid type and invalid account_id' );
ok( $wowp->ratings_accounts( { type => 'all', account_id => $account->{ 'account_id' } } ), 'get ratings accounts with valid type and account_id' );

$wowp = WG::API::WoWp::Ratings->new( { application_id => 'demo' } );
ok( ! $wowp->ratings_neighbors(), 'get ratinds nieghbors' );
ok( ! $wowp->ratings_neighbors( cid => 1 ), 'get ratinds nieghbors' );
ok( ! $wowp->ratings_neighbors( { cid => 1 } ), 'get ratinds nieghbors' );
ok( ! $wowp->ratings_neighbors( { account_id => $account->{ 'account_id' } } ), 'get ratinds nieghbors without valid params' );
ok( ! $wowp->ratings_neighbors( { type => 'all' } ), 'get ratinds nieghbors with validout params' );
ok( ! $wowp->ratings_neighbors( { rank_field => 'wins_ratio' } ), 'get ratinds nieghbors without valid params' );
ok( ! $wowp->ratings_neighbors( { account_id => $account->{ 'account_id' }, rank_field => 'wins_ratio' } ), 'get ratinds nieghbors without valid params' );
ok( ! $wowp->ratings_neighbors( { account_id => $account->{ 'account_id' }, type => 'all' } ), 'get ratinds nieghbors without valid params' );
ok( ! $wowp->ratings_neighbors( { type => 'all', rank_field => 'wins_ratio' } ), 'get ratinds nieghbors with validout params' );
ok( ! $wowp->ratings_neighbors( { account_id => $account->{ 'account_id' }, type => 'test', rank_field => 'wins_ratio' } ), 'get ratinds nieghbors with invalid params' );
ok( ! $wowp->ratings_neighbors( { account_id => $account->{ 'account_id' }, type => 'all', rank_field => 'test' } ), 'get ratinds nieghbors with invalid params' );
ok( ! $wowp->ratings_neighbors( { account_id => 'test', type => 'all', rank_field => 'wins_ratio' } ), 'get ratinds nieghbors with invalid params' );
ok( $wowp->ratings_neighbors( { account_id => $account->{ 'account_id' }, type => 'all', rank_field => 'wins_ratio' } ), 'get ratinds nieghbors with valid params' );

$wowp = WG::API::WoWp::Ratings->new( { application_id => 'demo' } );
ok( ! $wowp->ratings_top(), 'get ratings top without param' );
ok( ! $wowp->ratings_top( cid => 1 ), 'get ratings top with scalar param' );
ok( ! $wowp->ratings_top( { cid => 1 } ), 'get ratings top with invalid param' );
ok( ! $wowp->ratings_top( { rank_field => 'test' } ), 'get ratings top with invalid rank_field' );
ok( ! $wowp->ratings_top( { rank_field => 'wins_ratio' } ), 'get ratings top witn valid rank_field' );
ok( ! $wowp->ratings_top( { type => 'test' }  ), 'get ratings top with invalit type' );
ok( ! $wowp->ratings_top( { type => 'all' } ), 'get ratings top with valid type' );
ok( ! $wowp->ratings_top( { type => 'all', rank_field => 'test' } ), 'get ratings top with valid type and invalid rank_field' );
ok( $wowp->ratings_top( { type => 'all', rank_field => 'wins_ratio' } ), 'get ratings top with valid params' );

$wowp = WG::API::WoWp::Ratings->new( { application_id => 'demo' } );
ok( ! $wowp->ratings_dates(), 'get ratings dates without params' );
ok( ! $wowp->ratings_dates( cid => 1 ), 'get ratings dates with scalar param' );
ok( ! $wowp->ratings_dates( { cid => 1 } ), 'get ratings dates with invalid param' );
ok( ! $wowp->ratings_dates( { type => 'test' } ), 'get ratings dates with invalid type' );
ok( $wowp->ratings_dates( { type => 'all' } ), 'get ratings dates with valid type' );

done_testing();
