package WG::API::NET;

use 5.014;
use strict;
use warnings;
use base qw(WG::API 
    WG::API::NET::Clans
    WG::API::NET::Accounts
    WG::API::NET::Servers
);

=head1 NAME

WG::API::NET - Modules to work with Wargaming.net Public API

=head1 VERSION

Version v0.05

=cut

our $VERSION = 'v0.05';

=head1 SYNOPSIS

Wargaming.net Public API is a set of API methods that provide access to Wargaming.net content, including in-game and game-related content, as well as player statistics.

This module provide access to WG Public API

    use WG::API::WoT::NET;

    my $wot = WG::API::NET->new( application_id => 'demo' );
    ...
    my $player = $wot->account_info( account_id => '1' );



=head1 CONSTRUCTOR

=head2 new

Create new object with params. Rerquired application id: http://ru.wargaming.net/developers/documentation/guide/getting-started/

Params:

 - application_id *
 - languare
 - api_uri

=head1 METHODS

=head2 Accounts

=head3 B<accounts_list( [ %params ] )>

Method returns partial list of players. The list is filtered by initial characters of user name and sorted alphabetically.

=over 1

=item I<Params>

  language - Localization language.
  fields - Response field. The fields are separated with commas. Embedded fields are separated with dots. To exclude a field, use "-" in front of its name. In case the parameter is no defined, the method returns all fields.
  game - Name of the game to search player for. If the parameter is not specified, search will be executed across known games.
  type - Search type. Default is startswith. Valid values:

    "startswith" - Search by initial part of player name (case insensitive). Minimum length: 3 characters. Maximum length: 24 characters. (by default)
    "exact" - Search by exact match of player name (case insensitive). Indication of list of names, separated by commas is allowed (up to 100 values)

  search - Search bar by player name. Search type and minimum string length depend on "type" parameter. If "exact" search type is used, indication of list of names, separated by commas is allowed.
  limit - Number of returned entries (fewer can be returned, but not more than 100). If the limit sent exceeds 100, an limit of None is applied (by default).

=item I<Return>

 account_id - Player ID.
 created_by - Date when player's account was created.
 games - List of games player has played
 nickname - Player name

=back

=head3 B<account_info( [ %account_id ] )>

Method returns Wargaming account details.

=over 1

=item I<Params>

  language - Localization language. 
  fields - Response field. The fields are separated with commas. Embedded fields are separated with dots. To exclude a field, use "-" in front of its name. In case the parameter is no defined, the method returns all fields.
  access_token - Access token is used to access personal user data. The token is obtained via authentication and has expiration time.
  account_id* - Player ID.

=item I<Return>

  account_id - Player ID.
  creates_by - Date when player's account was created.
  games - List of games player has played.
  nickname - Player name.

PRIVATE (Player's private data):

  private.free_xp - Amount of Free Experience.
  private.gold - Current gold balance.
  private.premium_expires_at - Premium Account expiration date.

=back

=head2 Clans

=head3 B<clans_list( [ %params ] )>

Method searches through clans and sorts them in a specified order.

=over 1

=item I<Params>

  language - Localization language. 
  fields - Response field. The fields are separated with commas. Embedded fields are separated with dots. To exclude a field, use "-" in front of its name. In case the parameter is no defined, the method returns all fields.
  search - Part of name or tag by which clan is searched for. Minimum 2 characters.
  order_by - Sorting. Valid values:

    "id" - by clan id
    "-id" - by clan id in reverse order
    "name" - by clan name
    "-name" - by clan name in reverse order
    "members_count" - by clan’s size
    "-members_count" - by clan’s size in reverse order
    "tag" - by clan tag
    "-tag" - by clan tag in reverse order
    "created_at" - by clan’s creation date
    "-created_at" - by clan’s creation date in reverse order

  limit - Number of returned entries (fewer can be returned, but not more than 100). If the limit sent exceeds 100, an limit of 100 is applied (by default).
  page_no - Page number.

=item I<Return>

  clan_id - Clan ID.
  color - Clan color in HEX #RRGGBB.
  created_at - Clan createon time.
  members_count - Number of clans members.
  name - Clan name.
  tag - Clan Tag.

Emblems (Information on clan emblems in games and on clan portal):

  emblems.x24 - List of links to 24x24 px emblems
  emblems.x32 - List of links to 32x32 px emblems
  emblems.x64 - List of links to 64x64 px emblems
  emblems.x195 - List of links to 195x195 px emblems
  emblems.x256 - List of links to 256x256 px emblems

=back

=head3 B<clans_info( [ %params ] )>

Method returns detailed clan information.

=over 1

=item I<Params>

  language - Localization language. 
  fields - Response field. The fields are separated with commas. Embedded fields are separated with dots. To exclude a field, use "-" in front of its name. In case the parameter is no defined, the method returns all fields.
  access_token - Access token is used to access personal user data. The token is obtained via authentication and has expiration time.
  clan_id* - Clan ID
  members_key - This parameter changes members field type. Valid values:

      "id" - Members field will contain associative array with account_id indexing in response

=item I<Return>

  accepts_join_requests - Clan can invite players
  clan_id - Clan ID
  color - Clan color in HEX #RRGGBB
  created_at - Clan creation date
  creator_id - Clan creator ID
  creator_name - Clan creator's name
  description - Clan description
  description_html - Clan description in HTML
  is_clan_disbanded - Clan has been deleted. The deleted clan data contains valid values for the following fields only: clan_id, is_clan_disbanded, updated_at.
  leader_id - Clan Commander ID
  leader_name - Commander's name
  members_count - Number of clan members
  motto - Clan motto
  name - Clan name
  old_name - Old clan name
  old_tag - Old clan tag
  renamed_at - Time (UTC) when clan name was changed
  tag - Clan Tag
  updated_at - Time when clan details were updated

Emblems (Information on clan emblems in games and on clan portal):

  emblems.x24 - List of links to 24x24 px emblems
  emblems.x32 - List of links to 32x32 px emblems
  emblems.x64 - List of links to 64x64 px emblems
  emblems.x195 - List of links to 195x195 px emblems
  emblems.x256 - List of links to 256x256 px emblems

Members (Information on clan members. Field format depends on members_key input parameter):

  members.account_id - Player account ID
  members.account_name - Player name
  members.joined_at - Date when player joined clan
  members.role - Technical position name
  members.role_i18n - Localized position

Private (Restricted clan information):

  private.treasury - Gold in clan treasury

=back

=head3 B<clans_membersinfo( [ %params ] )>

Method returns clan member info and short info on the clan.

=over 1

=item I<Params>

  language - Localization language. 
  fields - Response field. The fields are separated with commas. Embedded fields are separated with dots. To exclude a field, use "-" in front of its name. In case the parameter is no defined, the method returns all fields.
  account_id* - Player ID.

=item I<Return>

  account_id - Player account ID
  account_name - Player name
  joined_at - Date when player joined clan
  role - Technical position name
  role_i18n - Localized position

Clan (Short clan info):

  clan.clan_id - Clan ID.
  clan.color - Clan color in HEX #RRGGBB.
  clan.created_at - Clan creation date.
  clan.members_count - Number of clan members.
  clan.name - Clan name.
  clan.tag - Clan Tag.

Clan.Emblems (Information on clan emblems in games and on clan portal):

  clan.emblems.x24 - List of links to 24x24 px emblems
  clan.emblems.x32 - List of links to 32x32 px emblems
  clan.emblems.x64 - List of links to 64x64 px emblems
  clan.emblems.x195 - List of links to 195x195 px emblems
  clan.emblems.x256 - List of links to 256x256 px emblems

=back

=head3 B<clans_glossary( [ %params ] )>

Method returns information on clan entities.

=over 1

=item I<Params>

  language - Localization language. 
  fields - Response field. The fields are separated with commas. Embedded fields are separated with dots. To exclude a field, use "-" in front of its name. In case the parameter is no defined, the method returns all fields.

=item I<Return>

  clans_roles - Available clan positions

=back

=head3 B<clans_messageboard( [ %params ] )>

Method returns messages of clan Message Board.

=over 1

=item I<Params>

  language - Localization language. 
  fields - Response field. The fields are separated with commas. Embedded fields are separated with dots. To exclude a field, use "-" in front of its name. In case the parameter is no defined, the method returns all fields.
  access_token* - Access token is used to access personal user data. The token is obtained via authentication and has expiration time.

=item I<Return>

  author_id - Message author ID.
  created_at - Message creation date.
  editor_id - ID of a player who has changed the message.
  is_read - Indicates if the message has been read.
  message - Message.
  updated_at - Date when message was updated.

=back

=head2 Servers

=head3 B<servers_info( [ %params ] )>

Method returns the number of online players on the servers.

=over 1

=item I<Params>

  language - Localization language. 
  fields - Response field. The fields are separated with commas. Embedded fields are separated with dots. To exclude a field, use "-" in front of its name. In case the parameter is no defined, the method returns all fields.
  game - Game ID. Valid values:

    "wot" - World of Tanks
    "wotb" - World of Tanks Blitz
    "wowp" - World of Warplanes

=item I<Return>

  players_online - Number of online players
  server - Server ID

=back

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

WG API Reference L<http://ru.wargaming.net/developers/>

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
