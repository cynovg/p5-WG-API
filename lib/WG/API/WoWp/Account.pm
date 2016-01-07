package WG::API::WoWp::Account;

use Moo::Role;

our $VERSION = 'v0.7';

sub account_list {
    my $self = shift;

    $self->_request( 'get', 'account/list', ['language', 'fields', 'type', 'search', 'limit'], ['search'], @_ );

    return $self->status eq 'ok' ? $self->response : undef;
}

sub account_info {
    my $self = shift;

    $self->_request( 'get', 'account/info', ['language', 'fields', 'access_token', 'account_id'], ['account_id'], @_ );

    return $self->status eq 'ok' ? $self->response : undef;
}

sub account_planes {
    my $self = shift;

    $self->_request( 'get', 'account/planes', ['language', 'fields', 'access_token', 'account_id'], ['account_id'], @_ );

    return $self->status eq 'ok' ? $self->response : undef;
}

1; # End of WG::API::WoWp::Account

