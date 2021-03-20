# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;
use Compress::Zlib;

########################################################################
package Png;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $PHYS_UNIT_UNKNOWN = 0;
our $PHYS_UNIT_METER = 1;

our $BLEND_OP_VALUES_SOURCE = 0;
our $BLEND_OP_VALUES_OVER = 1;

our $COMPRESSION_METHODS_ZLIB = 0;

our $DISPOSE_OP_VALUES_NONE = 0;
our $DISPOSE_OP_VALUES_BACKGROUND = 1;
our $DISPOSE_OP_VALUES_PREVIOUS = 2;

our $COLOR_TYPE_GREYSCALE = 0;
our $COLOR_TYPE_TRUECOLOR = 2;
our $COLOR_TYPE_INDEXED = 3;
our $COLOR_TYPE_GREYSCALE_ALPHA = 4;
our $COLOR_TYPE_TRUECOLOR_ALPHA = 6;

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

    $self->{magic} = $self->{_io}->read_bytes(8);
    $self->{ihdr_len} = $self->{_io}->read_u4be();
    $self->{ihdr_type} = $self->{_io}->read_bytes(4);
    $self->{ihdr} = Png::IhdrChunk->new($self->{_io}, $self, $self->{_root});
    $self->{ihdr_crc} = $self->{_io}->read_bytes(4);
    $self->{chunks} = ();
    do {
        $_ = Png::Chunk->new($self->{_io}, $self, $self->{_root});
        push @{$self->{chunks}}, $_;
    } until ( (($_->type() eq "IEND") || ($self->_io()->is_eof())) );
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub ihdr_len {
    my ($self) = @_;
    return $self->{ihdr_len};
}

sub ihdr_type {
    my ($self) = @_;
    return $self->{ihdr_type};
}

sub ihdr {
    my ($self) = @_;
    return $self->{ihdr};
}

sub ihdr_crc {
    my ($self) = @_;
    return $self->{ihdr_crc};
}

sub chunks {
    my ($self) = @_;
    return $self->{chunks};
}

########################################################################
package Png::Rgb;

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

    $self->{r} = $self->{_io}->read_u1();
    $self->{g} = $self->{_io}->read_u1();
    $self->{b} = $self->{_io}->read_u1();
}

sub r {
    my ($self) = @_;
    return $self->{r};
}

sub g {
    my ($self) = @_;
    return $self->{g};
}

sub b {
    my ($self) = @_;
    return $self->{b};
}

########################################################################
package Png::Chunk;

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

    $self->{len} = $self->{_io}->read_u4be();
    $self->{type} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    my $_on = $self->type();
    if ($_on eq "iTXt") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Png::InternationalTextChunk->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "gAMA") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Png::GamaChunk->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "tIME") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Png::TimeChunk->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "PLTE") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Png::PlteChunk->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "bKGD") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Png::BkgdChunk->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "pHYs") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Png::PhysChunk->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "fdAT") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Png::FrameDataChunk->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "tEXt") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Png::TextChunk->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "cHRM") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Png::ChrmChunk->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "acTL") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Png::AnimationControlChunk->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "sRGB") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Png::SrgbChunk->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "zTXt") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Png::CompressedTextChunk->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on eq "fcTL") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Png::FrameControlChunk->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->len());
    }
    $self->{crc} = $self->{_io}->read_bytes(4);
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub crc {
    my ($self) = @_;
    return $self->{crc};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package Png::BkgdIndexed;

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

    $self->{palette_index} = $self->{_io}->read_u1();
}

sub palette_index {
    my ($self) = @_;
    return $self->{palette_index};
}

########################################################################
package Png::Point;

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

    $self->{x_int} = $self->{_io}->read_u4be();
    $self->{y_int} = $self->{_io}->read_u4be();
}

sub x {
    my ($self) = @_;
    return $self->{x} if ($self->{x});
    $self->{x} = ($self->x_int() / 100000.0);
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y} if ($self->{y});
    $self->{y} = ($self->y_int() / 100000.0);
    return $self->{y};
}

sub x_int {
    my ($self) = @_;
    return $self->{x_int};
}

sub y_int {
    my ($self) = @_;
    return $self->{y_int};
}

########################################################################
package Png::BkgdGreyscale;

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

    $self->{value} = $self->{_io}->read_u2be();
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package Png::ChrmChunk;

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

    $self->{white_point} = Png::Point->new($self->{_io}, $self, $self->{_root});
    $self->{red} = Png::Point->new($self->{_io}, $self, $self->{_root});
    $self->{green} = Png::Point->new($self->{_io}, $self, $self->{_root});
    $self->{blue} = Png::Point->new($self->{_io}, $self, $self->{_root});
}

sub white_point {
    my ($self) = @_;
    return $self->{white_point};
}

sub red {
    my ($self) = @_;
    return $self->{red};
}

sub green {
    my ($self) = @_;
    return $self->{green};
}

sub blue {
    my ($self) = @_;
    return $self->{blue};
}

########################################################################
package Png::IhdrChunk;

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

    $self->{width} = $self->{_io}->read_u4be();
    $self->{height} = $self->{_io}->read_u4be();
    $self->{bit_depth} = $self->{_io}->read_u1();
    $self->{color_type} = $self->{_io}->read_u1();
    $self->{compression_method} = $self->{_io}->read_u1();
    $self->{filter_method} = $self->{_io}->read_u1();
    $self->{interlace_method} = $self->{_io}->read_u1();
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub bit_depth {
    my ($self) = @_;
    return $self->{bit_depth};
}

sub color_type {
    my ($self) = @_;
    return $self->{color_type};
}

sub compression_method {
    my ($self) = @_;
    return $self->{compression_method};
}

sub filter_method {
    my ($self) = @_;
    return $self->{filter_method};
}

sub interlace_method {
    my ($self) = @_;
    return $self->{interlace_method};
}

########################################################################
package Png::PlteChunk;

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

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Png::Rgb->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Png::SrgbChunk;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $INTENT_PERCEPTUAL = 0;
our $INTENT_RELATIVE_COLORIMETRIC = 1;
our $INTENT_SATURATION = 2;
our $INTENT_ABSOLUTE_COLORIMETRIC = 3;

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

    $self->{render_intent} = $self->{_io}->read_u1();
}

sub render_intent {
    my ($self) = @_;
    return $self->{render_intent};
}

########################################################################
package Png::CompressedTextChunk;

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

    $self->{keyword} = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    $self->{compression_method} = $self->{_io}->read_u1();
    $self->{_raw_text_datastream} = $self->{_io}->read_bytes_full();
    $self->{text_datastream} = Compress::Zlib::uncompress($self->{_raw_text_datastream});
}

sub keyword {
    my ($self) = @_;
    return $self->{keyword};
}

sub compression_method {
    my ($self) = @_;
    return $self->{compression_method};
}

sub text_datastream {
    my ($self) = @_;
    return $self->{text_datastream};
}

sub _raw_text_datastream {
    my ($self) = @_;
    return $self->{_raw_text_datastream};
}

########################################################################
package Png::FrameDataChunk;

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

    $self->{sequence_number} = $self->{_io}->read_u4be();
    $self->{frame_data} = $self->{_io}->read_bytes_full();
}

sub sequence_number {
    my ($self) = @_;
    return $self->{sequence_number};
}

sub frame_data {
    my ($self) = @_;
    return $self->{frame_data};
}

########################################################################
package Png::BkgdTruecolor;

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

    $self->{red} = $self->{_io}->read_u2be();
    $self->{green} = $self->{_io}->read_u2be();
    $self->{blue} = $self->{_io}->read_u2be();
}

sub red {
    my ($self) = @_;
    return $self->{red};
}

sub green {
    my ($self) = @_;
    return $self->{green};
}

sub blue {
    my ($self) = @_;
    return $self->{blue};
}

########################################################################
package Png::GamaChunk;

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

    $self->{gamma_int} = $self->{_io}->read_u4be();
}

sub gamma_ratio {
    my ($self) = @_;
    return $self->{gamma_ratio} if ($self->{gamma_ratio});
    $self->{gamma_ratio} = (100000.0 / $self->gamma_int());
    return $self->{gamma_ratio};
}

sub gamma_int {
    my ($self) = @_;
    return $self->{gamma_int};
}

########################################################################
package Png::BkgdChunk;

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

    my $_on = $self->_root()->ihdr()->color_type();
    if ($_on == $Png::COLOR_TYPE_INDEXED) {
        $self->{bkgd} = Png::BkgdIndexed->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Png::COLOR_TYPE_TRUECOLOR_ALPHA) {
        $self->{bkgd} = Png::BkgdTruecolor->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Png::COLOR_TYPE_GREYSCALE_ALPHA) {
        $self->{bkgd} = Png::BkgdGreyscale->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Png::COLOR_TYPE_TRUECOLOR) {
        $self->{bkgd} = Png::BkgdTruecolor->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Png::COLOR_TYPE_GREYSCALE) {
        $self->{bkgd} = Png::BkgdGreyscale->new($self->{_io}, $self, $self->{_root});
    }
}

sub bkgd {
    my ($self) = @_;
    return $self->{bkgd};
}

########################################################################
package Png::PhysChunk;

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

    $self->{pixels_per_unit_x} = $self->{_io}->read_u4be();
    $self->{pixels_per_unit_y} = $self->{_io}->read_u4be();
    $self->{unit} = $self->{_io}->read_u1();
}

sub pixels_per_unit_x {
    my ($self) = @_;
    return $self->{pixels_per_unit_x};
}

sub pixels_per_unit_y {
    my ($self) = @_;
    return $self->{pixels_per_unit_y};
}

sub unit {
    my ($self) = @_;
    return $self->{unit};
}

########################################################################
package Png::FrameControlChunk;

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

    $self->{sequence_number} = $self->{_io}->read_u4be();
    $self->{width} = $self->{_io}->read_u4be();
    $self->{height} = $self->{_io}->read_u4be();
    $self->{x_offset} = $self->{_io}->read_u4be();
    $self->{y_offset} = $self->{_io}->read_u4be();
    $self->{delay_num} = $self->{_io}->read_u2be();
    $self->{delay_den} = $self->{_io}->read_u2be();
    $self->{dispose_op} = $self->{_io}->read_u1();
    $self->{blend_op} = $self->{_io}->read_u1();
}

sub delay {
    my ($self) = @_;
    return $self->{delay} if ($self->{delay});
    $self->{delay} = ($self->delay_num() / ($self->delay_den() == 0 ? 100.0 : $self->delay_den()));
    return $self->{delay};
}

sub sequence_number {
    my ($self) = @_;
    return $self->{sequence_number};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub x_offset {
    my ($self) = @_;
    return $self->{x_offset};
}

sub y_offset {
    my ($self) = @_;
    return $self->{y_offset};
}

sub delay_num {
    my ($self) = @_;
    return $self->{delay_num};
}

sub delay_den {
    my ($self) = @_;
    return $self->{delay_den};
}

sub dispose_op {
    my ($self) = @_;
    return $self->{dispose_op};
}

sub blend_op {
    my ($self) = @_;
    return $self->{blend_op};
}

########################################################################
package Png::InternationalTextChunk;

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

    $self->{keyword} = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    $self->{compression_flag} = $self->{_io}->read_u1();
    $self->{compression_method} = $self->{_io}->read_u1();
    $self->{language_tag} = Encode::decode("ASCII", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    $self->{translated_keyword} = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    $self->{text} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
}

sub keyword {
    my ($self) = @_;
    return $self->{keyword};
}

sub compression_flag {
    my ($self) = @_;
    return $self->{compression_flag};
}

sub compression_method {
    my ($self) = @_;
    return $self->{compression_method};
}

sub language_tag {
    my ($self) = @_;
    return $self->{language_tag};
}

sub translated_keyword {
    my ($self) = @_;
    return $self->{translated_keyword};
}

sub text {
    my ($self) = @_;
    return $self->{text};
}

########################################################################
package Png::TextChunk;

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

    $self->{keyword} = Encode::decode("iso8859-1", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    $self->{text} = Encode::decode("iso8859-1", $self->{_io}->read_bytes_full());
}

sub keyword {
    my ($self) = @_;
    return $self->{keyword};
}

sub text {
    my ($self) = @_;
    return $self->{text};
}

########################################################################
package Png::AnimationControlChunk;

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

    $self->{num_frames} = $self->{_io}->read_u4be();
    $self->{num_plays} = $self->{_io}->read_u4be();
}

sub num_frames {
    my ($self) = @_;
    return $self->{num_frames};
}

sub num_plays {
    my ($self) = @_;
    return $self->{num_plays};
}

########################################################################
package Png::TimeChunk;

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

    $self->{year} = $self->{_io}->read_u2be();
    $self->{month} = $self->{_io}->read_u1();
    $self->{day} = $self->{_io}->read_u1();
    $self->{hour} = $self->{_io}->read_u1();
    $self->{minute} = $self->{_io}->read_u1();
    $self->{second} = $self->{_io}->read_u1();
}

sub year {
    my ($self) = @_;
    return $self->{year};
}

sub month {
    my ($self) = @_;
    return $self->{month};
}

sub day {
    my ($self) = @_;
    return $self->{day};
}

sub hour {
    my ($self) = @_;
    return $self->{hour};
}

sub minute {
    my ($self) = @_;
    return $self->{minute};
}

sub second {
    my ($self) = @_;
    return $self->{second};
}

1;
