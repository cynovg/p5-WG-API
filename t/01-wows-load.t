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

diag( "WG::API::WoWs                 $WG::API::WoWs::VERSION,                 Perl $], $^X" );
diag( "WG::API::WoWs::Accounts       $WG::API::WoWs::Accounts::VERSION,                 Perl $], $^X" );
diag( "WG::API::WoWs::Warships       $WG::API::WoWs::Warships::VERSION,                 Perl $], $^X" );

done_testing();
