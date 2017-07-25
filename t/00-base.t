#!/usr/bin/env perl

use Modern::Perl '2015';
use lib ('lib');

use Test::More;

BEGIN {
    use_ok('WG::API') || say "WG::API loaded";
    use_ok('WG::API::Auth')  || say "WG::API::Auth loaded";
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

my $is_debug = $ENV{'WGMODE'} && $ENV{'WGMODE'} eq 'dev' ? 1 : 0;
my WG::API::Auth $auth = $wg->auth(debug=> $is_debug);

ok($auth->login( nofollow => 1, redirect_uri => 'http://localhost/response' ) || $auth->error->message eq 'REQUEST_LIMIT_EXCEEDED', 'Get redirect uri');
is($auth->prolongate( access_token => 'xxx' ), undef, 'Prolongate with invalid access token');
like($auth->error->message, qr/INVALID_ACCESS_TOKEN|REQUEST_LIMIT_EXCEEDED/, 'Vaidate error message');

ok($auth->logout(access_token => 'xxx' || $auth->error->message eq 'REQUEST_LIMIT_EXCEEDED'), 'Logout with invalid access token');

done_testing();
