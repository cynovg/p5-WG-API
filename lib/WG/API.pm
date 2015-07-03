package WG::API;

use 5.014;
use strict;
use warnings;
use WG::API::Error;
use WG::API::Data;
use LWP;
use JSON;
use Data::Dumper;

=head1 NAME

WG::API - Module for work with Wargaming.net Public API

=head1 VERSION

Version v0.02

=cut

our $VERSION = 'v0.02';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use WG::API::WoT::Account;

    my $wot = WG::API::WoT::Account->new( { application_id => 'demo' } );
    ...
    my $player = $wot->account_info( { account_id => '1' } );

=head1 CONSTRUCTOR

=head2 new

Create new object with params. Rerquired application id: http://ru.wargaming.net/developers/documentation/guide/getting-started/

Params:

 - application_id *
 - languare
 - api_uri

=cut

sub new {
    my ( $class, $params )  = @_;

    if ( ref $params eq 'HASH' && $params->{ 'application_id' } ) {

        my $self = $params;

        bless $self, ref( $class ) ? ref( $class ) : $class;

        $self->_init();

        return $self;
    }
    return;
}

sub _init {
    my $self = shift;

    $self->{ 'ua' }         = LWP::UserAgent->new();
    $self->{ 'lang' }       = 'ru' unless defined $self->{ 'lang' };
    $self->{ 'api_uri' }    = 'api.worldoftanks.ru/wgn' unless defined $self->{ 'api_uri' };
    $self->{ 'status' }      = '';

    return $self;
}

=head1 INTERNAL DATA

=head2 status

Return request status - 'ok', 'error' or undef, if request not finished.

=cut

sub status { shift->{ 'status' } }

=head2 response

Return response from WG API

=cut

sub response { shift->{ 'response' } }

=head2 meta

Fetch meta from response

=cut

sub meta { shift->{ 'meta' } }

=head2 error

Return WG::API::Error object

=cut

sub error { 
    my $self = shift;

    return $self->{ 'error' } ? $self->{ 'error' } : WG::API::Error->new( @_ );
}

sub _request {
    my ( $self, $method, $uri, $params, $required_params, $passed_params ) = @_;

    $self->{ 'status' } = '';

    return undef unless $self->_validate_params( $required_params, $passed_params );    #check required params

    return undef unless $method =~ /^(?:get|post)$/;

    $method = "_".$method;                                                              # add prefix for private methods

    $self->$method( $uri, $params, $passed_params );

    return 1;
}

sub _validate_params {
    my ( $self, $required_params, $passed_params ) = @_;

    return undef if $passed_params && ref $passed_params ne 'HASH';                     #invalid params ref
    return undef if $required_params && ! $passed_params;                               #without params when they are needed

    for ( @$required_params ) {
        return undef unless defined $passed_params->{ $_ };
    }

    return 'passed';
}

sub _get {
    my ( $self, $uri, $params, $passed_params ) = @_;

    my $url = sprintf 'https://%s/%s/?application_id=%s',
            $passed_params->{ 'api_uri' } ? $passed_params->{ 'api_uri' } : $self->{ 'api_uri' },
            $uri ? $uri : '',
            $self->{ 'application_id' },
    ;
    for ( @$params ) {
        $url .= sprintf "&%s=%s", $_, $passed_params->{ $_ } if defined $passed_params->{ $_ }; 
    }

    my $response = $self->{ 'ua' }->get( $url ); 
    $self->_parse( $response->is_success ? decode_json $response->decoded_content : undef );
    return;
}

sub _post {
    my ( $self, $uri, $params, $passed_params ) = @_;

    my $url = sprintf 'https://%s/%s/', 
        $passed_params->{ 'api_uri' } ? $passed_params->{ 'api_uri' } : $self->{ 'api_uri' },
        $uri ? $uri : '';

    #remove unused fields
    if ( $params && $passed_params ) {
        my %params;
        @params{ keys %$passed_params } = ();
        delete @params{ @$params };
        delete $passed_params->{ $_ } for keys %params;
    }

    $passed_params->{ 'application_id' } = $self->{ 'application_id' };

    my $response = $self->{ 'ua' }->post( $url, $passed_params ); 
    $self->_parse( $response->is_success ? decode_json $response->decoded_content : undef );
    return;
}

sub _parse {
    my ( $self, $response ) = @_;

    if ( ! $response ) { 
        $response = {
            status => 'error',
            error  => {
                code    => '999',
                message => 'invalid api_uri',
                field   => 'xxx',
                value   => 'xxx',
                raw     => Dumper $response,
            },
        };
    } elsif ( ! $response->{ 'status' } ) {
        $response = {
            status => 'error',
            error  => {
                code    => '998',
                message => 'unknown status',
                field   => 'xxx',
                value   => 'xxx',
                raw     => Dumper $response,
            },
        };
    }

    $self->{ 'status' } = $response->{ 'status' };
    delete $self->{ 'response' };

    if ( $self->status eq 'error' ) {
        $self->{ 'error' } = WG::API::Error->new(
            $response->{ 'error' },
        );
    } else {
        $self->{ 'error' }  = '';
        $self->{ 'meta' } = $response->{ 'meta' };

        if ( ref $response->{ 'data' } eq 'ARRAY' ) {
            for my $data ( @{ $response->{ 'data' } } ) {
                push @{ $self->{ 'response' } }, WG::API::Data->new( $data );
            };
        } else {
            push @{ $self->{ 'response' } }, $response->{ 'data' };
        }
    }

    return;
}

=head1 AUTHOR

Cyrill Novgorodcev, C<< <cynovg at cpan.org> >>

=head1 SEE ALSO

WG API Reference L<http://ru.wargaming.net/developers/>

=cut

1; # End of WG::API
