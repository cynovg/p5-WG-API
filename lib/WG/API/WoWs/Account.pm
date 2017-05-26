package WG::API::WoWs::Account;

use Moo::Role;

our $VERSION = 'v0.8.2';

sub account_list {
    my $self = shift;

    return $self->_request( 'get', 'account/list', ['language', 'fields', 'type', 'search', 'limit'], ['search'], @_ );
}

sub account_info {
    my $self = shift;

    return $self->_request( 'get', 'account/info', ['language', 'fields', 'access_token', 'extra', 'account_id'], ['account_id'], @_ );
}

sub account_achievements {
    my $self = shift;

    return $self->_request( 'get', 'account/achievements', ['language', 'fields', 'account_id'], ['account_id'], @_ );
}

1; # End of WG::API::WoWs::Account

