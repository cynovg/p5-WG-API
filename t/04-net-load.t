#!/usr/bin/ent perl
#

use v5.014;
use strict;
use warnings;

use Test::More;

BEGIN: {
    use_ok( 'WG::API::NET'              || say "WG::API::NET loaded" );
    use_ok( 'WG::API::NET::Clans'       || say "WG::API::NET::Clans loaded" );
    use_ok( 'WG::API::NET::Accounts'    || say "WG::API::NET::Accounts loaded" );
    use_ok( 'WG::API::NET::Servers'     || say "WG::API::NET::Servers loaded" );
}
diag( "WG::API::NET             $WG::API::NET::VERSION, Perl $], $^X" );
diag( "WG::API::NET::Clans      $WG::API::NET::Clans::VERSION, Perl $], $^X" );
diag( "WG::API::NET::Accounts   $WG::API::NET::Accounts::VERSION, Perl $], $^X" );
diag( "WG::API::NET::Servers    $WG::API::NET::Servers::VERSION, Perl $], $^X" );

done_testing();
