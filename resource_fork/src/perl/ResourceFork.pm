# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use BytesWithIo;

########################################################################
package ResourceFork;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{header} = ResourceFork::FileHeader->new($self->{_io}, $self, $self->{_root});
    $self->{system_data} = $self->{_io}->read_bytes(112);
    $self->{application_data} = $self->{_io}->read_bytes(128);
}

sub data_blocks_with_io {
    my ($self) = @_;
    return $self->{data_blocks_with_io} if ($self->{data_blocks_with_io});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->header()->ofs_data_blocks());
    $self->{_raw_data_blocks_with_io} = $self->{_io}->read_bytes($self->header()->len_data_blocks());
    my $io__raw_data_blocks_with_io = IO::KaitaiStruct::Stream->new($self->{_raw_data_blocks_with_io});
    $self->{data_blocks_with_io} = BytesWithIo->new($io__raw_data_blocks_with_io);
    $self->{_io}->seek($_pos);
    return $self->{data_blocks_with_io};
}

sub data_blocks {
    my ($self) = @_;
    return $self->{data_blocks} if ($self->{data_blocks});
    $self->{data_blocks} = $self->data_blocks_with_io()->data();
    return $self->{data_blocks};
}

sub resource_map {
    my ($self) = @_;
    return $self->{resource_map} if ($self->{resource_map});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->header()->ofs_resource_map());
    $self->{_raw_resource_map} = $self->{_io}->read_bytes($self->header()->len_resource_map());
    my $io__raw_resource_map = IO::KaitaiStruct::Stream->new($self->{_raw_resource_map});
    $self->{resource_map} = ResourceFork::ResourceMap->new($io__raw_resource_map, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{resource_map};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub system_data {
    my ($self) = @_;
    return $self->{system_data};
}

sub application_data {
    my ($self) = @_;
    return $self->{application_data};
}

sub _raw_data_blocks_with_io {
    my ($self) = @_;
    return $self->{_raw_data_blocks_with_io};
}

sub _raw_resource_map {
    my ($self) = @_;
    return $self->{_raw_resource_map};
}

########################################################################
package ResourceFork::FileHeader;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{ofs_data_blocks} = $self->{_io}->read_u4be();
    $self->{ofs_resource_map} = $self->{_io}->read_u4be();
    $self->{len_data_blocks} = $self->{_io}->read_u4be();
    $self->{len_resource_map} = $self->{_io}->read_u4be();
}

sub ofs_data_blocks {
    my ($self) = @_;
    return $self->{ofs_data_blocks};
}

sub ofs_resource_map {
    my ($self) = @_;
    return $self->{ofs_resource_map};
}

sub len_data_blocks {
    my ($self) = @_;
    return $self->{len_data_blocks};
}

sub len_resource_map {
    my ($self) = @_;
    return $self->{len_resource_map};
}

########################################################################
package ResourceFork::DataBlock;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_data} = $self->{_io}->read_u4be();
    $self->{data} = $self->{_io}->read_bytes($self->len_data());
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package ResourceFork::ResourceMap;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{reserved_file_header_copy} = ResourceFork::FileHeader->new($self->{_io}, $self, $self->{_root});
    $self->{reserved_next_resource_map_handle} = $self->{_io}->read_u4be();
    $self->{reserved_file_reference_number} = $self->{_io}->read_u2be();
    $self->{_raw_file_attributes} = $self->{_io}->read_bytes(2);
    my $io__raw_file_attributes = IO::KaitaiStruct::Stream->new($self->{_raw_file_attributes});
    $self->{file_attributes} = ResourceFork::ResourceMap::FileAttributes->new($io__raw_file_attributes, $self, $self->{_root});
    $self->{ofs_type_list} = $self->{_io}->read_u2be();
    $self->{ofs_names} = $self->{_io}->read_u2be();
}

sub type_list_and_reference_lists {
    my ($self) = @_;
    return $self->{type_list_and_reference_lists} if ($self->{type_list_and_reference_lists});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_type_list());
    $self->{_raw_type_list_and_reference_lists} = $self->{_io}->read_bytes(($self->ofs_names() - $self->ofs_type_list()));
    my $io__raw_type_list_and_reference_lists = IO::KaitaiStruct::Stream->new($self->{_raw_type_list_and_reference_lists});
    $self->{type_list_and_reference_lists} = ResourceFork::ResourceMap::TypeListAndReferenceLists->new($io__raw_type_list_and_reference_lists, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{type_list_and_reference_lists};
}

sub names_with_io {
    my ($self) = @_;
    return $self->{names_with_io} if ($self->{names_with_io});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_names());
    $self->{_raw_names_with_io} = $self->{_io}->read_bytes_full();
    my $io__raw_names_with_io = IO::KaitaiStruct::Stream->new($self->{_raw_names_with_io});
    $self->{names_with_io} = BytesWithIo->new($io__raw_names_with_io);
    $self->{_io}->seek($_pos);
    return $self->{names_with_io};
}

sub names {
    my ($self) = @_;
    return $self->{names} if ($self->{names});
    $self->{names} = $self->names_with_io()->data();
    return $self->{names};
}

sub reserved_file_header_copy {
    my ($self) = @_;
    return $self->{reserved_file_header_copy};
}

sub reserved_next_resource_map_handle {
    my ($self) = @_;
    return $self->{reserved_next_resource_map_handle};
}

sub reserved_file_reference_number {
    my ($self) = @_;
    return $self->{reserved_file_reference_number};
}

sub file_attributes {
    my ($self) = @_;
    return $self->{file_attributes};
}

sub ofs_type_list {
    my ($self) = @_;
    return $self->{ofs_type_list};
}

sub ofs_names {
    my ($self) = @_;
    return $self->{ofs_names};
}

sub _raw_file_attributes {
    my ($self) = @_;
    return $self->{_raw_file_attributes};
}

sub _raw_type_list_and_reference_lists {
    my ($self) = @_;
    return $self->{_raw_type_list_and_reference_lists};
}

sub _raw_names_with_io {
    my ($self) = @_;
    return $self->{_raw_names_with_io};
}

########################################################################
package ResourceFork::ResourceMap::FileAttributes;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{resources_locked} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved0} = $self->{_io}->read_bits_int_be(6);
    $self->{printer_driver_multifinder_compatible} = $self->{_io}->read_bits_int_be(1);
    $self->{no_write_changes} = $self->{_io}->read_bits_int_be(1);
    $self->{needs_compact} = $self->{_io}->read_bits_int_be(1);
    $self->{map_needs_write} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved1} = $self->{_io}->read_bits_int_be(5);
}

sub as_int {
    my ($self) = @_;
    return $self->{as_int} if ($self->{as_int});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{as_int} = $self->{_io}->read_u2be();
    $self->{_io}->seek($_pos);
    return $self->{as_int};
}

sub resources_locked {
    my ($self) = @_;
    return $self->{resources_locked};
}

sub reserved0 {
    my ($self) = @_;
    return $self->{reserved0};
}

sub printer_driver_multifinder_compatible {
    my ($self) = @_;
    return $self->{printer_driver_multifinder_compatible};
}

sub no_write_changes {
    my ($self) = @_;
    return $self->{no_write_changes};
}

sub needs_compact {
    my ($self) = @_;
    return $self->{needs_compact};
}

sub map_needs_write {
    my ($self) = @_;
    return $self->{map_needs_write};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

########################################################################
package ResourceFork::ResourceMap::TypeListAndReferenceLists;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{type_list} = ResourceFork::ResourceMap::TypeListAndReferenceLists::TypeList->new($self->{_io}, $self, $self->{_root});
    $self->{reference_lists} = $self->{_io}->read_bytes_full();
}

sub type_list {
    my ($self) = @_;
    return $self->{type_list};
}

sub reference_lists {
    my ($self) = @_;
    return $self->{reference_lists};
}

########################################################################
package ResourceFork::ResourceMap::TypeListAndReferenceLists::TypeList;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{num_types_m1} = $self->{_io}->read_u2be();
    $self->{entries} = ();
    my $n_entries = $self->num_types();
    for (my $i = 0; $i < $n_entries; $i++) {
        push @{$self->{entries}}, ResourceFork::ResourceMap::TypeListAndReferenceLists::TypeList::TypeListEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_types {
    my ($self) = @_;
    return $self->{num_types} if ($self->{num_types});
    $self->{num_types} = (($self->num_types_m1() + 1) % 65536);
    return $self->{num_types};
}

sub num_types_m1 {
    my ($self) = @_;
    return $self->{num_types_m1};
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package ResourceFork::ResourceMap::TypeListAndReferenceLists::TypeList::TypeListEntry;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{type} = $self->{_io}->read_bytes(4);
    $self->{num_references_m1} = $self->{_io}->read_u2be();
    $self->{ofs_reference_list} = $self->{_io}->read_u2be();
}

sub num_references {
    my ($self) = @_;
    return $self->{num_references} if ($self->{num_references});
    $self->{num_references} = (($self->num_references_m1() + 1) % 65536);
    return $self->{num_references};
}

sub reference_list {
    my ($self) = @_;
    return $self->{reference_list} if ($self->{reference_list});
    my $io = $self->_parent()->_parent()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_reference_list());
    $self->{reference_list} = ResourceFork::ResourceMap::TypeListAndReferenceLists::ReferenceList->new($io, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{reference_list};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub num_references_m1 {
    my ($self) = @_;
    return $self->{num_references_m1};
}

sub ofs_reference_list {
    my ($self) = @_;
    return $self->{ofs_reference_list};
}

########################################################################
package ResourceFork::ResourceMap::TypeListAndReferenceLists::ReferenceList;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{references} = ();
    my $n_references = $self->num_references();
    for (my $i = 0; $i < $n_references; $i++) {
        push @{$self->{references}}, ResourceFork::ResourceMap::TypeListAndReferenceLists::ReferenceList::Reference->new($self->{_io}, $self, $self->{_root});
    }
}

sub references {
    my ($self) = @_;
    return $self->{references};
}

sub num_references {
    my ($self) = @_;
    return $self->{num_references};
}

########################################################################
package ResourceFork::ResourceMap::TypeListAndReferenceLists::ReferenceList::Reference;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{id} = $self->{_io}->read_s2be();
    $self->{ofs_name} = $self->{_io}->read_u2be();
    $self->{_raw_attributes} = $self->{_io}->read_bytes(1);
    my $io__raw_attributes = IO::KaitaiStruct::Stream->new($self->{_raw_attributes});
    $self->{attributes} = ResourceFork::ResourceMap::TypeListAndReferenceLists::ReferenceList::Reference::Attributes->new($io__raw_attributes, $self, $self->{_root});
    $self->{ofs_data_block} = $self->{_io}->read_bits_int_be(24);
    $self->{_io}->align_to_byte();
    $self->{reserved_handle} = $self->{_io}->read_u4be();
}

sub name {
    my ($self) = @_;
    return $self->{name} if ($self->{name});
    if ($self->ofs_name() != 65535) {
        my $io = $self->_root()->resource_map()->names_with_io()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs_name());
        $self->{name} = ResourceFork::ResourceMap::Name->new($io, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{name};
}

sub data_block {
    my ($self) = @_;
    return $self->{data_block} if ($self->{data_block});
    my $io = $self->_root()->data_blocks_with_io()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_data_block());
    $self->{data_block} = ResourceFork::DataBlock->new($io, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{data_block};
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub ofs_name {
    my ($self) = @_;
    return $self->{ofs_name};
}

sub attributes {
    my ($self) = @_;
    return $self->{attributes};
}

sub ofs_data_block {
    my ($self) = @_;
    return $self->{ofs_data_block};
}

sub reserved_handle {
    my ($self) = @_;
    return $self->{reserved_handle};
}

sub _raw_attributes {
    my ($self) = @_;
    return $self->{_raw_attributes};
}

########################################################################
package ResourceFork::ResourceMap::TypeListAndReferenceLists::ReferenceList::Reference::Attributes;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{system_reference} = $self->{_io}->read_bits_int_be(1);
    $self->{load_into_system_heap} = $self->{_io}->read_bits_int_be(1);
    $self->{purgeable} = $self->{_io}->read_bits_int_be(1);
    $self->{locked} = $self->{_io}->read_bits_int_be(1);
    $self->{protected} = $self->{_io}->read_bits_int_be(1);
    $self->{preload} = $self->{_io}->read_bits_int_be(1);
    $self->{needs_write} = $self->{_io}->read_bits_int_be(1);
    $self->{compressed} = $self->{_io}->read_bits_int_be(1);
}

sub as_int {
    my ($self) = @_;
    return $self->{as_int} if ($self->{as_int});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{as_int} = $self->{_io}->read_u1();
    $self->{_io}->seek($_pos);
    return $self->{as_int};
}

sub system_reference {
    my ($self) = @_;
    return $self->{system_reference};
}

sub load_into_system_heap {
    my ($self) = @_;
    return $self->{load_into_system_heap};
}

sub purgeable {
    my ($self) = @_;
    return $self->{purgeable};
}

sub locked {
    my ($self) = @_;
    return $self->{locked};
}

sub protected {
    my ($self) = @_;
    return $self->{protected};
}

sub preload {
    my ($self) = @_;
    return $self->{preload};
}

sub needs_write {
    my ($self) = @_;
    return $self->{needs_write};
}

sub compressed {
    my ($self) = @_;
    return $self->{compressed};
}

########################################################################
package ResourceFork::ResourceMap::Name;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_value} = $self->{_io}->read_u1();
    $self->{value} = $self->{_io}->read_bytes($self->len_value());
}

sub len_value {
    my ($self) = @_;
    return $self->{len_value};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

1;
