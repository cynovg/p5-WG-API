package WG::API::Accounts;

use strict;
use v5.020;
use base 'WG::API';

=head1 NANE

WG::API::Accounts - This 

=head1 VERSION

Version v0.05

=cut

our $VERSION = 'v0.05';

=head1 SYNOPSIS

    use WG::API::Accounts;

    my $foo = WG::API::Accounts->new( application_id => 'demo' );
    my $info = $foo->account_info( 1 );
    ...


=head1 METHODS

=head2 accounts_list( [ %params ] )

Method returns partial list of players. The list is filtered by initial characters of user name and sorted alphabetically.

=over

=item Params

  language - Localization language.
  fields - Response field. The fields are separated with commas. Embedded fields are separated with dots. To exclude a field, use “-” in front of its name. In case the parameter is no defined, the method returns all fields.
  game - Name of the game to search player for. If the parameter is not specified, search will be executed across known games.
  type - Search type. Default is startswith. Valid values:

    "startswith" — Search by initial part of player name (case insensitive). Minimum length: 3 characters. Maximum length: 24 characters. (by default)
    "exact" — Search by exact match of player name (case insensitive). Indication of list of names, separated by commas is allowed (up to 100 values)

  search - Search bar by player name. Search type and minimum string length depend on "type" parameter. If "exact" search type is used, indication of list of names, separated by commas is allowed.
  limit - Number of returned entries (fewer can be returned, but not more than 100). If the limit sent exceeds 100, an limit of None is applied (by default).

=item Return

 account_id - Player ID.
 created_by - Date when player's account was created.
 games - List of games player has played
 nickname - Player name

=back

=cut 

sub accounts_list {
    my $self = shift;

    $self->_request( 'get', 'account/list', ['fields', 'game', 'type', 'search', 'limit'], undef, @_ );
    
    return $self->status eq 'ok' ? $self->response : undef;
}

=head2 account_info( account_id )

Method returns Wargaming account details.

=over 

=item Params

  language - Localization language. 
  fields - Response field. The fields are separated with commas. Embedded fields are separated with dots. To exclude a field, use “-” in front of its name. In case the parameter is no defined, the method returns all fields.
  access_token - Access token is used to access personal user data. The token is obtained via authentication and has expiration time.
  account_id* - Player ID.

=item Return

  account_id - Player ID.
  creates_by - Date when player's account was created.
  games - List of games player has played.
  nickname - Player name.

PRIVATE (Player's private data):

  private.free_xp - Amount of Free Experience.
  private.gold - Current gold balance.
  private.premium_expires_at - Premium Account expiration date.

=back

=cut

sub account_info {
    my ( $self, %params ) = @_;

    $self->_request( 'get', 'account/info', ['fields', 'access_token', 'account_id'], ['account_id'], %params );
    
    return $self->status eq 'ok' &&  $self->response->{ $params{ 'account_id' } } ? WG::API::Data->new( $self->response->{ $params{ 'account_id' } } ) : undef;
}

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

  WG API Reference 

L<http://ru.wargaming.net/developers/>

  WG API Reference, List of accounts  

L<https://ru.wargaming.net/developers/api_reference/wgn/account/list/>

  WG API Reference, Account Information 

L<https://ru.wargaming.net/developers/api_reference/wgn/account/info/>

=head1 AUTHOR

cynovg , C<< <cynovg at cpan.org> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2015 Cyrill Novgorodcev.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

st of accountsL<http://www.perlfoundation.org/artistic_license_2_0>

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

1; # End of WG::API::Accounts 
