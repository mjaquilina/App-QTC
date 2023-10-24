package App::QTC::Controller::Data;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub search :Path
{
    my ($self, $c) = @_;
    $c->stash->{title} = 'Search';
    if (my $q = $c->req->param('q'))
    {
        $c->stash->{messages} = $c->model('DB::DataMessage')->search({
            message_contents => { "LIKE", "%$q%" },
        });
    }
}

__PACKAGE__->meta->make_immutable;

1;
