package App::QTC::Controller::API;
use Moose;
use namespace::autoclean;
use JSON;

BEGIN { extends 'Catalyst::Controller' }

sub submit_message :Path
{
    my ($self, $c) = @_;

    my $json = $c->req->body_data;

    die unless $json;

    my $recipient_id; 
    if (my $recipient_txt = $json->{recipient}) {
        my $recipient   = $c->model('DB::DataParty')->search({ identifier => $recipient_txt })->first;
           $recipient ||= $c->model('DB::DataParty')->create({ identifier => $recipient_txt });
        $recipient_id = $recipient->data_party_id;
    }   

    my $sender_id; 
    if (my $sender_txt = $json->{sender}) {
        my $sender   = $c->model('DB::DataParty')->search({ identifier => $sender_txt })->first;
           $sender ||= $c->model('DB::DataParty')->create({ identifier => $sender_txt });
        $sender_id = $sender->data_party_id;
    }

    my $pos;
    if (my $pos_data = $json->{position})
    {
        $pos = $c->model('DB::DataPosition')->create({
            latitude  => $pos_data->{latitude},
            longitude => $pos_data->{longitude},
            speed     => $pos_data->{speed},
            altitude  => $pos_data->{altitude},
        });
    }

    my $msg = $c->model('DB::DataMessage')->create({
        data_grouping_id  => 1,
        datetime_received => $json->{datetime_received} || $c->dt,
        sender_id         => $sender_id,
        recipient_id      => $recipient_id,
        message_contents  => $json->{message_contents},
        original_message  => $json->{original_message},
        data_position_id  => $pos ? $pos->data_position_id : undef,
    });

    $c->stash->{json}{data_message_id} = "$msg";
    $c->stash->{json}{success} = 1;

    $c->forward("View::JSON");
}

__PACKAGE__->meta->make_immutable;

1;
