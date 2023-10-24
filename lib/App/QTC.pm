package App::QTC;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

use Catalyst qw/
    -Debug
    ConfigLoader
    DateTime
    Session
    Session::State
    Session::Store
    Static::Simple
/;

extends 'Catalyst';

our $VERSION = '0.01';

__PACKAGE__->config(
    name => 'App::QTC',
    default_view => 'Web',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1, # Send X-Catalyst header
    encoding => 'UTF-8', # Setup request decoding and response encoding
    'View::Web' => {
        INCLUDE_PATH => [
          __PACKAGE__->path_to( 'template' ),
        ],
    },
    'View::JSON' => {
        expose_stash => 'json',
    },
);


__PACKAGE__->setup();

sub end : ActionClass('RenderView') {}

=encoding utf8

=head1 NAME

App::QTC - Catalyst based application

=head1 SYNOPSIS

    script/app_qtc_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<App::QTC::Controller::Root>, L<Catalyst>

=head1 AUTHOR

admin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
