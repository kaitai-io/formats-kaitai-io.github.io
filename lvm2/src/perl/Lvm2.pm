# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Lvm2;

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

    $self->{pv} = Lvm2::PhysicalVolume->new($self->{_io}, $self, $self->{_root});
}

sub sector_size {
    my ($self) = @_;
    return $self->{sector_size} if ($self->{sector_size});
    $self->{sector_size} = 512;
    return $self->{sector_size};
}

sub pv {
    my ($self) = @_;
    return $self->{pv};
}

########################################################################
package Lvm2::PhysicalVolume;

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

    $self->{empty_sector} = $self->{_io}->read_bytes($self->_root()->sector_size());
    $self->{label} = Lvm2::PhysicalVolume::Label->new($self->{_io}, $self, $self->{_root});
}

sub empty_sector {
    my ($self) = @_;
    return $self->{empty_sector};
}

sub label {
    my ($self) = @_;
    return $self->{label};
}

########################################################################
package Lvm2::PhysicalVolume::Label;

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

    $self->{label_header} = Lvm2::PhysicalVolume::Label::LabelHeader->new($self->{_io}, $self, $self->{_root});
    $self->{volume_header} = Lvm2::PhysicalVolume::Label::VolumeHeader->new($self->{_io}, $self, $self->{_root});
}

sub label_header {
    my ($self) = @_;
    return $self->{label_header};
}

sub volume_header {
    my ($self) = @_;
    return $self->{volume_header};
}

########################################################################
package Lvm2::PhysicalVolume::Label::LabelHeader;

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

    $self->{signature} = $self->{_io}->read_bytes(8);
    $self->{sector_number} = $self->{_io}->read_u8le();
    $self->{checksum} = $self->{_io}->read_u4le();
    $self->{label_header_} = Lvm2::PhysicalVolume::Label::LabelHeader::LabelHeader->new($self->{_io}, $self, $self->{_root});
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub sector_number {
    my ($self) = @_;
    return $self->{sector_number};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

sub label_header_ {
    my ($self) = @_;
    return $self->{label_header_};
}

########################################################################
package Lvm2::PhysicalVolume::Label::LabelHeader::LabelHeader;

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

    $self->{data_offset} = $self->{_io}->read_u4le();
    $self->{type_indicator} = $self->{_io}->read_bytes(8);
}

sub data_offset {
    my ($self) = @_;
    return $self->{data_offset};
}

sub type_indicator {
    my ($self) = @_;
    return $self->{type_indicator};
}

########################################################################
package Lvm2::PhysicalVolume::Label::VolumeHeader;

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

    $self->{id} = Encode::decode("ASCII", $self->{_io}->read_bytes(32));
    $self->{size} = $self->{_io}->read_u8le();
    $self->{data_area_descriptors} = [];
    {
        my $_it;
        do {
            $_it = Lvm2::PhysicalVolume::Label::VolumeHeader::DataAreaDescriptor->new($self->{_io}, $self, $self->{_root});
            push @{$self->{data_area_descriptors}}, $_it;
        } until ( (($_it->size() != 0) && ($_it->offset() != 0)) );
    }
    $self->{metadata_area_descriptors} = [];
    {
        my $_it;
        do {
            $_it = Lvm2::PhysicalVolume::Label::VolumeHeader::MetadataAreaDescriptor->new($self->{_io}, $self, $self->{_root});
            push @{$self->{metadata_area_descriptors}}, $_it;
        } until ( (($_it->size() != 0) && ($_it->offset() != 0)) );
    }
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub data_area_descriptors {
    my ($self) = @_;
    return $self->{data_area_descriptors};
}

sub metadata_area_descriptors {
    my ($self) = @_;
    return $self->{metadata_area_descriptors};
}

########################################################################
package Lvm2::PhysicalVolume::Label::VolumeHeader::DataAreaDescriptor;

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

    $self->{offset} = $self->{_io}->read_u8le();
    $self->{size} = $self->{_io}->read_u8le();
}

sub data {
    my ($self) = @_;
    return $self->{data} if ($self->{data});
    if ($self->size() != 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->offset());
        $self->{data} = Encode::decode("ASCII", $self->{_io}->read_bytes($self->size()));
        $self->{_io}->seek($_pos);
    }
    return $self->{data};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

########################################################################
package Lvm2::PhysicalVolume::Label::VolumeHeader::MetadataArea;

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

    $self->{header} = Lvm2::PhysicalVolume::Label::VolumeHeader::MetadataArea::MetadataAreaHeader->new($self->{_io}, $self, $self->{_root});
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

########################################################################
package Lvm2::PhysicalVolume::Label::VolumeHeader::MetadataArea::MetadataAreaHeader;

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

    $self->{checksum} = Lvm2::PhysicalVolume::Label::VolumeHeader::MetadataArea::MetadataAreaHeader->new($self->{_io}, $self, $self->{_root});
    $self->{signature} = $self->{_io}->read_bytes(16);
    $self->{version} = $self->{_io}->read_u4le();
    $self->{metadata_area_offset} = $self->{_io}->read_u8le();
    $self->{metadata_area_size} = $self->{_io}->read_u8le();
    $self->{raw_location_descriptors} = [];
    {
        my $_it;
        do {
            $_it = Lvm2::PhysicalVolume::Label::VolumeHeader::MetadataArea::MetadataAreaHeader::RawLocationDescriptor->new($self->{_io}, $self, $self->{_root});
            push @{$self->{raw_location_descriptors}}, $_it;
        } until ( (($_it->offset() != 0) && ($_it->size() != 0) && ($_it->checksum() != 0)) );
    }
}

sub metadata {
    my ($self) = @_;
    return $self->{metadata} if ($self->{metadata});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->metadata_area_offset());
    $self->{metadata} = $self->{_io}->read_bytes($self->metadata_area_size());
    $self->{_io}->seek($_pos);
    return $self->{metadata};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub metadata_area_offset {
    my ($self) = @_;
    return $self->{metadata_area_offset};
}

sub metadata_area_size {
    my ($self) = @_;
    return $self->{metadata_area_size};
}

sub raw_location_descriptors {
    my ($self) = @_;
    return $self->{raw_location_descriptors};
}

########################################################################
package Lvm2::PhysicalVolume::Label::VolumeHeader::MetadataArea::MetadataAreaHeader::RawLocationDescriptor;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $RAW_LOCATION_DESCRIPTOR_FLAGS_RAW_LOCATION_IGNORED = 1;

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

    $self->{offset} = $self->{_io}->read_u8le();
    $self->{size} = $self->{_io}->read_u8le();
    $self->{checksum} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u4le();
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

########################################################################
package Lvm2::PhysicalVolume::Label::VolumeHeader::MetadataAreaDescriptor;

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

    $self->{offset} = $self->{_io}->read_u8le();
    $self->{size} = $self->{_io}->read_u8le();
}

sub data {
    my ($self) = @_;
    return $self->{data} if ($self->{data});
    if ($self->size() != 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->offset());
        $self->{_raw_data} = $self->{_io}->read_bytes($self->size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Lvm2::PhysicalVolume::Label::VolumeHeader::MetadataArea->new($io__raw_data, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{data};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub _raw_data {
    my ($self) = @_;
    return $self->{_raw_data};
}

1;
