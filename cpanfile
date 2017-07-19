requires 'Moo', '2.00';
requires 'JSON', '2.61';
requires 'LWP', '6.08';
requires 'LWP::Protocol::https', '6.07'; 
requires 'Modern::Perl';

on build => sub {
    requires 'Test::More';
};
