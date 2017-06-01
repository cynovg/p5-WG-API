package WG::API::NET;

use Moo;
with 'WG::API::NET::Clans';
with 'WG::API::NET::Accounts';
with 'WG::API::NET::Servers';

=head1 NAME

WG::API::NET - Modules to work with Wargaming.net Public API

=head1 VERSION

Version v0.8.3

=cut

our $VERSION = 'v0.8.3';

=head1 SYNOPSIS

Wargaming.net Public API is a set of API methods that provide access to Wargaming.net content, including in-game and game-related content, as well as player statistics.

This module provide access to WG Public API

    use WG::API;

    my $net = WG::API->new( application_id => 'demo' )->net;
    ...
    my $player = $net->account_info( account_id => '1' );



=head1 CONSTRUCTOR

=head2 new

Create new object with params. Rerquired application id: L<https://developers.wargaming.net/documentation/guide/getting-started/> 

Params:

 - application_id *
 - languare

=head1 METHODS

=head2 Accounts

=over 1

=item B<accounts_list>

Method returns partial list of players. The list is filtered by initial characters of user name and sorted alphabetically.

=over 2

=item I<required fields:>

    search - Player name search string. Parameter "type" defines minimum length and type of search. Using the exact search type, you can enter several names, separated with commas. Maximum length: 24.

=back

=item B<account_info>

Method returns Wargaming account details.

=over 2

=item I<required fields:>

    account_id - Account ID. Max limit is 100. Min value is 1.

=back

=back

=head2 Clans

=over 1

=item B<clans_list>

Method searches through clans and sorts them in a specified order.

=item B<clans_info>

Method returns detailed clan information.

=over 2

=item I<required fields:>

    clan_id - Clan ID. Max limit is 100.

=back

=item B<clans_membersinfo>

Method returns clan member info and short info on the clan. Information is available for World of Tanks and World of Warplanes clans.

=over 2

=item I<required fields:>

    account_id - Account ID. Max limit is 100. Min value is 1.

=back

=item B<clans_glossary>

Method returns information on clan entities in World of Tanks and World of Warplanes.

=item B<clans_messageboard>

Method returns messages of clan message board.

=over 2

=item I<required fields:>

    access_token - Access token for the private data of a user's account; can be received via the authorization method; valid within a stated time period

=back

=back

=head2 Servers

=over 1

=item B<servers_info>

Method returns the number of online players on the servers.

=back

=cut

has api_uri => (
    is  => 'ro',
    default => sub{ 'api.worldoftanks.ru/wgn' },
);

with 'WG::API::Base';

=head1 BUGS

Please report any bugs or feature requests to C<cynovg at cpan.org>, or through the web interface at L<https://github.com/cynovg/WG-API/issues>.  I will be notified, and then you'll automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WG::API

You can also look for information at:

=over 4

=item * RT: GitHub's request tracker (report bugs here)

L<https://github.com/cynovg/WG-API/issues>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WG-API>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WG-API>

=item * Search CPAN

L<http://search.cpan.org/dist/WG-API/>

=back


=head1 ACKNOWLEDGEMENTS

...

=head1 SEE ALSO

WG API Reference L<https://developers.wargaming.net/>

=head1 AUTHOR

cynovg , C<< <cynovg at cpan.org> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2015 Cyrill Novgorodcev.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of WG::API::NET

