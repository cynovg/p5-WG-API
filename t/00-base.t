#!/usr/bin/env perl

use Modern::Perl '2015';
use lib ('lib');

use Test::More;

BEGIN {
    use_ok('WG::API') || say "WG::API loaded";
}

my WG::API $wg;
eval {
    $wg = WG::API->new(application_id => $ENV{'WG_KEY'} || 'demo');
};
ok( $wg && ! $@, 'create general object');

isa_ok($wg->net, 'WG::API::NET');
isa_ok($wg->wot, 'WG::API::WoT');
isa_ok($wg->wowp, 'WG::API::WoWp');
isa_ok($wg->wows, 'WG::API::WoWs');
isa_ok($wg->auth, 'WG::API::Auth');

isa_ok($wg->net->ua, 'LWP::UserAgent');

done_testing();
