# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Vdi;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $IMAGE_TYPE_DYNAMIC = 1;
our $IMAGE_TYPE_STATIC = 2;
our $IMAGE_TYPE_UNDO = 3;
our $IMAGE_TYPE_DIFF = 4;

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

    $self->{header} = Vdi::Header->new($self->{_io}, $self, $self->{_root});
}

sub block_discarded {
    my ($self) = @_;
    return $self->{block_discarded} if ($self->{block_discarded});
    $self->{block_discarded} = 4294967294;
    return $self->{block_discarded};
}

sub block_unallocated {
    my ($self) = @_;
    return $self->{block_unallocated} if ($self->{block_unallocated});
    $self->{block_unallocated} = 4294967295;
    return $self->{block_unallocated};
}

sub blocks_map {
    my ($self) = @_;
    return $self->{blocks_map} if ($self->{blocks_map});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->header()->blocks_map_offset());
    $self->{_raw_blocks_map} = $self->{_io}->read_bytes($self->header()->blocks_map_size());
    my $io__raw_blocks_map = IO::KaitaiStruct::Stream->new($self->{_raw_blocks_map});
    $self->{blocks_map} = Vdi::BlocksMap->new($io__raw_blocks_map, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{blocks_map};
}

sub disk {
    my ($self) = @_;
    return $self->{disk} if ($self->{disk});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->header()->blocks_offset());
    $self->{disk} = Vdi::Disk->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{disk};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub _raw_blocks_map {
    my ($self) = @_;
    return $self->{_raw_blocks_map};
}

########################################################################
package Vdi::Header;

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

    $self->{text} = Encode::decode("utf-8", $self->{_io}->read_bytes(64));
    $self->{signature} = $self->{_io}->read_bytes(4);
    $self->{version} = Vdi::Header::Version->new($self->{_io}, $self, $self->{_root});
    if ($self->subheader_size_is_dynamic()) {
        $self->{header_size_optional} = $self->{_io}->read_u4le();
    }
    $self->{_raw_header_main} = $self->{_io}->read_bytes($self->header_size());
    my $io__raw_header_main = IO::KaitaiStruct::Stream->new($self->{_raw_header_main});
    $self->{header_main} = Vdi::Header::HeaderMain->new($io__raw_header_main, $self, $self->{_root});
}

sub header_size {
    my ($self) = @_;
    return $self->{header_size} if ($self->{header_size});
    $self->{header_size} = ($self->subheader_size_is_dynamic() ? $self->header_size_optional() : 336);
    return $self->{header_size};
}

sub blocks_map_offset {
    my ($self) = @_;
    return $self->{blocks_map_offset} if ($self->{blocks_map_offset});
    $self->{blocks_map_offset} = $self->header_main()->blocks_map_offset();
    return $self->{blocks_map_offset};
}

sub subheader_size_is_dynamic {
    my ($self) = @_;
    return $self->{subheader_size_is_dynamic} if ($self->{subheader_size_is_dynamic});
    $self->{subheader_size_is_dynamic} = $self->version()->major() >= 1;
    return $self->{subheader_size_is_dynamic};
}

sub blocks_offset {
    my ($self) = @_;
    return $self->{blocks_offset} if ($self->{blocks_offset});
    $self->{blocks_offset} = $self->header_main()->offset_data();
    return $self->{blocks_offset};
}

sub block_size {
    my ($self) = @_;
    return $self->{block_size} if ($self->{block_size});
    $self->{block_size} = ($self->header_main()->block_metadata_size() + $self->header_main()->block_data_size());
    return $self->{block_size};
}

sub blocks_map_size {
    my ($self) = @_;
    return $self->{blocks_map_size} if ($self->{blocks_map_size});
    $self->{blocks_map_size} = (int(((($self->header_main()->blocks_in_image() * 4) + $self->header_main()->geometry()->sector_size()) - 1) / $self->header_main()->geometry()->sector_size()) * $self->header_main()->geometry()->sector_size());
    return $self->{blocks_map_size};
}

sub text {
    my ($self) = @_;
    return $self->{text};
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub header_size_optional {
    my ($self) = @_;
    return $self->{header_size_optional};
}

sub header_main {
    my ($self) = @_;
    return $self->{header_main};
}

sub _raw_header_main {
    my ($self) = @_;
    return $self->{_raw_header_main};
}

########################################################################
package Vdi::Header::Uuid;

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

    $self->{uuid} = $self->{_io}->read_bytes(16);
}

sub uuid {
    my ($self) = @_;
    return $self->{uuid};
}

########################################################################
package Vdi::Header::Version;

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

    $self->{major} = $self->{_io}->read_u2le();
    $self->{minor} = $self->{_io}->read_u2le();
}

sub major {
    my ($self) = @_;
    return $self->{major};
}

sub minor {
    my ($self) = @_;
    return $self->{minor};
}

########################################################################
package Vdi::Header::HeaderMain;

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

    $self->{image_type} = $self->{_io}->read_u4le();
    $self->{image_flags} = Vdi::Header::HeaderMain::Flags->new($self->{_io}, $self, $self->{_root});
    $self->{description} = Encode::decode("utf-8", $self->{_io}->read_bytes(256));
    if ($self->_parent()->version()->major() >= 1) {
        $self->{blocks_map_offset} = $self->{_io}->read_u4le();
    }
    if ($self->_parent()->version()->major() >= 1) {
        $self->{offset_data} = $self->{_io}->read_u4le();
    }
    $self->{geometry} = Vdi::Header::HeaderMain::Geometry->new($self->{_io}, $self, $self->{_root});
    if ($self->_parent()->version()->major() >= 1) {
        $self->{reserved1} = $self->{_io}->read_u4le();
    }
    $self->{disk_size} = $self->{_io}->read_u8le();
    $self->{block_data_size} = $self->{_io}->read_u4le();
    if ($self->_parent()->version()->major() >= 1) {
        $self->{block_metadata_size} = $self->{_io}->read_u4le();
    }
    $self->{blocks_in_image} = $self->{_io}->read_u4le();
    $self->{blocks_allocated} = $self->{_io}->read_u4le();
    $self->{uuid_image} = Vdi::Header::Uuid->new($self->{_io}, $self, $self->{_root});
    $self->{uuid_last_snap} = Vdi::Header::Uuid->new($self->{_io}, $self, $self->{_root});
    $self->{uuid_link} = Vdi::Header::Uuid->new($self->{_io}, $self, $self->{_root});
    if ($self->_parent()->version()->major() >= 1) {
        $self->{uuid_parent} = Vdi::Header::Uuid->new($self->{_io}, $self, $self->{_root});
    }
    if ( (($self->_parent()->version()->major() >= 1) && (($self->_io()->pos() + 16) <= $self->_io()->size())) ) {
        $self->{lchc_geometry} = Vdi::Header::HeaderMain::Geometry->new($self->{_io}, $self, $self->{_root});
    }
}

sub image_type {
    my ($self) = @_;
    return $self->{image_type};
}

sub image_flags {
    my ($self) = @_;
    return $self->{image_flags};
}

sub description {
    my ($self) = @_;
    return $self->{description};
}

sub blocks_map_offset {
    my ($self) = @_;
    return $self->{blocks_map_offset};
}

sub offset_data {
    my ($self) = @_;
    return $self->{offset_data};
}

sub geometry {
    my ($self) = @_;
    return $self->{geometry};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub disk_size {
    my ($self) = @_;
    return $self->{disk_size};
}

sub block_data_size {
    my ($self) = @_;
    return $self->{block_data_size};
}

sub block_metadata_size {
    my ($self) = @_;
    return $self->{block_metadata_size};
}

sub blocks_in_image {
    my ($self) = @_;
    return $self->{blocks_in_image};
}

sub blocks_allocated {
    my ($self) = @_;
    return $self->{blocks_allocated};
}

sub uuid_image {
    my ($self) = @_;
    return $self->{uuid_image};
}

sub uuid_last_snap {
    my ($self) = @_;
    return $self->{uuid_last_snap};
}

sub uuid_link {
    my ($self) = @_;
    return $self->{uuid_link};
}

sub uuid_parent {
    my ($self) = @_;
    return $self->{uuid_parent};
}

sub lchc_geometry {
    my ($self) = @_;
    return $self->{lchc_geometry};
}

########################################################################
package Vdi::Header::HeaderMain::Geometry;

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

    $self->{cylinders} = $self->{_io}->read_u4le();
    $self->{heads} = $self->{_io}->read_u4le();
    $self->{sectors} = $self->{_io}->read_u4le();
    $self->{sector_size} = $self->{_io}->read_u4le();
}

sub cylinders {
    my ($self) = @_;
    return $self->{cylinders};
}

sub heads {
    my ($self) = @_;
    return $self->{heads};
}

sub sectors {
    my ($self) = @_;
    return $self->{sectors};
}

sub sector_size {
    my ($self) = @_;
    return $self->{sector_size};
}

########################################################################
package Vdi::Header::HeaderMain::Flags;

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

    $self->{reserved0} = $self->{_io}->read_bits_int_be(15);
    $self->{zero_expand} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved1} = $self->{_io}->read_bits_int_be(6);
    $self->{diff} = $self->{_io}->read_bits_int_be(1);
    $self->{fixed} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved2} = $self->{_io}->read_bits_int_be(8);
}

sub reserved0 {
    my ($self) = @_;
    return $self->{reserved0};
}

sub zero_expand {
    my ($self) = @_;
    return $self->{zero_expand};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub diff {
    my ($self) = @_;
    return $self->{diff};
}

sub fixed {
    my ($self) = @_;
    return $self->{fixed};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

########################################################################
package Vdi::BlocksMap;

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

    $self->{index} = ();
    my $n_index = $self->_root()->header()->header_main()->blocks_in_image();
    for (my $i = 0; $i < $n_index; $i++) {
        $self->{index}[$i] = Vdi::BlocksMap::BlockIndex->new($self->{_io}, $self, $self->{_root});
    }
}

sub index {
    my ($self) = @_;
    return $self->{index};
}

########################################################################
package Vdi::BlocksMap::BlockIndex;

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

    $self->{index} = $self->{_io}->read_u4le();
}

sub is_allocated {
    my ($self) = @_;
    return $self->{is_allocated} if ($self->{is_allocated});
    $self->{is_allocated} = $self->index() < $self->_root()->block_discarded();
    return $self->{is_allocated};
}

sub block {
    my ($self) = @_;
    return $self->{block} if ($self->{block});
    if ($self->is_allocated()) {
        $self->{block} = @{$self->_root()->disk()->blocks()}[$self->index()];
    }
    return $self->{block};
}

sub index {
    my ($self) = @_;
    return $self->{index};
}

########################################################################
package Vdi::Disk;

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

    $self->{blocks} = ();
    my $n_blocks = $self->_root()->header()->header_main()->blocks_in_image();
    for (my $i = 0; $i < $n_blocks; $i++) {
        $self->{blocks}[$i] = Vdi::Disk::Block->new($self->{_io}, $self, $self->{_root});
    }
}

sub blocks {
    my ($self) = @_;
    return $self->{blocks};
}

########################################################################
package Vdi::Disk::Block;

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

    $self->{metadata} = $self->{_io}->read_bytes($self->_root()->header()->header_main()->block_metadata_size());
    $self->{_raw_data} = ();
    $self->{data} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{_raw_data}}, $self->{_io}->read_bytes($self->_root()->header()->header_main()->block_data_size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data}[-1]);
        push @{$self->{data}}, Vdi::Disk::Block::Sector->new($io__raw_data, $self, $self->{_root});
    }
}

sub metadata {
    my ($self) = @_;
    return $self->{metadata};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub _raw_data {
    my ($self) = @_;
    return $self->{_raw_data};
}

########################################################################
package Vdi::Disk::Block::Sector;

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

    $self->{data} = $self->{_io}->read_bytes($self->_root()->header()->header_main()->geometry()->sector_size());
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

1;
