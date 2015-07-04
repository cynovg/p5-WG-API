#!/udr/bin/env perl
#
#

use v5.014;
use strict;
use warnings;
use WG::API::Clans;
use Data::Dumper;

use Test::More;

my $wgc = WG::API::Clans->new( { application_id => 'demo' } );
can_ok( 'WG::API::Clans', qw/clans_list clans_info clans_membersinfo clans_glossary/);

ok( ! $wgc->clans_list( page_no => 1, limit   => 4, ),                                  'get clans list with params' );
ok( $wgc->clans_list(),                                                                 'get clans list');
ok( $wgc->clans_list( { page_no => 1, limit => 4, } ),                                  'get clans list with params' );

my $list =  $wgc->clans_list();
my $clan_id = $list->[ 0 ]->{ 'clan_id' };
ok( ! $wgc->clans_info(),                                                               'get clan info');
ok( $wgc->clans_info( { clan_id => $clan_id } ),                                        'get clan info');
ok( ! $wgc->clans_info( cid => $clan_id ),                                              'get clan info without ref to params');
ok( ! $wgc->clans_info( { cid => $clan_id } ),                                          'get clan info without valid params');
ok( ! $wgc->clans_info( { clan_id => 'abc', } ),                                        'get clan info');


my $info = $wgc->clans_info( { clan_id => $clan_id } );
my $members = $info->[0]->{ $clan_id }->{ 'members' };
ok( $wgc->clans_membersinfo( { account_id => $members->[ 0 ]->{ 'account_id' }, } ),    'get clans members info');
ok( ! $wgc->clans_membersinfo(),                                                        'get clans members info');
ok( ! $wgc->clans_membersinfo( account_id => $members->[ 0 ]->{ 'account_id' },),       'get clans members info');
ok( ! $wgc->clans_membersinfo( { cid => $members->[ 0 ]->{ 'account_id' }, } ),         'get clans members info');
ok( ! $wgc->clans_membersinfo( { account_id => 'abc', } ),                              'get clans members info');

ok( $wgc->clans_glossary(),                                                             'get clans glossary');
ok( ! $wgc->clans_glossary( fields => 'test' ),                                         'get clans glossary');
ok( $wgc->clans_glossary( { fds => 'test' } ),                                          'get clans glossary');
ok( ! $wgc->clans_glossary( { fields => 'clns_rles' }),                                 'get clans glossary');
ok( $wgc->clans_glossary( { fields => 'clans_roles' }),                                 'get clans glossary');

done_testing();
