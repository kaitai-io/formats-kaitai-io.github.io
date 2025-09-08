# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package MacOsResourceSnd;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CMD_TYPE_NULL_CMD = 0;
our $CMD_TYPE_QUIET_CMD = 3;
our $CMD_TYPE_FLUSH_CMD = 4;
our $CMD_TYPE_RE_INIT_CMD = 5;
our $CMD_TYPE_WAIT_CMD = 10;
our $CMD_TYPE_PAUSE_CMD = 11;
our $CMD_TYPE_RESUME_CMD = 12;
our $CMD_TYPE_CALL_BACK_CMD = 13;
our $CMD_TYPE_SYNC_CMD = 14;
our $CMD_TYPE_EMPTY_CMD = 15;
our $CMD_TYPE_AVAILABLE_CMD = 24;
our $CMD_TYPE_VERSION_CMD = 25;
our $CMD_TYPE_TOTAL_LOAD_CMD = 26;
our $CMD_TYPE_LOAD_CMD = 27;
our $CMD_TYPE_FREQ_DURATION_CMD = 40;
our $CMD_TYPE_REST_CMD = 41;
our $CMD_TYPE_FREQ_CMD = 42;
our $CMD_TYPE_AMP_CMD = 43;
our $CMD_TYPE_TIMBRE_CMD = 44;
our $CMD_TYPE_GET_AMP_CMD = 45;
our $CMD_TYPE_VOLUME_CMD = 46;
our $CMD_TYPE_GET_VOLUME_CMD = 47;
our $CMD_TYPE_WAVE_TABLE_CMD = 60;
our $CMD_TYPE_PHASE_CMD = 61;
our $CMD_TYPE_SOUND_CMD = 80;
our $CMD_TYPE_BUFFER_CMD = 81;
our $CMD_TYPE_RATE_CMD = 82;
our $CMD_TYPE_GET_RATE_CMD = 85;

our $COMPRESSION_TYPE_ENUM_VARIABLE_COMPRESSION = -2;
our $COMPRESSION_TYPE_ENUM_FIXED_COMPRESSION = -1;
our $COMPRESSION_TYPE_ENUM_NOT_COMPRESSED = 0;
our $COMPRESSION_TYPE_ENUM_TWO_TO_ONE = 1;
our $COMPRESSION_TYPE_ENUM_EIGHT_TO_THREE = 2;
our $COMPRESSION_TYPE_ENUM_THREE_TO_ONE = 3;
our $COMPRESSION_TYPE_ENUM_SIX_TO_ONE = 4;

our $DATA_TYPE_SQUARE_WAVE_SYNTH = 1;
our $DATA_TYPE_WAVE_TABLE_SYNTH = 3;
our $DATA_TYPE_SAMPLED_SYNTH = 5;

our $INIT_OPTION_CHAN_LEFT = 2;
our $INIT_OPTION_CHAN_RIGHT = 3;
our $INIT_OPTION_NO_INTERP = 4;
our $INIT_OPTION_NO_DROP = 8;
our $INIT_OPTION_MONO = 128;
our $INIT_OPTION_STEREO = 192;
our $INIT_OPTION_MACE3 = 768;
our $INIT_OPTION_MACE6 = 1024;

our $SOUND_HEADER_TYPE_STANDARD = 0;
our $SOUND_HEADER_TYPE_COMPRESSED = 254;
our $SOUND_HEADER_TYPE_EXTENDED = 255;

our $WAVE_INIT_OPTION_CHANNEL0 = 4;
our $WAVE_INIT_OPTION_CHANNEL1 = 5;
our $WAVE_INIT_OPTION_CHANNEL2 = 6;
our $WAVE_INIT_OPTION_CHANNEL3 = 7;

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

    $self->{format} = $self->{_io}->read_u2be();
    if ($self->format() == 1) {
        $self->{num_data_formats} = $self->{_io}->read_u2be();
    }
    if ($self->format() == 1) {
        $self->{data_formats} = [];
        my $n_data_formats = $self->num_data_formats();
        for (my $i = 0; $i < $n_data_formats; $i++) {
            push @{$self->{data_formats}}, MacOsResourceSnd::DataFormat->new($self->{_io}, $self, $self->{_root});
        }
    }
    if ($self->format() == 2) {
        $self->{reference_count} = $self->{_io}->read_u2be();
    }
    $self->{num_sound_commands} = $self->{_io}->read_u2be();
    $self->{sound_commands} = [];
    my $n_sound_commands = $self->num_sound_commands();
    for (my $i = 0; $i < $n_sound_commands; $i++) {
        push @{$self->{sound_commands}}, MacOsResourceSnd::SoundCommand->new($self->{_io}, $self, $self->{_root});
    }
}

sub midi_note_to_frequency {
    my ($self) = @_;
    return $self->{midi_note_to_frequency} if ($self->{midi_note_to_frequency});
    $self->{midi_note_to_frequency} = [8.18, 8.66, 9.18, 9.72, 10.30, 10.91, 11.56, 12.25, 12.98, 13.75, 14.57, 15.43, 16.35, 17.32, 18.35, 19.45, 20.60, 21.83, 23.12, 24.50, 25.96, 27.50, 29.14, 30.87, 32.70, 34.65, 36.71, 38.89, 41.20, 43.65, 46.25, 49.00, 51.91, 55.00, 58.27, 61.74, 65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.50, 98.00, 103.83, 110.00, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185.00, 196.00, 207.65, 220.00, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.26, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07, 4186.01, 4434.92, 4698.64, 4978.03, 5274.04, 5587.65, 5919.91, 6271.93, 6644.88, 7040.00, 7458.62, 7902.13, 8372.02, 8869.84, 9397.27, 9956.06, 10548.08, 11175.30, 11839.82, 12543.85];
    return $self->{midi_note_to_frequency};
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub num_data_formats {
    my ($self) = @_;
    return $self->{num_data_formats};
}

sub data_formats {
    my ($self) = @_;
    return $self->{data_formats};
}

sub reference_count {
    my ($self) = @_;
    return $self->{reference_count};
}

sub num_sound_commands {
    my ($self) = @_;
    return $self->{num_sound_commands};
}

sub sound_commands {
    my ($self) = @_;
    return $self->{sound_commands};
}

########################################################################
package MacOsResourceSnd::Compressed;

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

    $self->{format} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{state_vars_ptr} = $self->{_io}->read_u4be();
    $self->{left_over_samples_ptr} = $self->{_io}->read_u4be();
    $self->{compression_id} = $self->{_io}->read_s2be();
    $self->{packet_size} = $self->{_io}->read_u2be();
    $self->{synthesizer_id} = $self->{_io}->read_u2be();
}

sub compression_type {
    my ($self) = @_;
    return $self->{compression_type} if ($self->{compression_type});
    $self->{compression_type} = $self->compression_id();
    return $self->{compression_type};
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub state_vars_ptr {
    my ($self) = @_;
    return $self->{state_vars_ptr};
}

sub left_over_samples_ptr {
    my ($self) = @_;
    return $self->{left_over_samples_ptr};
}

sub compression_id {
    my ($self) = @_;
    return $self->{compression_id};
}

sub packet_size {
    my ($self) = @_;
    return $self->{packet_size};
}

sub synthesizer_id {
    my ($self) = @_;
    return $self->{synthesizer_id};
}

########################################################################
package MacOsResourceSnd::DataFormat;

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

    $self->{id} = $self->{_io}->read_u2be();
    $self->{options} = $self->{_io}->read_u4be();
}

sub comp_init {
    my ($self) = @_;
    return $self->{comp_init} if ($self->{comp_init});
    $self->{comp_init} = $self->options() & $self->init_comp_mask();
    return $self->{comp_init};
}

sub init_comp_mask {
    my ($self) = @_;
    return $self->{init_comp_mask} if ($self->{init_comp_mask});
    $self->{init_comp_mask} = 65280;
    return $self->{init_comp_mask};
}

sub init_pan_mask {
    my ($self) = @_;
    return $self->{init_pan_mask} if ($self->{init_pan_mask});
    $self->{init_pan_mask} = 3;
    return $self->{init_pan_mask};
}

sub init_stereo_mask {
    my ($self) = @_;
    return $self->{init_stereo_mask} if ($self->{init_stereo_mask});
    $self->{init_stereo_mask} = 192;
    return $self->{init_stereo_mask};
}

sub pan_init {
    my ($self) = @_;
    return $self->{pan_init} if ($self->{pan_init});
    $self->{pan_init} = $self->options() & $self->init_pan_mask();
    return $self->{pan_init};
}

sub stereo_init {
    my ($self) = @_;
    return $self->{stereo_init} if ($self->{stereo_init});
    $self->{stereo_init} = $self->options() & $self->init_stereo_mask();
    return $self->{stereo_init};
}

sub wave_init {
    my ($self) = @_;
    return $self->{wave_init} if ($self->{wave_init});
    if ($self->id() == $MacOsResourceSnd::DATA_TYPE_WAVE_TABLE_SYNTH) {
        $self->{wave_init} = $self->options() & $self->wave_init_channel_mask();
    }
    return $self->{wave_init};
}

sub wave_init_channel_mask {
    my ($self) = @_;
    return $self->{wave_init_channel_mask} if ($self->{wave_init_channel_mask});
    $self->{wave_init_channel_mask} = 7;
    return $self->{wave_init_channel_mask};
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub options {
    my ($self) = @_;
    return $self->{options};
}

########################################################################
package MacOsResourceSnd::Extended;

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

    $self->{instrument_chunk_ptr} = $self->{_io}->read_u4be();
    $self->{aes_recording_ptr} = $self->{_io}->read_u4be();
}

sub instrument_chunk_ptr {
    my ($self) = @_;
    return $self->{instrument_chunk_ptr};
}

sub aes_recording_ptr {
    my ($self) = @_;
    return $self->{aes_recording_ptr};
}

########################################################################
package MacOsResourceSnd::ExtendedOrCompressed;

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

    $self->{num_frames} = $self->{_io}->read_u4be();
    $self->{aiff_sample_rate} = $self->{_io}->read_bytes(10);
    $self->{marker_chunk} = $self->{_io}->read_u4be();
    if ($self->_parent()->sound_header_type() == $MacOsResourceSnd::SOUND_HEADER_TYPE_EXTENDED) {
        $self->{extended} = MacOsResourceSnd::Extended->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->_parent()->sound_header_type() == $MacOsResourceSnd::SOUND_HEADER_TYPE_COMPRESSED) {
        $self->{compressed} = MacOsResourceSnd::Compressed->new($self->{_io}, $self, $self->{_root});
    }
    $self->{bits_per_sample} = $self->{_io}->read_u2be();
    if ($self->_parent()->sound_header_type() == $MacOsResourceSnd::SOUND_HEADER_TYPE_EXTENDED) {
        $self->{reserved} = $self->{_io}->read_bytes(14);
    }
}

sub num_frames {
    my ($self) = @_;
    return $self->{num_frames};
}

sub aiff_sample_rate {
    my ($self) = @_;
    return $self->{aiff_sample_rate};
}

sub marker_chunk {
    my ($self) = @_;
    return $self->{marker_chunk};
}

sub extended {
    my ($self) = @_;
    return $self->{extended};
}

sub compressed {
    my ($self) = @_;
    return $self->{compressed};
}

sub bits_per_sample {
    my ($self) = @_;
    return $self->{bits_per_sample};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package MacOsResourceSnd::SoundCommand;

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

    $self->{is_data_offset} = $self->{_io}->read_bits_int_be(1);
    $self->{cmd} = $self->{_io}->read_bits_int_be(15);
    $self->{_io}->align_to_byte();
    $self->{param1} = $self->{_io}->read_u2be();
    $self->{param2} = $self->{_io}->read_u4be();
}

sub sound_header {
    my ($self) = @_;
    return $self->{sound_header} if ($self->{sound_header});
    if ( (($self->is_data_offset()) && ($self->cmd() == $MacOsResourceSnd::CMD_TYPE_BUFFER_CMD)) ) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->param2());
        $self->{sound_header} = MacOsResourceSnd::SoundHeader->new($self->{_io}, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{sound_header};
}

sub is_data_offset {
    my ($self) = @_;
    return $self->{is_data_offset};
}

sub cmd {
    my ($self) = @_;
    return $self->{cmd};
}

sub param1 {
    my ($self) = @_;
    return $self->{param1};
}

sub param2 {
    my ($self) = @_;
    return $self->{param2};
}

########################################################################
package MacOsResourceSnd::SoundHeader;

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

    if ($self->start_ofs() < 0) {
        $self->{_unnamed0} = $self->{_io}->read_bytes(0);
    }
    $self->{sample_ptr} = $self->{_io}->read_u4be();
    if ($self->sound_header_type() == $MacOsResourceSnd::SOUND_HEADER_TYPE_STANDARD) {
        $self->{num_samples} = $self->{_io}->read_u4be();
    }
    if ( (($self->sound_header_type() == $MacOsResourceSnd::SOUND_HEADER_TYPE_EXTENDED) || ($self->sound_header_type() == $MacOsResourceSnd::SOUND_HEADER_TYPE_COMPRESSED)) ) {
        $self->{num_channels} = $self->{_io}->read_u4be();
    }
    $self->{sample_rate} = MacOsResourceSnd::UnsignedFixedPoint->new($self->{_io}, $self, $self->{_root});
    $self->{loop_start} = $self->{_io}->read_u4be();
    $self->{loop_end} = $self->{_io}->read_u4be();
    $self->{encode} = $self->{_io}->read_u1();
    $self->{midi_note} = $self->{_io}->read_u1();
    if ( (($self->sound_header_type() == $MacOsResourceSnd::SOUND_HEADER_TYPE_EXTENDED) || ($self->sound_header_type() == $MacOsResourceSnd::SOUND_HEADER_TYPE_COMPRESSED)) ) {
        $self->{extended_or_compressed} = MacOsResourceSnd::ExtendedOrCompressed->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->sample_ptr() == 0) {
        $self->{sample_area} = $self->{_io}->read_bytes(($self->sound_header_type() == $MacOsResourceSnd::SOUND_HEADER_TYPE_STANDARD ? $self->num_samples() : ($self->sound_header_type() == $MacOsResourceSnd::SOUND_HEADER_TYPE_EXTENDED ? int((($self->extended_or_compressed()->num_frames() * $self->num_channels()) * $self->extended_or_compressed()->bits_per_sample()) / 8) : $self->_io()->size() - $self->_io()->pos())));
    }
}

sub base_freqeuncy {
    my ($self) = @_;
    return $self->{base_freqeuncy} if ($self->{base_freqeuncy});
    if ( (($self->midi_note() >= 0) && ($self->midi_note() < 128)) ) {
        $self->{base_freqeuncy} = @{$self->_root()->midi_note_to_frequency()}[$self->midi_note()];
    }
    return $self->{base_freqeuncy};
}

sub sound_header_type {
    my ($self) = @_;
    return $self->{sound_header_type} if ($self->{sound_header_type});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->start_ofs() + 20);
    $self->{sound_header_type} = $self->{_io}->read_u1();
    $self->{_io}->seek($_pos);
    return $self->{sound_header_type};
}

sub start_ofs {
    my ($self) = @_;
    return $self->{start_ofs} if ($self->{start_ofs});
    $self->{start_ofs} = $self->_io()->pos();
    return $self->{start_ofs};
}

sub _unnamed0 {
    my ($self) = @_;
    return $self->{_unnamed0};
}

sub sample_ptr {
    my ($self) = @_;
    return $self->{sample_ptr};
}

sub num_samples {
    my ($self) = @_;
    return $self->{num_samples};
}

sub num_channels {
    my ($self) = @_;
    return $self->{num_channels};
}

sub sample_rate {
    my ($self) = @_;
    return $self->{sample_rate};
}

sub loop_start {
    my ($self) = @_;
    return $self->{loop_start};
}

sub loop_end {
    my ($self) = @_;
    return $self->{loop_end};
}

sub encode {
    my ($self) = @_;
    return $self->{encode};
}

sub midi_note {
    my ($self) = @_;
    return $self->{midi_note};
}

sub extended_or_compressed {
    my ($self) = @_;
    return $self->{extended_or_compressed};
}

sub sample_area {
    my ($self) = @_;
    return $self->{sample_area};
}

########################################################################
package MacOsResourceSnd::UnsignedFixedPoint;

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

    $self->{integer_part} = $self->{_io}->read_u2be();
    $self->{fraction_part} = $self->{_io}->read_u2be();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = $self->integer_part() + $self->fraction_part() / 65535.0;
    return $self->{value};
}

sub integer_part {
    my ($self) = @_;
    return $self->{integer_part};
}

sub fraction_part {
    my ($self) = @_;
    return $self->{fraction_part};
}

1;
