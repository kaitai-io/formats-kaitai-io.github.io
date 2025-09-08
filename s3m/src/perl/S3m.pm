# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;

########################################################################
package S3m;

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

    $self->{song_name} = IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(28), 0, 0);
    $self->{magic1} = $self->{_io}->read_bytes(1);
    $self->{file_type} = $self->{_io}->read_u1();
    $self->{reserved1} = $self->{_io}->read_bytes(2);
    $self->{num_orders} = $self->{_io}->read_u2le();
    $self->{num_instruments} = $self->{_io}->read_u2le();
    $self->{num_patterns} = $self->{_io}->read_u2le();
    $self->{flags} = $self->{_io}->read_u2le();
    $self->{version} = $self->{_io}->read_u2le();
    $self->{samples_format} = $self->{_io}->read_u2le();
    $self->{magic2} = $self->{_io}->read_bytes(4);
    $self->{global_volume} = $self->{_io}->read_u1();
    $self->{initial_speed} = $self->{_io}->read_u1();
    $self->{initial_tempo} = $self->{_io}->read_u1();
    $self->{is_stereo} = $self->{_io}->read_bits_int_be(1);
    $self->{master_volume} = $self->{_io}->read_bits_int_be(7);
    $self->{_io}->align_to_byte();
    $self->{ultra_click_removal} = $self->{_io}->read_u1();
    $self->{has_custom_pan} = $self->{_io}->read_u1();
    $self->{reserved2} = $self->{_io}->read_bytes(8);
    $self->{ofs_special} = $self->{_io}->read_u2le();
    $self->{channels} = [];
    my $n_channels = 32;
    for (my $i = 0; $i < $n_channels; $i++) {
        push @{$self->{channels}}, S3m::Channel->new($self->{_io}, $self, $self->{_root});
    }
    $self->{orders} = $self->{_io}->read_bytes($self->num_orders());
    $self->{instruments} = [];
    my $n_instruments = $self->num_instruments();
    for (my $i = 0; $i < $n_instruments; $i++) {
        push @{$self->{instruments}}, S3m::InstrumentPtr->new($self->{_io}, $self, $self->{_root});
    }
    $self->{patterns} = [];
    my $n_patterns = $self->num_patterns();
    for (my $i = 0; $i < $n_patterns; $i++) {
        push @{$self->{patterns}}, S3m::PatternPtr->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->has_custom_pan() == 252) {
        $self->{channel_pans} = [];
        my $n_channel_pans = 32;
        for (my $i = 0; $i < $n_channel_pans; $i++) {
            push @{$self->{channel_pans}}, S3m::ChannelPan->new($self->{_io}, $self, $self->{_root});
        }
    }
}

sub song_name {
    my ($self) = @_;
    return $self->{song_name};
}

sub magic1 {
    my ($self) = @_;
    return $self->{magic1};
}

sub file_type {
    my ($self) = @_;
    return $self->{file_type};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub num_orders {
    my ($self) = @_;
    return $self->{num_orders};
}

sub num_instruments {
    my ($self) = @_;
    return $self->{num_instruments};
}

sub num_patterns {
    my ($self) = @_;
    return $self->{num_patterns};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub samples_format {
    my ($self) = @_;
    return $self->{samples_format};
}

sub magic2 {
    my ($self) = @_;
    return $self->{magic2};
}

sub global_volume {
    my ($self) = @_;
    return $self->{global_volume};
}

sub initial_speed {
    my ($self) = @_;
    return $self->{initial_speed};
}

sub initial_tempo {
    my ($self) = @_;
    return $self->{initial_tempo};
}

sub is_stereo {
    my ($self) = @_;
    return $self->{is_stereo};
}

sub master_volume {
    my ($self) = @_;
    return $self->{master_volume};
}

sub ultra_click_removal {
    my ($self) = @_;
    return $self->{ultra_click_removal};
}

sub has_custom_pan {
    my ($self) = @_;
    return $self->{has_custom_pan};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub ofs_special {
    my ($self) = @_;
    return $self->{ofs_special};
}

sub channels {
    my ($self) = @_;
    return $self->{channels};
}

sub orders {
    my ($self) = @_;
    return $self->{orders};
}

sub instruments {
    my ($self) = @_;
    return $self->{instruments};
}

sub patterns {
    my ($self) = @_;
    return $self->{patterns};
}

sub channel_pans {
    my ($self) = @_;
    return $self->{channel_pans};
}

########################################################################
package S3m::Channel;

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

    $self->{is_disabled} = $self->{_io}->read_bits_int_be(1);
    $self->{ch_type} = $self->{_io}->read_bits_int_be(7);
}

sub is_disabled {
    my ($self) = @_;
    return $self->{is_disabled};
}

sub ch_type {
    my ($self) = @_;
    return $self->{ch_type};
}

########################################################################
package S3m::ChannelPan;

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

    $self->{reserved1} = $self->{_io}->read_bits_int_be(2);
    $self->{has_custom_pan} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved2} = $self->{_io}->read_bits_int_be(1);
    $self->{pan} = $self->{_io}->read_bits_int_be(4);
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub has_custom_pan {
    my ($self) = @_;
    return $self->{has_custom_pan};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub pan {
    my ($self) = @_;
    return $self->{pan};
}

########################################################################
package S3m::Instrument;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $INST_TYPES_SAMPLE = 1;
our $INST_TYPES_MELODIC = 2;
our $INST_TYPES_BASS_DRUM = 3;
our $INST_TYPES_SNARE_DRUM = 4;
our $INST_TYPES_TOM = 5;
our $INST_TYPES_CYMBAL = 6;
our $INST_TYPES_HIHAT = 7;

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

    $self->{type} = $self->{_io}->read_u1();
    $self->{filename} = IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(12), 0, 0);
    my $_on = $self->type();
    if ($_on == $S3m::Instrument::INST_TYPES_SAMPLE) {
        $self->{body} = S3m::Instrument::Sampled->new($self->{_io}, $self, $self->{_root});
    }
    else {
        $self->{body} = S3m::Instrument::Adlib->new($self->{_io}, $self, $self->{_root});
    }
    $self->{tuning_hz} = $self->{_io}->read_u4le();
    $self->{reserved2} = $self->{_io}->read_bytes(12);
    $self->{sample_name} = IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(28), 0, 0);
    $self->{magic} = $self->{_io}->read_bytes(4);
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub filename {
    my ($self) = @_;
    return $self->{filename};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub tuning_hz {
    my ($self) = @_;
    return $self->{tuning_hz};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub sample_name {
    my ($self) = @_;
    return $self->{sample_name};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

########################################################################
package S3m::Instrument::Adlib;

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

    $self->{reserved1} = $self->{_io}->read_bytes(3);
    $self->{_unnamed1} = $self->{_io}->read_bytes(16);
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub _unnamed1 {
    my ($self) = @_;
    return $self->{_unnamed1};
}

########################################################################
package S3m::Instrument::Sampled;

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

    $self->{paraptr_sample} = S3m::SwappedU3->new($self->{_io}, $self, $self->{_root});
    $self->{len_sample} = $self->{_io}->read_u4le();
    $self->{loop_begin} = $self->{_io}->read_u4le();
    $self->{loop_end} = $self->{_io}->read_u4le();
    $self->{default_volume} = $self->{_io}->read_u1();
    $self->{reserved1} = $self->{_io}->read_u1();
    $self->{is_packed} = $self->{_io}->read_u1();
    $self->{flags} = $self->{_io}->read_u1();
}

sub sample {
    my ($self) = @_;
    return $self->{sample} if ($self->{sample});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->paraptr_sample()->value() * 16);
    $self->{sample} = $self->{_io}->read_bytes($self->len_sample());
    $self->{_io}->seek($_pos);
    return $self->{sample};
}

sub paraptr_sample {
    my ($self) = @_;
    return $self->{paraptr_sample};
}

sub len_sample {
    my ($self) = @_;
    return $self->{len_sample};
}

sub loop_begin {
    my ($self) = @_;
    return $self->{loop_begin};
}

sub loop_end {
    my ($self) = @_;
    return $self->{loop_end};
}

sub default_volume {
    my ($self) = @_;
    return $self->{default_volume};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub is_packed {
    my ($self) = @_;
    return $self->{is_packed};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

########################################################################
package S3m::InstrumentPtr;

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

    $self->{paraptr} = $self->{_io}->read_u2le();
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->paraptr() * 16);
    $self->{body} = S3m::Instrument->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{body};
}

sub paraptr {
    my ($self) = @_;
    return $self->{paraptr};
}

########################################################################
package S3m::Pattern;

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

    $self->{size} = $self->{_io}->read_u2le();
    $self->{_raw_body} = $self->{_io}->read_bytes($self->size() - 2);
    my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
    $self->{body} = S3m::PatternCells->new($io__raw_body, $self, $self->{_root});
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package S3m::PatternCell;

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

    $self->{has_fx} = $self->{_io}->read_bits_int_be(1);
    $self->{has_volume} = $self->{_io}->read_bits_int_be(1);
    $self->{has_note_and_instrument} = $self->{_io}->read_bits_int_be(1);
    $self->{channel_num} = $self->{_io}->read_bits_int_be(5);
    $self->{_io}->align_to_byte();
    if ($self->has_note_and_instrument()) {
        $self->{note} = $self->{_io}->read_u1();
    }
    if ($self->has_note_and_instrument()) {
        $self->{instrument} = $self->{_io}->read_u1();
    }
    if ($self->has_volume()) {
        $self->{volume} = $self->{_io}->read_u1();
    }
    if ($self->has_fx()) {
        $self->{fx_type} = $self->{_io}->read_u1();
    }
    if ($self->has_fx()) {
        $self->{fx_value} = $self->{_io}->read_u1();
    }
}

sub has_fx {
    my ($self) = @_;
    return $self->{has_fx};
}

sub has_volume {
    my ($self) = @_;
    return $self->{has_volume};
}

sub has_note_and_instrument {
    my ($self) = @_;
    return $self->{has_note_and_instrument};
}

sub channel_num {
    my ($self) = @_;
    return $self->{channel_num};
}

sub note {
    my ($self) = @_;
    return $self->{note};
}

sub instrument {
    my ($self) = @_;
    return $self->{instrument};
}

sub volume {
    my ($self) = @_;
    return $self->{volume};
}

sub fx_type {
    my ($self) = @_;
    return $self->{fx_type};
}

sub fx_value {
    my ($self) = @_;
    return $self->{fx_value};
}

########################################################################
package S3m::PatternCells;

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

    $self->{cells} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{cells}}, S3m::PatternCell->new($self->{_io}, $self, $self->{_root});
    }
}

sub cells {
    my ($self) = @_;
    return $self->{cells};
}

########################################################################
package S3m::PatternPtr;

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

    $self->{paraptr} = $self->{_io}->read_u2le();
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->paraptr() * 16);
    $self->{body} = S3m::Pattern->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{body};
}

sub paraptr {
    my ($self) = @_;
    return $self->{paraptr};
}

########################################################################
package S3m::SwappedU3;

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

    $self->{hi} = $self->{_io}->read_u1();
    $self->{lo} = $self->{_io}->read_u2le();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = $self->lo() | $self->hi() << 16;
    return $self->{value};
}

sub hi {
    my ($self) = @_;
    return $self->{hi};
}

sub lo {
    my ($self) = @_;
    return $self->{lo};
}

1;
