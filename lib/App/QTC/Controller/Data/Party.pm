package App::QTC::Controller::Data::Party;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/') PathPart('data/party') CaptureArgs(1)
{
    my ($self, $c, $party_id) = @_;

    my $party = $c->model('DB::DataParty')->search({
        data_party_id => $party_id
    })->first;

    if ($party)
    {
        $c->stash->{party} = $party;
    }
    else
    {
        $c->detach("nonexistent");
    }
}

sub view_party :Chained('base') PathPart('view') Args(0)
{
    my ($self, $c) = @_;

    my $messages = $c->model('DB::DataMessage')->search({
        recipient_id => $c->stash->{party}->data_party_id,
    }, {
        order_by => { -desc => 'data_message_id' },
    });

    $c->stash->{title} = "Message History for " . $c->stash->{party}->identifier;
    $c->stash->{messages} = $messages;
}

__PACKAGE__->meta->make_immutable;

1;
