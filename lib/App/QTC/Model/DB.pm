package App::QTC::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'App::QTC::Schema',
    
    connect_info => {
        dsn => 'dbi:mysql:qtc',
        user => 'qtc',
        password => 'r4d10',
        quote_names => q{1},
    }
);

=head1 NAME

App::QTC::Model::DB - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<App::QTC>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<App::QTC::Schema>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.65

=head1 AUTHOR

admin

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
