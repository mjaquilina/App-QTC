use utf8;
package App::QTC::Schema::Result::DataMessage;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::QTC::Schema::Result::DataMessage

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

__PACKAGE__->table("data_messages");

__PACKAGE__->add_columns(
  "data_message_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "data_grouping_id",
  { data_type => "integer", is_nullable => 1 },
  "datetime_received",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "sender_id",
  { data_type => 'int', is_nullable => 1, size => 255 },
  "recipient_id",
  { data_type => "int", is_nullable => 1, size => 255 },
  "data_position_id",
  { data_type => "int", is_nullable => 1, size => 255 },
  "message_contents",
  { data_type => "text", is_nullable => 1 },
  "original_message",
  { data_type => "text", is_nullable => 1 },
);

__PACKAGE__->belongs_to( recipient_id => 'App::QTC::Schema::Result::DataParty' );
__PACKAGE__->belongs_to( sender_id => 'App::QTC::Schema::Result::DataParty' );
__PACKAGE__->belongs_to( data_position_id => 'App::QTC::Schema::Result::DataPosition' );

__PACKAGE__->set_primary_key("data_message_id");

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2023-10-15 20:06:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ctb+0iqASKxF3XaWz/rfuA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
