# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Au;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $ENCODINGS_MULAW_8 = 1;
our $ENCODINGS_LINEAR_8 = 2;
our $ENCODINGS_LINEAR_16 = 3;
our $ENCODINGS_LINEAR_24 = 4;
our $ENCODINGS_LINEAR_32 = 5;
our $ENCODINGS_FLOAT = 6;
our $ENCODINGS_DOUBLE = 7;
our $ENCODINGS_FRAGMENTED = 8;
our $ENCODINGS_NESTED = 9;
our $ENCODINGS_DSP_CORE = 10;
our $ENCODINGS_FIXED_POINT_8 = 11;
our $ENCODINGS_FIXED_POINT_16 = 12;
our $ENCODINGS_FIXED_POINT_24 = 13;
our $ENCODINGS_FIXED_POINT_32 = 14;
our $ENCODINGS_DISPLAY = 16;
our $ENCODINGS_MULAW_SQUELCH = 17;
our $ENCODINGS_EMPHASIZED = 18;
our $ENCODINGS_COMPRESSED = 19;
our $ENCODINGS_COMPRESSED_EMPHASIZED = 20;
our $ENCODINGS_DSP_COMMANDS = 21;
our $ENCODINGS_DSP_COMMANDS_SAMPLES = 22;
our $ENCODINGS_ADPCM_G721 = 23;
our $ENCODINGS_ADPCM_G722 = 24;
our $ENCODINGS_ADPCM_G723_3 = 25;
our $ENCODINGS_ADPCM_G723_5 = 26;
our $ENCODINGS_ALAW_8 = 27;
our $ENCODINGS_AES = 28;
our $ENCODINGS_DELTA_MULAW_8 = 29;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{ofs_data} = $self->{_io}->read_u4be();
    $self->{_raw_header} = $self->{_io}->read_bytes(($self->ofs_data() - 4) - 4);
    my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
    $self->{header} = Au::Header->new($io__raw_header, $self, $self->{_root});
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data} if ($self->{len_data});
    $self->{len_data} = ($self->header()->data_size() == 4294967295 ? $self->_io()->size() - $self->ofs_data() : $self->header()->data_size());
    return $self->{len_data};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub ofs_data {
    my ($self) = @_;
    return $self->{ofs_data};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub _raw_header {
    my ($self) = @_;
    return $self->{_raw_header};
}

########################################################################
package Au::Header;

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

    $self->{data_size} = $self->{_io}->read_u4be();
    $self->{encoding} = $self->{_io}->read_u4be();
    $self->{sample_rate} = $self->{_io}->read_u4be();
    $self->{num_channels} = $self->{_io}->read_u4be();
    $self->{comment} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes_full(), 0, 0));
}

sub data_size {
    my ($self) = @_;
    return $self->{data_size};
}

sub encoding {
    my ($self) = @_;
    return $self->{encoding};
}

sub sample_rate {
    my ($self) = @_;
    return $self->{sample_rate};
}

sub num_channels {
    my ($self) = @_;
    return $self->{num_channels};
}

sub comment {
    my ($self) = @_;
    return $self->{comment};
}

1;
