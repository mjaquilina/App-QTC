package App::QTC::Controller::Data::Message;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/') PathPart('data/message') CaptureArgs(1)
{
    my ($self, $c, $message_id) = @_;

    my $message = $c->model('DB::DataMessage')->search({
        data_message_id => $message_id,
    })->first;

    if ($message)
    {
        $c->stash->{message} = $message;
    }
    else
    {
        $c->detach("nonexistent");
    }
}

sub view_message :Chained('base') PathPart('view') Args(0)
{
    my ($self, $c) = @_;

    $c->stash->{title} = "View Message";
}

__PACKAGE__->meta->make_immutable;

1;
