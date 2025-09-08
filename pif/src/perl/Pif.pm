# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;

########################################################################
package Pif;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COMPRESSION_TYPE_NONE = 0;
our $COMPRESSION_TYPE_RLE = 32222;

our $IMAGE_TYPE_RGB332 = 7763;
our $IMAGE_TYPE_RGB888 = 17212;
our $IMAGE_TYPE_INDEXED_RGB332 = 18754;
our $IMAGE_TYPE_INDEXED_RGB565 = 18759;
our $IMAGE_TYPE_INDEXED_RGB888 = 18770;
our $IMAGE_TYPE_BLACK_WHITE = 32170;
our $IMAGE_TYPE_RGB16C = 47253;
our $IMAGE_TYPE_RGB565 = 58821;

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

    $self->{file_header} = Pif::PifHeader->new($self->{_io}, $self, $self->{_root});
    $self->{info_header} = Pif::InformationHeader->new($self->{_io}, $self, $self->{_root});
    if ($self->info_header()->uses_indexed_mode()) {
        $self->{_raw_color_table} = $self->{_io}->read_bytes($self->info_header()->len_color_table());
        my $io__raw_color_table = IO::KaitaiStruct::Stream->new($self->{_raw_color_table});
        $self->{color_table} = Pif::ColorTableData->new($io__raw_color_table, $self, $self->{_root});
    }
}

sub image_data {
    my ($self) = @_;
    return $self->{image_data} if ($self->{image_data});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->file_header()->ofs_image_data());
    $self->{image_data} = $self->{_io}->read_bytes($self->info_header()->len_image_data());
    $self->{_io}->seek($_pos);
    return $self->{image_data};
}

sub file_header {
    my ($self) = @_;
    return $self->{file_header};
}

sub info_header {
    my ($self) = @_;
    return $self->{info_header};
}

sub color_table {
    my ($self) = @_;
    return $self->{color_table};
}

sub _raw_color_table {
    my ($self) = @_;
    return $self->{_raw_color_table};
}

########################################################################
package Pif::ColorTableData;

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

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        my $_on = $self->_root()->info_header()->image_type();
        if ($_on == $Pif::IMAGE_TYPE_INDEXED_RGB332) {
            push @{$self->{entries}}, $self->{_io}->read_bits_int_le(8);
        }
        elsif ($_on == $Pif::IMAGE_TYPE_INDEXED_RGB565) {
            push @{$self->{entries}}, $self->{_io}->read_bits_int_le(16);
        }
        elsif ($_on == $Pif::IMAGE_TYPE_INDEXED_RGB888) {
            push @{$self->{entries}}, $self->{_io}->read_bits_int_le(24);
        }
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Pif::InformationHeader;

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

    $self->{image_type} = $self->{_io}->read_u2le();
    $self->{bits_per_pixel} = $self->{_io}->read_u2le();
    {
        my $_it = $self->{bits_per_pixel};
    }
    $self->{width} = $self->{_io}->read_u2le();
    $self->{height} = $self->{_io}->read_u2le();
    $self->{len_image_data} = $self->{_io}->read_u4le();
    $self->{len_color_table} = $self->{_io}->read_u2le();
    $self->{compression} = $self->{_io}->read_u2le();
}

sub len_color_table_entry {
    my ($self) = @_;
    return $self->{len_color_table_entry} if ($self->{len_color_table_entry});
    $self->{len_color_table_entry} = ($self->image_type() == $Pif::IMAGE_TYPE_INDEXED_RGB888 ? 3 : ($self->image_type() == $Pif::IMAGE_TYPE_INDEXED_RGB565 ? 2 : ($self->image_type() == $Pif::IMAGE_TYPE_INDEXED_RGB332 ? 1 : 0)));
    return $self->{len_color_table_entry};
}

sub len_color_table_full {
    my ($self) = @_;
    return $self->{len_color_table_full} if ($self->{len_color_table_full});
    $self->{len_color_table_full} = $self->len_color_table_entry() * (1 << $self->bits_per_pixel());
    return $self->{len_color_table_full};
}

sub len_color_table_max {
    my ($self) = @_;
    return $self->{len_color_table_max} if ($self->{len_color_table_max});
    $self->{len_color_table_max} = $self->_root()->file_header()->ofs_image_data() - $self->_root()->file_header()->ofs_image_data_min();
    return $self->{len_color_table_max};
}

sub uses_indexed_mode {
    my ($self) = @_;
    return $self->{uses_indexed_mode} if ($self->{uses_indexed_mode});
    $self->{uses_indexed_mode} = $self->len_color_table_entry() != 0;
    return $self->{uses_indexed_mode};
}

sub image_type {
    my ($self) = @_;
    return $self->{image_type};
}

sub bits_per_pixel {
    my ($self) = @_;
    return $self->{bits_per_pixel};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub len_image_data {
    my ($self) = @_;
    return $self->{len_image_data};
}

sub len_color_table {
    my ($self) = @_;
    return $self->{len_color_table};
}

sub compression {
    my ($self) = @_;
    return $self->{compression};
}

########################################################################
package Pif::PifHeader;

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
    $self->{len_file} = $self->{_io}->read_u4le();
    $self->{ofs_image_data} = $self->{_io}->read_u4le();
}

sub ofs_image_data_min {
    my ($self) = @_;
    return $self->{ofs_image_data_min} if ($self->{ofs_image_data_min});
    $self->{ofs_image_data_min} = 12 + 16;
    return $self->{ofs_image_data_min};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub len_file {
    my ($self) = @_;
    return $self->{len_file};
}

sub ofs_image_data {
    my ($self) = @_;
    return $self->{ofs_image_data};
}

1;
