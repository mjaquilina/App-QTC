use utf8;
package App::QTC::Schema::Result::DataParty;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

App::QTC::Schema::Result::DataParty

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<data_groupings>

=cut

__PACKAGE__->table("data_parties");

=head1 ACCESSORS

=head2 data_party_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "data_party_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "identifier",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</data_party_id>

=back

=cut

__PACKAGE__->set_primary_key("data_party_id");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2023-10-15 20:06:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PD5n8yzghHWT4eKIl4OQgA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
