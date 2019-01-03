# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use VlqBase128Be;

########################################################################
package StandardMidiFile;

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

    $self->{hdr} = StandardMidiFile::Header->new($self->{_io}, $self, $self->{_root});
    $self->{tracks} = ();
    my $n_tracks = $self->hdr()->num_tracks();
    for (my $i = 0; $i < $n_tracks; $i++) {
        $self->{tracks}[$i] = StandardMidiFile::Track->new($self->{_io}, $self, $self->{_root});
    }
}

sub hdr {
    my ($self) = @_;
    return $self->{hdr};
}

sub tracks {
    my ($self) = @_;
    return $self->{tracks};
}

########################################################################
package StandardMidiFile::TrackEvents;

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

    $self->{event} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{event}}, StandardMidiFile::TrackEvent->new($self->{_io}, $self, $self->{_root});
    }
}

sub event {
    my ($self) = @_;
    return $self->{event};
}

########################################################################
package StandardMidiFile::TrackEvent;

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

    $self->{v_time} = VlqBase128Be->new($self->{_io});
    $self->{event_header} = $self->{_io}->read_u1();
    if ($self->event_header() == 255) {
        $self->{meta_event_body} = StandardMidiFile::MetaEventBody->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->event_header() == 240) {
        $self->{sysex_body} = StandardMidiFile::SysexEventBody->new($self->{_io}, $self, $self->{_root});
    }
    my $_on = $self->event_type();
    if ($_on == 224) {
        $self->{event_body} = StandardMidiFile::PitchBendEvent->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 144) {
        $self->{event_body} = StandardMidiFile::NoteOnEvent->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 208) {
        $self->{event_body} = StandardMidiFile::ChannelPressureEvent->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 192) {
        $self->{event_body} = StandardMidiFile::ProgramChangeEvent->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 160) {
        $self->{event_body} = StandardMidiFile::PolyphonicPressureEvent->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 176) {
        $self->{event_body} = StandardMidiFile::ControllerEvent->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 128) {
        $self->{event_body} = StandardMidiFile::NoteOffEvent->new($self->{_io}, $self, $self->{_root});
    }
}

sub event_type {
    my ($self) = @_;
    return $self->{event_type} if ($self->{event_type});
    $self->{event_type} = ($self->event_header() & 240);
    return $self->{event_type};
}

sub channel {
    my ($self) = @_;
    return $self->{channel} if ($self->{channel});
    if ($self->event_type() != 240) {
        $self->{channel} = ($self->event_header() & 15);
    }
    return $self->{channel};
}

sub v_time {
    my ($self) = @_;
    return $self->{v_time};
}

sub event_header {
    my ($self) = @_;
    return $self->{event_header};
}

sub meta_event_body {
    my ($self) = @_;
    return $self->{meta_event_body};
}

sub sysex_body {
    my ($self) = @_;
    return $self->{sysex_body};
}

sub event_body {
    my ($self) = @_;
    return $self->{event_body};
}

########################################################################
package StandardMidiFile::PitchBendEvent;

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

    $self->{b1} = $self->{_io}->read_u1();
    $self->{b2} = $self->{_io}->read_u1();
}

sub bend_value {
    my ($self) = @_;
    return $self->{bend_value} if ($self->{bend_value});
    $self->{bend_value} = ((($self->b2() << 7) + $self->b1()) - 16384);
    return $self->{bend_value};
}

sub adj_bend_value {
    my ($self) = @_;
    return $self->{adj_bend_value} if ($self->{adj_bend_value});
    $self->{adj_bend_value} = ($self->bend_value() - 16384);
    return $self->{adj_bend_value};
}

sub b1 {
    my ($self) = @_;
    return $self->{b1};
}

sub b2 {
    my ($self) = @_;
    return $self->{b2};
}

########################################################################
package StandardMidiFile::ProgramChangeEvent;

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

    $self->{program} = $self->{_io}->read_u1();
}

sub program {
    my ($self) = @_;
    return $self->{program};
}

########################################################################
package StandardMidiFile::NoteOnEvent;

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

    $self->{note} = $self->{_io}->read_u1();
    $self->{velocity} = $self->{_io}->read_u1();
}

sub note {
    my ($self) = @_;
    return $self->{note};
}

sub velocity {
    my ($self) = @_;
    return $self->{velocity};
}

########################################################################
package StandardMidiFile::PolyphonicPressureEvent;

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

    $self->{note} = $self->{_io}->read_u1();
    $self->{pressure} = $self->{_io}->read_u1();
}

sub note {
    my ($self) = @_;
    return $self->{note};
}

sub pressure {
    my ($self) = @_;
    return $self->{pressure};
}

########################################################################
package StandardMidiFile::Track;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (77, 84, 114, 107)));
    $self->{len_events} = $self->{_io}->read_u4be();
    $self->{_raw_events} = $self->{_io}->read_bytes($self->len_events());
    my $io__raw_events = IO::KaitaiStruct::Stream->new($self->{_raw_events});
    $self->{events} = StandardMidiFile::TrackEvents->new($io__raw_events, $self, $self->{_root});
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub len_events {
    my ($self) = @_;
    return $self->{len_events};
}

sub events {
    my ($self) = @_;
    return $self->{events};
}

sub _raw_events {
    my ($self) = @_;
    return $self->{_raw_events};
}

########################################################################
package StandardMidiFile::MetaEventBody;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $META_TYPE_ENUM_SEQUENCE_NUMBER = 0;
our $META_TYPE_ENUM_TEXT_EVENT = 1;
our $META_TYPE_ENUM_COPYRIGHT = 2;
our $META_TYPE_ENUM_SEQUENCE_TRACK_NAME = 3;
our $META_TYPE_ENUM_INSTRUMENT_NAME = 4;
our $META_TYPE_ENUM_LYRIC_TEXT = 5;
our $META_TYPE_ENUM_MARKER_TEXT = 6;
our $META_TYPE_ENUM_CUE_POINT = 7;
our $META_TYPE_ENUM_MIDI_CHANNEL_PREFIX_ASSIGNMENT = 32;
our $META_TYPE_ENUM_END_OF_TRACK = 47;
our $META_TYPE_ENUM_TEMPO = 81;
our $META_TYPE_ENUM_SMPTE_OFFSET = 84;
our $META_TYPE_ENUM_TIME_SIGNATURE = 88;
our $META_TYPE_ENUM_KEY_SIGNATURE = 89;
our $META_TYPE_ENUM_SEQUENCER_SPECIFIC_EVENT = 127;

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

    $self->{meta_type} = $self->{_io}->read_u1();
    $self->{len} = VlqBase128Be->new($self->{_io});
    $self->{body} = $self->{_io}->read_bytes($self->len()->value());
}

sub meta_type {
    my ($self) = @_;
    return $self->{meta_type};
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package StandardMidiFile::ControllerEvent;

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

    $self->{controller} = $self->{_io}->read_u1();
    $self->{value} = $self->{_io}->read_u1();
}

sub controller {
    my ($self) = @_;
    return $self->{controller};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package StandardMidiFile::Header;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (77, 84, 104, 100)));
    $self->{len_header} = $self->{_io}->read_u4be();
    $self->{format} = $self->{_io}->read_u2be();
    $self->{num_tracks} = $self->{_io}->read_u2be();
    $self->{division} = $self->{_io}->read_s2be();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

sub format {
    my ($self) = @_;
    return $self->{format};
}

sub num_tracks {
    my ($self) = @_;
    return $self->{num_tracks};
}

sub division {
    my ($self) = @_;
    return $self->{division};
}

########################################################################
package StandardMidiFile::SysexEventBody;

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

    $self->{len} = VlqBase128Be->new($self->{_io});
    $self->{data} = $self->{_io}->read_bytes($self->len()->value());
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package StandardMidiFile::NoteOffEvent;

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

    $self->{note} = $self->{_io}->read_u1();
    $self->{velocity} = $self->{_io}->read_u1();
}

sub note {
    my ($self) = @_;
    return $self->{note};
}

sub velocity {
    my ($self) = @_;
    return $self->{velocity};
}

########################################################################
package StandardMidiFile::ChannelPressureEvent;

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

    $self->{pressure} = $self->{_io}->read_u1();
}

sub pressure {
    my ($self) = @_;
    return $self->{pressure};
}

1;
