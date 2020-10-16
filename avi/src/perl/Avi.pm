# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package Avi;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CHUNK_TYPE_IDX1 = 829973609;
our $CHUNK_TYPE_JUNK = 1263424842;
our $CHUNK_TYPE_INFO = 1330007625;
our $CHUNK_TYPE_ISFT = 1413894985;
our $CHUNK_TYPE_LIST = 1414744396;
our $CHUNK_TYPE_STRF = 1718776947;
our $CHUNK_TYPE_AVIH = 1751742049;
our $CHUNK_TYPE_STRH = 1752331379;
our $CHUNK_TYPE_MOVI = 1769369453;
our $CHUNK_TYPE_HDRL = 1819436136;
our $CHUNK_TYPE_STRL = 1819440243;

our $STREAM_TYPE_MIDS = 1935960429;
our $STREAM_TYPE_VIDS = 1935960438;
our $STREAM_TYPE_AUDS = 1935963489;
our $STREAM_TYPE_TXTS = 1937012852;

our $HANDLER_TYPE_MP3 = 85;
our $HANDLER_TYPE_AC3 = 8192;
our $HANDLER_TYPE_DTS = 8193;
our $HANDLER_TYPE_CVID = 1684633187;
our $HANDLER_TYPE_XVID = 1684633208;

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

    $self->{magic1} = $self->{_io}->read_bytes(4);
    $self->{file_size} = $self->{_io}->read_u4le();
    $self->{magic2} = $self->{_io}->read_bytes(4);
    $self->{_raw_data} = $self->{_io}->read_bytes(($self->file_size() - 4));
    my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
    $self->{data} = Avi::Blocks->new($io__raw_data, $self, $self->{_root});
}

sub magic1 {
    my ($self) = @_;
    return $self->{magic1};
}

sub file_size {
    my ($self) = @_;
    return $self->{file_size};
}

sub magic2 {
    my ($self) = @_;
    return $self->{magic2};
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
package Avi::ListBody;

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

    $self->{list_type} = $self->{_io}->read_u4le();
    $self->{data} = Avi::Blocks->new($self->{_io}, $self, $self->{_root});
}

sub list_type {
    my ($self) = @_;
    return $self->{list_type};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Avi::Rect;

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

    $self->{left} = $self->{_io}->read_s2le();
    $self->{top} = $self->{_io}->read_s2le();
    $self->{right} = $self->{_io}->read_s2le();
    $self->{bottom} = $self->{_io}->read_s2le();
}

sub left {
    my ($self) = @_;
    return $self->{left};
}

sub top {
    my ($self) = @_;
    return $self->{top};
}

sub right {
    my ($self) = @_;
    return $self->{right};
}

sub bottom {
    my ($self) = @_;
    return $self->{bottom};
}

########################################################################
package Avi::Blocks;

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
        push @{$self->{entries}}, Avi::Block->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Avi::AvihBody;

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

    $self->{micro_sec_per_frame} = $self->{_io}->read_u4le();
    $self->{max_bytes_per_sec} = $self->{_io}->read_u4le();
    $self->{padding_granularity} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u4le();
    $self->{total_frames} = $self->{_io}->read_u4le();
    $self->{initial_frames} = $self->{_io}->read_u4le();
    $self->{streams} = $self->{_io}->read_u4le();
    $self->{suggested_buffer_size} = $self->{_io}->read_u4le();
    $self->{width} = $self->{_io}->read_u4le();
    $self->{height} = $self->{_io}->read_u4le();
    $self->{reserved} = $self->{_io}->read_bytes(16);
}

sub micro_sec_per_frame {
    my ($self) = @_;
    return $self->{micro_sec_per_frame};
}

sub max_bytes_per_sec {
    my ($self) = @_;
    return $self->{max_bytes_per_sec};
}

sub padding_granularity {
    my ($self) = @_;
    return $self->{padding_granularity};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub total_frames {
    my ($self) = @_;
    return $self->{total_frames};
}

sub initial_frames {
    my ($self) = @_;
    return $self->{initial_frames};
}

sub streams {
    my ($self) = @_;
    return $self->{streams};
}

sub suggested_buffer_size {
    my ($self) = @_;
    return $self->{suggested_buffer_size};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package Avi::Block;

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

    $self->{four_cc} = $self->{_io}->read_u4le();
    $self->{block_size} = $self->{_io}->read_u4le();
    my $_on = $self->four_cc();
    if ($_on == $Avi::CHUNK_TYPE_LIST) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->block_size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Avi::ListBody->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == $Avi::CHUNK_TYPE_AVIH) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->block_size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Avi::AvihBody->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == $Avi::CHUNK_TYPE_STRH) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->block_size());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Avi::StrhBody->new($io__raw_data, $self, $self->{_root});
    }
    else {
        $self->{data} = $self->{_io}->read_bytes($self->block_size());
    }
}

sub four_cc {
    my ($self) = @_;
    return $self->{four_cc};
}

sub block_size {
    my ($self) = @_;
    return $self->{block_size};
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
package Avi::StrhBody;

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

    $self->{fcc_type} = $self->{_io}->read_u4le();
    $self->{fcc_handler} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u4le();
    $self->{priority} = $self->{_io}->read_u2le();
    $self->{language} = $self->{_io}->read_u2le();
    $self->{initial_frames} = $self->{_io}->read_u4le();
    $self->{scale} = $self->{_io}->read_u4le();
    $self->{rate} = $self->{_io}->read_u4le();
    $self->{start} = $self->{_io}->read_u4le();
    $self->{length} = $self->{_io}->read_u4le();
    $self->{suggested_buffer_size} = $self->{_io}->read_u4le();
    $self->{quality} = $self->{_io}->read_u4le();
    $self->{sample_size} = $self->{_io}->read_u4le();
    $self->{frame} = Avi::Rect->new($self->{_io}, $self, $self->{_root});
}

sub fcc_type {
    my ($self) = @_;
    return $self->{fcc_type};
}

sub fcc_handler {
    my ($self) = @_;
    return $self->{fcc_handler};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub priority {
    my ($self) = @_;
    return $self->{priority};
}

sub language {
    my ($self) = @_;
    return $self->{language};
}

sub initial_frames {
    my ($self) = @_;
    return $self->{initial_frames};
}

sub scale {
    my ($self) = @_;
    return $self->{scale};
}

sub rate {
    my ($self) = @_;
    return $self->{rate};
}

sub start {
    my ($self) = @_;
    return $self->{start};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub suggested_buffer_size {
    my ($self) = @_;
    return $self->{suggested_buffer_size};
}

sub quality {
    my ($self) = @_;
    return $self->{quality};
}

sub sample_size {
    my ($self) = @_;
    return $self->{sample_size};
}

sub frame {
    my ($self) = @_;
    return $self->{frame};
}

########################################################################
package Avi::StrfBody;

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

}

1;
