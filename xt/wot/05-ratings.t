#!/usr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use Test::More;

BEGIN: { use_ok( 'WG::API::WoT::Ratings' ) };

can_ok( 'WG::API::WoT::Ratings', qw/ratings_types ratings_dates ratings_accounts ratings_neighbors ratings_top/ );

my $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( ! $wot->ratings_types( battle_type => 'default' ), 'get ratings types' );
ok( ! $wot->status, 'get ratings types' );
   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( ! $wot->ratings_types( { battle_type => 'test' } ), 'get ratings types' );
ok( $wot->status eq 'error', 'get ratings types' );
   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( $wot->ratings_types(), 'get ratings types' );
ok( $wot->status eq 'ok', 'get ratings types' );
   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( $wot->ratings_types( { battle_type => 'default' } ), 'get ratings types' );
ok( $wot->status eq 'ok', 'get ratings types' );

   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( ! $wot->ratings_dates(), 'get ratings dates' );
ok( ! $wot->status, 'get rating dates' );
ok( ! $wot->ratings_dates( type => '1' ), 'get ratings dates' );
ok( ! $wot->ratings_dates( { acc_id => '1' } ), 'get ratings dates' );
ok( ! $wot->ratings_dates( { type => 'test' } ), 'get ratings dates' );
ok( $wot->status eq 'error', 'get ratings dates' );
ok( $wot->ratings_dates( { type => '1' } ), 'get ratings dates' );
ok( $wot->status eq 'ok', 'get ratings dates' );

   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( ! $wot->ratings_accounts(), 'get ratings accounts' );
ok( ! $wot->status, 'get ratings accounts' );
ok( ! $wot->ratings_accounts( account_id => '1', type => '1' ), 'get ratings accounts' );
ok( ! $wot->ratings_accounts( { acc_id => '1', type => '1' } ), 'get ratings accounts' );
ok( ! $wot->ratings_accounts( { account_id => '1', acc_id => '1' } ), 'get ratings accounts' );
ok( ! $wot->ratings_accounts( { account_id => '1' } ), 'get ratings accounts' );
ok( ! $wot->ratings_accounts( { type => '1' } ), 'get ratings accounts' );
ok( ! $wot->ratings_accounts( { account_id => 'test', type => '1' } ), 'get ratings accounts' );
ok( ! $wot->ratings_accounts( { account_id => '1', type => 'test' } ), 'get ratings accounts' );
   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( $wot->ratings_accounts( { account_id => '1', type => '1' } ), 'get ratings accounts' );
ok( $wot->status eq 'ok', 'get ratings accounts' );

   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( ! $wot->ratings_top(), 'get ratings neighbors' );
ok( ! $wot->ratings_top( type => 1 ), 'get ratings neighbors' );
ok( ! $wot->ratings_top( { acc_id => '1' } ), 'get ratings neighbors' );
ok( ! $wot->ratings_top( { type => 'test', rank_field => 'xp_amount' } ), 'get ratings neighbors' );
ok( ! $wot->ratings_top( { type => '1', rank_field => 'test' } ), 'get ratings neighbors' );
ok( ! $wot->ratings_top( { type_t => '1', rank_field => 'xp_amount' } ), 'get ratings neighbors' );
ok( ! $wot->ratings_top( { type => '1', rnk_field => 'xp_amount' } ), 'get ratings neighbors' );
ok( ! $wot->status, 'get ratings top' );
   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( $wot->ratings_top( { type => '1', rank_field => 'xp_amount' } ), 'get ratings neighbors' );
ok( $wot->status eq 'ok', 'get ratings top');

   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( ! $wot->ratings_neighbors(), 'get ratings neighbors' );
ok( ! $wot->ratings_neighbors( account_id => '1', type => '1', rank_field => 'xp_amount' ), 'get ratings neighbors' );
ok( ! $wot->ratings_neighbors( { account_id => '1', type => '1' } ), 'get ratings neighbors' );
ok( ! $wot->ratings_neighbors( { type => '1', rank_field => 'xp_amount' } ), 'get ratings neighbors' );
   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( ! $wot->ratings_neighbors( { account_id => '1', rank_field => 'xp_amount' } ), 'get ratings neighbors' );
   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( ! $wot->ratings_neighbors( { account_id => 'test', type => 'test', rank_field => 'test' } ), 'get ratings neighbors' );
ok( $wot->status eq 'error', 'get ratings neighborns' );
   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( ! $wot->ratings_neighbors( { account_id => '1', type => 'test', rank_field => 'test' } ), 'get ratings neighbors' );
ok( $wot->status eq 'error', 'get ratings neighborns' );
   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( ! $wot->ratings_neighbors( { account_id => 'test', type => '1', rank_field => 'test' } ), 'get ratings neighbors' );
ok( $wot->status eq 'error', 'get ratings neighborns' );
   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( ! $wot->ratings_neighbors( { account_id => '1', type => '1', rank_field => 'test' } ), 'get ratings neighbors' );
ok( $wot->status eq 'error', 'get ratings neighborns' );
   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( ! $wot->ratings_neighbors( { account_id => 'test', type => 'test', rank_field => 'xp_amount' } ), 'get ratings neighbors' );
ok( $wot->status eq 'error', 'get ratings neighborns' );
   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( ! $wot->ratings_neighbors( { account_id => '1', type => 'test', rank_field => 'xp_amount' } ), 'get ratings neighbors' );
ok( $wot->status eq 'error', 'get ratings neighborns' );
   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
ok( ! $wot->ratings_neighbors( { account_id => 'test', type => '1', rank_field => 'xp_amount' } ), 'get ratings neighbors' );
ok( $wot->status eq 'error', 'get ratings neighborns' );
   $wot = WG::API::WoT::Ratings->new( { application_id => 'demo' } );
$wot->ratings_neighbors( { account_id => '1', type => '1', rank_field => 'xp_amount' } );
my $response = $wot->status eq 'error' ? $wot->error->code eq '404' ? '1' : '0' : '1';
ok( $response, 'get ratings neighborns' );

done_testing();
