use utf8;
package App::QTC::Schema::Result::DataPosition;

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

__PACKAGE__->table("data_positions");

__PACKAGE__->add_columns(
  "data_position_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "latitude",
  { data_type => "decimal(9,6)" },
  "longitude",
  { data_type => "decimal(9,6)" },
  "speed",
  { data_type => "decimal(9,6)" },
  "altitude",
  { data_type => "decimal(9,6)" },
);

__PACKAGE__->set_primary_key("data_position_id");

__PACKAGE__->meta->make_immutable;
1;
