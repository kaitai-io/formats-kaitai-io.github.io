# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package AndroidSuper;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

}

sub root {
    my ($self) = @_;
    return $self->{root} if ($self->{root});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(4096);
    $self->{root} = AndroidSuper::Root->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{root};
}

########################################################################
package AndroidSuper::Geometry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{struct_size} = $self->{_io}->read_u4le();
    $self->{checksum} = $self->{_io}->read_bytes(32);
    $self->{metadata_max_size} = $self->{_io}->read_u4le();
    $self->{metadata_slot_count} = $self->{_io}->read_u4le();
    $self->{logical_block_size} = $self->{_io}->read_u4le();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub struct_size {
    my ($self) = @_;
    return $self->{struct_size};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

sub metadata_max_size {
    my ($self) = @_;
    return $self->{metadata_max_size};
}

sub metadata_slot_count {
    my ($self) = @_;
    return $self->{metadata_slot_count};
}

sub logical_block_size {
    my ($self) = @_;
    return $self->{logical_block_size};
}

########################################################################
package AndroidSuper::Metadata;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TABLE_KIND_PARTITIONS = 0;
our $TABLE_KIND_EXTENTS = 1;
our $TABLE_KIND_GROUPS = 2;
our $TABLE_KIND_BLOCK_DEVICES = 3;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{major_version} = $self->{_io}->read_u2le();
    $self->{minor_version} = $self->{_io}->read_u2le();
    $self->{header_size} = $self->{_io}->read_u4le();
    $self->{header_checksum} = $self->{_io}->read_bytes(32);
    $self->{tables_size} = $self->{_io}->read_u4le();
    $self->{tables_checksum} = $self->{_io}->read_bytes(32);
    $self->{partitions} = AndroidSuper::Metadata::TableDescriptor->new($self->{_io}, $self, $self->{_root});
    $self->{extents} = AndroidSuper::Metadata::TableDescriptor->new($self->{_io}, $self, $self->{_root});
    $self->{groups} = AndroidSuper::Metadata::TableDescriptor->new($self->{_io}, $self, $self->{_root});
    $self->{block_devices} = AndroidSuper::Metadata::TableDescriptor->new($self->{_io}, $self, $self->{_root});
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub major_version {
    my ($self) = @_;
    return $self->{major_version};
}

sub minor_version {
    my ($self) = @_;
    return $self->{minor_version};
}

sub header_size {
    my ($self) = @_;
    return $self->{header_size};
}

sub header_checksum {
    my ($self) = @_;
    return $self->{header_checksum};
}

sub tables_size {
    my ($self) = @_;
    return $self->{tables_size};
}

sub tables_checksum {
    my ($self) = @_;
    return $self->{tables_checksum};
}

sub partitions {
    my ($self) = @_;
    return $self->{partitions};
}

sub extents {
    my ($self) = @_;
    return $self->{extents};
}

sub groups {
    my ($self) = @_;
    return $self->{groups};
}

sub block_devices {
    my ($self) = @_;
    return $self->{block_devices};
}

########################################################################
package AndroidSuper::Metadata::BlockDevice;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{first_logical_sector} = $self->{_io}->read_u8le();
    $self->{alignment} = $self->{_io}->read_u4le();
    $self->{alignment_offset} = $self->{_io}->read_u4le();
    $self->{size} = $self->{_io}->read_u8le();
    $self->{partition_name} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(36), 0, 0));
    $self->{flag_slot_suffixed} = $self->{_io}->read_bits_int_le(1);
    $self->{flags_reserved} = $self->{_io}->read_bits_int_le(31);
}

sub first_logical_sector {
    my ($self) = @_;
    return $self->{first_logical_sector};
}

sub alignment {
    my ($self) = @_;
    return $self->{alignment};
}

sub alignment_offset {
    my ($self) = @_;
    return $self->{alignment_offset};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub partition_name {
    my ($self) = @_;
    return $self->{partition_name};
}

sub flag_slot_suffixed {
    my ($self) = @_;
    return $self->{flag_slot_suffixed};
}

sub flags_reserved {
    my ($self) = @_;
    return $self->{flags_reserved};
}

########################################################################
package AndroidSuper::Metadata::Extent;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TARGET_TYPE_LINEAR = 0;
our $TARGET_TYPE_ZERO = 1;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{num_sectors} = $self->{_io}->read_u8le();
    $self->{target_type} = $self->{_io}->read_u4le();
    $self->{target_data} = $self->{_io}->read_u8le();
    $self->{target_source} = $self->{_io}->read_u4le();
}

sub num_sectors {
    my ($self) = @_;
    return $self->{num_sectors};
}

sub target_type {
    my ($self) = @_;
    return $self->{target_type};
}

sub target_data {
    my ($self) = @_;
    return $self->{target_data};
}

sub target_source {
    my ($self) = @_;
    return $self->{target_source};
}

########################################################################
package AndroidSuper::Metadata::Group;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{name} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(36), 0, 0));
    $self->{flag_slot_suffixed} = $self->{_io}->read_bits_int_le(1);
    $self->{flags_reserved} = $self->{_io}->read_bits_int_le(31);
    $self->{_io}->align_to_byte();
    $self->{maximum_size} = $self->{_io}->read_u8le();
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub flag_slot_suffixed {
    my ($self) = @_;
    return $self->{flag_slot_suffixed};
}

sub flags_reserved {
    my ($self) = @_;
    return $self->{flags_reserved};
}

sub maximum_size {
    my ($self) = @_;
    return $self->{maximum_size};
}

########################################################################
package AndroidSuper::Metadata::Partition;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{name} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(36), 0, 0));
    $self->{attr_readonly} = $self->{_io}->read_bits_int_le(1);
    $self->{attr_slot_suffixed} = $self->{_io}->read_bits_int_le(1);
    $self->{attr_updated} = $self->{_io}->read_bits_int_le(1);
    $self->{attr_disabled} = $self->{_io}->read_bits_int_le(1);
    $self->{attrs_reserved} = $self->{_io}->read_bits_int_le(28);
    $self->{_io}->align_to_byte();
    $self->{first_extent_index} = $self->{_io}->read_u4le();
    $self->{num_extents} = $self->{_io}->read_u4le();
    $self->{group_index} = $self->{_io}->read_u4le();
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub attr_readonly {
    my ($self) = @_;
    return $self->{attr_readonly};
}

sub attr_slot_suffixed {
    my ($self) = @_;
    return $self->{attr_slot_suffixed};
}

sub attr_updated {
    my ($self) = @_;
    return $self->{attr_updated};
}

sub attr_disabled {
    my ($self) = @_;
    return $self->{attr_disabled};
}

sub attrs_reserved {
    my ($self) = @_;
    return $self->{attrs_reserved};
}

sub first_extent_index {
    my ($self) = @_;
    return $self->{first_extent_index};
}

sub num_extents {
    my ($self) = @_;
    return $self->{num_extents};
}

sub group_index {
    my ($self) = @_;
    return $self->{group_index};
}

########################################################################
package AndroidSuper::Metadata::TableDescriptor;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{offset} = $self->{_io}->read_u4le();
    $self->{num_entries} = $self->{_io}->read_u4le();
    $self->{entry_size} = $self->{_io}->read_u4le();
}

sub table {
    my ($self) = @_;
    return $self->{table} if ($self->{table});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->_parent()->header_size() + $self->offset());
    $self->{_raw_table} = [];
    $self->{table} = [];
    my $n_table = $self->num_entries();
    for (my $i = 0; $i < $n_table; $i++) {
        my $_on = $self->kind();
        if ($_on == $AndroidSuper::Metadata::TABLE_KIND_BLOCK_DEVICES) {
            push @{$self->{_raw_table}}, $self->{_io}->read_bytes($self->entry_size());
            my $io__raw_table = IO::KaitaiStruct::Stream->new($self->{_raw_table}[$i]);
            push @{$self->{table}}, AndroidSuper::Metadata::BlockDevice->new($io__raw_table, $self, $self->{_root});
        }
        elsif ($_on == $AndroidSuper::Metadata::TABLE_KIND_EXTENTS) {
            push @{$self->{_raw_table}}, $self->{_io}->read_bytes($self->entry_size());
            my $io__raw_table = IO::KaitaiStruct::Stream->new($self->{_raw_table}[$i]);
            push @{$self->{table}}, AndroidSuper::Metadata::Extent->new($io__raw_table, $self, $self->{_root});
        }
        elsif ($_on == $AndroidSuper::Metadata::TABLE_KIND_GROUPS) {
            push @{$self->{_raw_table}}, $self->{_io}->read_bytes($self->entry_size());
            my $io__raw_table = IO::KaitaiStruct::Stream->new($self->{_raw_table}[$i]);
            push @{$self->{table}}, AndroidSuper::Metadata::Group->new($io__raw_table, $self, $self->{_root});
        }
        elsif ($_on == $AndroidSuper::Metadata::TABLE_KIND_PARTITIONS) {
            push @{$self->{_raw_table}}, $self->{_io}->read_bytes($self->entry_size());
            my $io__raw_table = IO::KaitaiStruct::Stream->new($self->{_raw_table}[$i]);
            push @{$self->{table}}, AndroidSuper::Metadata::Partition->new($io__raw_table, $self, $self->{_root});
        }
        else {
            push @{$self->{table}}, $self->{_io}->read_bytes($self->entry_size());
        }
    }
    $self->{_io}->seek($_pos);
    return $self->{table};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub num_entries {
    my ($self) = @_;
    return $self->{num_entries};
}

sub entry_size {
    my ($self) = @_;
    return $self->{entry_size};
}

sub kind {
    my ($self) = @_;
    return $self->{kind};
}

sub _raw_table {
    my ($self) = @_;
    return $self->{_raw_table};
}

########################################################################
package AndroidSuper::Root;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{_raw_primary_geometry} = $self->{_io}->read_bytes(4096);
    my $io__raw_primary_geometry = IO::KaitaiStruct::Stream->new($self->{_raw_primary_geometry});
    $self->{primary_geometry} = AndroidSuper::Geometry->new($io__raw_primary_geometry, $self, $self->{_root});
    $self->{_raw_backup_geometry} = $self->{_io}->read_bytes(4096);
    my $io__raw_backup_geometry = IO::KaitaiStruct::Stream->new($self->{_raw_backup_geometry});
    $self->{backup_geometry} = AndroidSuper::Geometry->new($io__raw_backup_geometry, $self, $self->{_root});
    $self->{_raw_primary_metadata} = [];
    $self->{primary_metadata} = [];
    my $n_primary_metadata = $self->primary_geometry()->metadata_slot_count();
    for (my $i = 0; $i < $n_primary_metadata; $i++) {
        push @{$self->{_raw_primary_metadata}}, $self->{_io}->read_bytes($self->primary_geometry()->metadata_max_size());
        my $io__raw_primary_metadata = IO::KaitaiStruct::Stream->new($self->{_raw_primary_metadata}[$i]);
        push @{$self->{primary_metadata}}, AndroidSuper::Metadata->new($io__raw_primary_metadata, $self, $self->{_root});
    }
    $self->{_raw_backup_metadata} = [];
    $self->{backup_metadata} = [];
    my $n_backup_metadata = $self->primary_geometry()->metadata_slot_count();
    for (my $i = 0; $i < $n_backup_metadata; $i++) {
        push @{$self->{_raw_backup_metadata}}, $self->{_io}->read_bytes($self->primary_geometry()->metadata_max_size());
        my $io__raw_backup_metadata = IO::KaitaiStruct::Stream->new($self->{_raw_backup_metadata}[$i]);
        push @{$self->{backup_metadata}}, AndroidSuper::Metadata->new($io__raw_backup_metadata, $self, $self->{_root});
    }
}

sub primary_geometry {
    my ($self) = @_;
    return $self->{primary_geometry};
}

sub backup_geometry {
    my ($self) = @_;
    return $self->{backup_geometry};
}

sub primary_metadata {
    my ($self) = @_;
    return $self->{primary_metadata};
}

sub backup_metadata {
    my ($self) = @_;
    return $self->{backup_metadata};
}

sub _raw_primary_geometry {
    my ($self) = @_;
    return $self->{_raw_primary_geometry};
}

sub _raw_backup_geometry {
    my ($self) = @_;
    return $self->{_raw_backup_geometry};
}

sub _raw_primary_metadata {
    my ($self) = @_;
    return $self->{_raw_primary_metadata};
}

sub _raw_backup_metadata {
    my ($self) = @_;
    return $self->{_raw_backup_metadata};
}

1;
