package WG::API::WoT::Globalwar;

use v5.014;
use strict;
use warnings;
use base qw/WG::API::WoT/;
use Data::Dumper;

=head1 NAME

WG::API::WoT::

=head1 VERSION

Version v0.02

=cut

our $VERSION = 'v0.02';

=head1 METHODS

=head2 globalwar_clans 

Method returns list of clans engaged in Clan Wars.

=cut 

sub globalwar_clans{
    my $self = shift;

    $self->_request( 'get', 'globalwar/clans', ['language', 'fields', 'map_id', 'limit', 'page_no'], ['map_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_maps 

Method returns information about all maps on Global Map. For each map there is information about last season.

=cut 

sub globalwar_maps {
    my $self = shift;

    $self->_request( 'get', 'globalwar/maps', ['language', 'fields'], undef, $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_provinces 

Method returns list of provinces on the Global Map.

=cut 

sub globalwar_provinces {
    my $self = shift;

    $self->_request( 'get', 'globalwar/provinces', ['language', 'fields', 'map_id', 'province_id', 'region_id', 'status'], ['map_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_tournaments 

Method returns list of tournaments on the selected Global Map.

=cut 

sub globalwar_tournaments {
    my $self = shift;

    $self->_request( 'get', 'globalwar/tournaments', ['language', 'fields', 'map_id', 'province_id'], ['map_id', 'province_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_battles 

Method returns list of clan's battles.

=cut 

sub globalwar_battles {
    my $self = shift;

    $self->_request( 'get', 'globalwar/battles', ['language', 'fields', 'access_token', 'map_id', 'clan_id'], ['map_id', 'clan_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_accountpoints 

Method returns information about player's fame points.

=cut 

sub globalwar_accountpoints {
    my $self = shift;

    $self->_request( 'get', 'globalwar/accountpoints', ['language', 'fields', 'map_id', 'account_id'], ['map_id', 'account_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_accountpointshistory 

Method returns information about the changes of player's fame points.

=cut 

sub globalwar_accountpointshistory {
    my $self = shift;

    $self->_request( 'get', 'globalwar/accountpointshistory', ['language', 'fields', 'access_token', 'map_id', 'since', 'until', 'page_no', 'limit'], ['access_token', 'map_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_accountpointsrating 

Method returns list of top players in fame points rating.

=cut 

sub globalwar_accountpointsrating {
    my $self = shift;

    $self->_request( 'get', 'globalwar/accountpointsrating', ['language', 'fields', 'map_id', 'page_no', 'limit'], ['map_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_clanpoints 

Method returns information about clan's fame points.

=cut 

sub globalwar_clanpoints {
    my $self = shift;

    $self->_request( 'get', 'globalwar/clanpoints', ['language', 'fields', 'map_id', 'clan_id'], ['map_id', 'clan_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_clanpointshistory 

Method returns information about the changes of clan's fame points.

=cut 

sub globalwar_clanpointshistory {
    my $self = shift;

    $self->_request( 'get', 'globalwar/clanpointshistory', ['language', 'fields', 'map_id', 'clan_id', 'since', 'until', 'page_no', 'limit'], ['map_id', 'clan_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_clanpointsrating 

Method returns list of top clans in fame points rating.

=cut 

sub globalwar_clanpointsrating {
    my $self = shift;

    $self->_request( 'get', 'globalwar/clanpointsrating', ['language', 'fields', 'map_id', 'page_no', 'limit'], ['map_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
}

=head2 globalwar_clanprovinces

Method returns lists of clans provinces.

=cut 

sub globalwar_clanprovinces {
    my $self = shift;

    $self->_request( 'get', 'globalwar/clanprovinces', ['language', 'fields', 'clan_id'], ['clan_id'], $_[0] );

    return $self->status eq 'ok' ? $self->response : undef ;
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

1; # End of WG::API::WoT::Globalwar
