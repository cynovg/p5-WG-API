package WG::API::NET::Servers;

use 5.014;
use strict;
use warnings;

our $VERSION = 'v0.05';

sub servers_info { 
    my ( $self, %params ) = @_;

    $self->_request( 'get', 'servers/info', ['language', 'fields', 'game'], undef, %params ); 
    
    return $self->status eq 'ok' ? 
        WG::API::Data->new( $params{ 'game' } ? $self->response->{ $params{ 'game' } } : $self->response )
        : undef;
}

1; # End of WG::API::Servers
