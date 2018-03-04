# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package Wav;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $W_FORMAT_TAG_TYPE_UNKNOWN = 0;
our $W_FORMAT_TAG_TYPE_PCM = 1;
our $W_FORMAT_TAG_TYPE_ADPCM = 2;
our $W_FORMAT_TAG_TYPE_IEEE_FLOAT = 3;
our $W_FORMAT_TAG_TYPE_ALAW = 6;
our $W_FORMAT_TAG_TYPE_MULAW = 7;
our $W_FORMAT_TAG_TYPE_DVI_ADPCM = 17;
our $W_FORMAT_TAG_TYPE_DOLBY_AC3_SPDIF = 146;
our $W_FORMAT_TAG_TYPE_EXTENSIBLE = 65534;
our $W_FORMAT_TAG_TYPE_DEVELOPMENT = 65535;

our $CHUNK_TYPE_FMT = 544501094;
our $CHUNK_TYPE_BEXT = 1650817140;
our $CHUNK_TYPE_CUE = 1668637984;
our $CHUNK_TYPE_DATA = 1684108385;
our $CHUNK_TYPE_MINF = 1835626086;
our $CHUNK_TYPE_REGN = 1919248238;
our $CHUNK_TYPE_UMID = 1970104676;

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

    $self->{riff_id} = $self->{_io}->ensure_fixed_contents(pack('C*', (82, 73, 70, 70)));
    $self->{file_size} = $self->{_io}->read_u4le();
    $self->{wave_id} = $self->{_io}->ensure_fixed_contents(pack('C*', (87, 65, 86, 69)));
    $self->{_raw_chunks} = $self->{_io}->read_bytes(($self->file_size() - 5));
    my $io__raw_chunks = IO::KaitaiStruct::Stream->new($self->{_raw_chunks});
    $self->{chunks} = Wav::ChunksType->new($io__raw_chunks, $self, $self->{_root});
}

sub format_chunk {
    my ($self) = @_;
    return $self->{format_chunk} if ($self->{format_chunk});
    $self->{format_chunk} = @{$self->chunks()->chunk()}[0]->data();
    return $self->{format_chunk};
}

sub riff_id {
    my ($self) = @_;
    return $self->{riff_id};
}

sub file_size {
    my ($self) = @_;
    return $self->{file_size};
}

sub wave_id {
    my ($self) = @_;
    return $self->{wave_id};
}

sub chunks {
    my ($self) = @_;
    return $self->{chunks};
}

sub _raw_chunks {
    my ($self) = @_;
    return $self->{_raw_chunks};
}

########################################################################
package Wav::SampleType;

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

    $self->{sample} = $self->{_io}->read_u2le();
}

sub sample {
    my ($self) = @_;
    return $self->{sample};
}

########################################################################
package Wav::FormatChunkType;

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

    $self->{w_format_tag} = $self->{_io}->read_u2le();
    $self->{n_channels} = $self->{_io}->read_u2le();
    $self->{n_samples_per_sec} = $self->{_io}->read_u4le();
    $self->{n_avg_bytes_per_sec} = $self->{_io}->read_u4le();
    $self->{n_block_align} = $self->{_io}->read_u2le();
    $self->{w_bits_per_sample} = $self->{_io}->read_u2le();
    if (!($self->is_basic_pcm())) {
        $self->{cb_size} = $self->{_io}->read_u2le();
    }
    if ($self->is_cb_size_meaningful()) {
        $self->{w_valid_bits_per_sample} = $self->{_io}->read_u2le();
    }
    if ($self->is_extensible()) {
        $self->{channel_mask_and_subformat} = Wav::ChannelMaskAndSubformatType->new($self->{_io}, $self, $self->{_root});
    }
}

sub is_extensible {
    my ($self) = @_;
    return $self->{is_extensible} if ($self->{is_extensible});
    $self->{is_extensible} = $self->w_format_tag() == $W_FORMAT_TAG_TYPE_EXTENSIBLE;
    return $self->{is_extensible};
}

sub is_basic_pcm {
    my ($self) = @_;
    return $self->{is_basic_pcm} if ($self->{is_basic_pcm});
    $self->{is_basic_pcm} = $self->w_format_tag() == $W_FORMAT_TAG_TYPE_PCM;
    return $self->{is_basic_pcm};
}

sub is_basic_float {
    my ($self) = @_;
    return $self->{is_basic_float} if ($self->{is_basic_float});
    $self->{is_basic_float} = $self->w_format_tag() == $W_FORMAT_TAG_TYPE_IEEE_FLOAT;
    return $self->{is_basic_float};
}

sub is_cb_size_meaningful {
    my ($self) = @_;
    return $self->{is_cb_size_meaningful} if ($self->{is_cb_size_meaningful});
    $self->{is_cb_size_meaningful} =  ((!($self->is_basic_pcm())) && ($self->cb_size() != 0)) ;
    return $self->{is_cb_size_meaningful};
}

sub w_format_tag {
    my ($self) = @_;
    return $self->{w_format_tag};
}

sub n_channels {
    my ($self) = @_;
    return $self->{n_channels};
}

sub n_samples_per_sec {
    my ($self) = @_;
    return $self->{n_samples_per_sec};
}

sub n_avg_bytes_per_sec {
    my ($self) = @_;
    return $self->{n_avg_bytes_per_sec};
}

sub n_block_align {
    my ($self) = @_;
    return $self->{n_block_align};
}

sub w_bits_per_sample {
    my ($self) = @_;
    return $self->{w_bits_per_sample};
}

sub cb_size {
    my ($self) = @_;
    return $self->{cb_size};
}

sub w_valid_bits_per_sample {
    my ($self) = @_;
    return $self->{w_valid_bits_per_sample};
}

sub channel_mask_and_subformat {
    my ($self) = @_;
    return $self->{channel_mask_and_subformat};
}

########################################################################
package Wav::GuidType;

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

    $self->{data1} = $self->{_io}->read_u4le();
    $self->{data2} = $self->{_io}->read_u2le();
    $self->{data3} = $self->{_io}->read_u2le();
    $self->{data4} = $self->{_io}->read_u4be();
    $self->{data4a} = $self->{_io}->read_u4be();
}

sub data1 {
    my ($self) = @_;
    return $self->{data1};
}

sub data2 {
    my ($self) = @_;
    return $self->{data2};
}

sub data3 {
    my ($self) = @_;
    return $self->{data3};
}

sub data4 {
    my ($self) = @_;
    return $self->{data4};
}

sub data4a {
    my ($self) = @_;
    return $self->{data4a};
}

########################################################################
package Wav::CuePointType;

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

    $self->{dw_name} = $self->{_io}->read_u4le();
    $self->{dw_position} = $self->{_io}->read_u4le();
    $self->{fcc_chunk} = $self->{_io}->read_u4le();
    $self->{dw_chunk_start} = $self->{_io}->read_u4le();
    $self->{dw_block_start} = $self->{_io}->read_u4le();
    $self->{dw_sample_offset} = $self->{_io}->read_u4le();
}

sub dw_name {
    my ($self) = @_;
    return $self->{dw_name};
}

sub dw_position {
    my ($self) = @_;
    return $self->{dw_position};
}

sub fcc_chunk {
    my ($self) = @_;
    return $self->{fcc_chunk};
}

sub dw_chunk_start {
    my ($self) = @_;
    return $self->{dw_chunk_start};
}

sub dw_block_start {
    my ($self) = @_;
    return $self->{dw_block_start};
}

sub dw_sample_offset {
    my ($self) = @_;
    return $self->{dw_sample_offset};
}

########################################################################
package Wav::DataChunkType;

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

    $self->{data} = $self->{_io}->read_bytes_full();
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Wav::SamplesType;

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

    $self->{samples} = $self->{_io}->read_u4le();
}

sub samples {
    my ($self) = @_;
    return $self->{samples};
}

########################################################################
package Wav::ChannelMaskAndSubformatType;

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

    $self->{dw_channel_mask} = Wav::ChannelMaskType->new($self->{_io}, $self, $self->{_root});
    $self->{subformat} = Wav::GuidType->new($self->{_io}, $self, $self->{_root});
}

sub dw_channel_mask {
    my ($self) = @_;
    return $self->{dw_channel_mask};
}

sub subformat {
    my ($self) = @_;
    return $self->{subformat};
}

########################################################################
package Wav::ChunksType;

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

    $self->{chunk} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{chunk}}, Wav::ChunkType->new($self->{_io}, $self, $self->{_root});
    }
}

sub chunk {
    my ($self) = @_;
    return $self->{chunk};
}

########################################################################
package Wav::CueChunkType;

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

    $self->{dw_cue_points} = $self->{_io}->read_u4le();
    if ($self->dw_cue_points() != 0) {
        $self->{cue_points} = ();
        my $n_cue_points = $self->dw_cue_points();
        for (my $i = 0; $i < $n_cue_points; $i++) {
            $self->{cue_points}[$i] = Wav::CuePointType->new($self->{_io}, $self, $self->{_root});
        }
    }
}

sub dw_cue_points {
    my ($self) = @_;
    return $self->{dw_cue_points};
}

sub cue_points {
    my ($self) = @_;
    return $self->{cue_points};
}

########################################################################
package Wav::ChannelMaskType;

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

    $self->{front_right_of_center} = $self->{_io}->read_bits_int(1);
    $self->{front_left_of_center} = $self->{_io}->read_bits_int(1);
    $self->{back_right} = $self->{_io}->read_bits_int(1);
    $self->{back_left} = $self->{_io}->read_bits_int(1);
    $self->{low_frequency} = $self->{_io}->read_bits_int(1);
    $self->{front_center} = $self->{_io}->read_bits_int(1);
    $self->{front_right} = $self->{_io}->read_bits_int(1);
    $self->{front_left} = $self->{_io}->read_bits_int(1);
    $self->{top_center} = $self->{_io}->read_bits_int(1);
    $self->{side_right} = $self->{_io}->read_bits_int(1);
    $self->{side_left} = $self->{_io}->read_bits_int(1);
    $self->{back_center} = $self->{_io}->read_bits_int(1);
    $self->{top_back_left} = $self->{_io}->read_bits_int(1);
    $self->{top_front_right} = $self->{_io}->read_bits_int(1);
    $self->{top_front_center} = $self->{_io}->read_bits_int(1);
    $self->{top_front_left} = $self->{_io}->read_bits_int(1);
    $self->{unused1} = $self->{_io}->read_bits_int(6);
    $self->{top_back_right} = $self->{_io}->read_bits_int(1);
    $self->{top_back_center} = $self->{_io}->read_bits_int(1);
    $self->{unused2} = $self->{_io}->read_bits_int(8);
}

sub front_right_of_center {
    my ($self) = @_;
    return $self->{front_right_of_center};
}

sub front_left_of_center {
    my ($self) = @_;
    return $self->{front_left_of_center};
}

sub back_right {
    my ($self) = @_;
    return $self->{back_right};
}

sub back_left {
    my ($self) = @_;
    return $self->{back_left};
}

sub low_frequency {
    my ($self) = @_;
    return $self->{low_frequency};
}

sub front_center {
    my ($self) = @_;
    return $self->{front_center};
}

sub front_right {
    my ($self) = @_;
    return $self->{front_right};
}

sub front_left {
    my ($self) = @_;
    return $self->{front_left};
}

sub top_center {
    my ($self) = @_;
    return $self->{top_center};
}

sub side_right {
    my ($self) = @_;
    return $self->{side_right};
}

sub side_left {
    my ($self) = @_;
    return $self->{side_left};
}

sub back_center {
    my ($self) = @_;
    return $self->{back_center};
}

sub top_back_left {
    my ($self) = @_;
    return $self->{top_back_left};
}

sub top_front_right {
    my ($self) = @_;
    return $self->{top_front_right};
}

sub top_front_center {
    my ($self) = @_;
    return $self->{top_front_center};
}

sub top_front_left {
    my ($self) = @_;
    return $self->{top_front_left};
}

sub unused1 {
    my ($self) = @_;
    return $self->{unused1};
}

sub top_back_right {
    my ($self) = @_;
    return $self->{top_back_right};
}

sub top_back_center {
    my ($self) = @_;
    return $self->{top_back_center};
}

sub unused2 {
    my ($self) = @_;
    return $self->{unused2};
}

########################################################################
package Wav::ChunkType;

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

    $self->{chunk_id} = $self->{_io}->read_u4be();
    $self->{len} = $self->{_io}->read_u4le();
    my $_on = $self->chunk_id();
    if ($_on == 1684108385) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Wav::DataChunkType->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == 1668637984) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Wav::CueChunkType->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == 1650817140) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Wav::BextChunkType->new($io__raw_data, $self, $self->{_root});
    }
    elsif ($_on == 1718449184) {
        $self->{_raw_data} = $self->{_io}->read_bytes($self->len());
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Wav::FormatChunkType->new($io__raw_data, $self, $self->{_root});
    }
    else {
        $self->{data} = $self->{_io}->read_bytes($self->len());
    }
}

sub chunk_id {
    my ($self) = @_;
    return $self->{chunk_id};
}

sub len {
    my ($self) = @_;
    return $self->{len};
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
package Wav::BextChunkType;

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

    $self->{description} = Encode::decode("ASCII", $self->{_io}->read_bytes(256));
    $self->{originator} = Encode::decode("ASCII", $self->{_io}->read_bytes(32));
    $self->{originator_reference} = Encode::decode("ASCII", $self->{_io}->read_bytes(32));
    $self->{origination_date} = Encode::decode("ASCII", $self->{_io}->read_bytes(10));
    $self->{origination_time} = Encode::decode("ASCII", $self->{_io}->read_bytes(8));
    $self->{time_reference_low} = $self->{_io}->read_u4le();
    $self->{time_reference_high} = $self->{_io}->read_u4le();
    $self->{version} = $self->{_io}->read_u2le();
    $self->{umid} = $self->{_io}->read_bytes(64);
    $self->{loudness_value} = $self->{_io}->read_u2le();
    $self->{loudness_range} = $self->{_io}->read_u2le();
    $self->{max_true_peak_level} = $self->{_io}->read_u2le();
    $self->{max_momentary_loudness} = $self->{_io}->read_u2le();
    $self->{max_short_term_loudness} = $self->{_io}->read_u2le();
}

sub description {
    my ($self) = @_;
    return $self->{description};
}

sub originator {
    my ($self) = @_;
    return $self->{originator};
}

sub originator_reference {
    my ($self) = @_;
    return $self->{originator_reference};
}

sub origination_date {
    my ($self) = @_;
    return $self->{origination_date};
}

sub origination_time {
    my ($self) = @_;
    return $self->{origination_time};
}

sub time_reference_low {
    my ($self) = @_;
    return $self->{time_reference_low};
}

sub time_reference_high {
    my ($self) = @_;
    return $self->{time_reference_high};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub umid {
    my ($self) = @_;
    return $self->{umid};
}

sub loudness_value {
    my ($self) = @_;
    return $self->{loudness_value};
}

sub loudness_range {
    my ($self) = @_;
    return $self->{loudness_range};
}

sub max_true_peak_level {
    my ($self) = @_;
    return $self->{max_true_peak_level};
}

sub max_momentary_loudness {
    my ($self) = @_;
    return $self->{max_momentary_loudness};
}

sub max_short_term_loudness {
    my ($self) = @_;
    return $self->{max_short_term_loudness};
}

1;
