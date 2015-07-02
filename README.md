[![Build Status](https://travis-ci.org/cynovg/WG-API.svg?branch=master)](https://travis-ci.org/cynovg/WG-API) [![Coverage Status](https://img.shields.io/coveralls/cynovg/WG-API/master.svg?style=flat)](https://coveralls.io/r/cynovg/WG-API?branch=master)
# NAME

WG::API - Module for work with Wargaming.net Public API

# VERSION

Version v0.02

# SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use WG::API::WoT::Account;

    my $wot = WG::API::WoT::Account->new( { application_id => 'demo' } );
    ...
    my $player = $wot->account_info( { account_id => '1' } );

# CONSTRUCTOR

## new

Create new object with params. Rerquired application id: http://ru.wargaming.net/developers/documentation/guide/getting-started/

Params:
    application\_id \*
    languare
    api\_uri

## INTERNAL DATA

### status

Return request status - 'ok', 'error' or undef, if request not finished.

### response

Return response from WG API

### meta

Fetch meta from response

### error

Return WG::API::Error object

# AUTHOR

Cyrill Novgorodcev, `<cynovg at cpan.org>`

# SEE ALSO

WG API Reference http://ru.wargaming.net/developers/api\_reference/wot/account/list/
