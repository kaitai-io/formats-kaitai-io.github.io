# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package CreativeVoiceFile;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $BLOCK_TYPES_TERMINATOR = 0;
our $BLOCK_TYPES_SOUND_DATA = 1;
our $BLOCK_TYPES_SOUND_DATA_CONT = 2;
our $BLOCK_TYPES_SILENCE = 3;
our $BLOCK_TYPES_MARKER = 4;
our $BLOCK_TYPES_TEXT = 5;
our $BLOCK_TYPES_REPEAT_START = 6;
our $BLOCK_TYPES_REPEAT_END = 7;
our $BLOCK_TYPES_EXTRA_INFO = 8;
our $BLOCK_TYPES_SOUND_DATA_NEW = 9;

our $CODECS_PCM_8BIT_UNSIGNED = 0;
our $CODECS_ADPCM_4BIT = 1;
our $CODECS_ADPCM_2_6BIT = 2;
our $CODECS_ADPCM_2_BIT = 3;
our $CODECS_PCM_16BIT_SIGNED = 4;
our $CODECS_ALAW = 6;
our $CODECS_ULAW = 7;
our $CODECS_ADPCM_4_TO_16BIT = 512;

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

    $self->{magic} = $self->{_io}->read_bytes(20);
    $self->{header_size} = $self->{_io}->read_u2le();
    $self->{version} = $self->{_io}->read_u2le();
    $self->{checksum} = $self->{_io}->read_u2le();
    $self->{blocks} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{blocks}}, CreativeVoiceFile::Block->new($self->{_io}, $self, $self->{_root});
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub header_size {
    my ($self) = @_;
    return $self->{header_size};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

sub blocks {
    my ($self) = @_;
    return $self->{blocks};
}

########################################################################
package CreativeVoiceFile::BlockMarker;

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

    $self->{marker_id} = $self->{_io}->read_u2le();
}

sub marker_id {
    my ($self) = @_;
    return $self->{marker_id};
}

########################################################################
package CreativeVoiceFile::BlockSilence;

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

    $self->{duration_samples} = $self->{_io}->read_u2le();
    $self->{freq_div} = $self->{_io}->read_u1();
}

sub sample_rate {
    my ($self) = @_;
    return $self->{sample_rate} if ($self->{sample_rate});
    $self->{sample_rate} = (1000000.0 / (256 - $self->freq_div()));
    return $self->{sample_rate};
}

sub duration_sec {
    my ($self) = @_;
    return $self->{duration_sec} if ($self->{duration_sec});
    $self->{duration_sec} = ($self->duration_samples() / $self->sample_rate());
    return $self->{duration_sec};
}

sub duration_samples {
    my ($self) = @_;
    return $self->{duration_samples};
}

sub freq_div {
    my ($self) = @_;
    return $self->{freq_div};
}

########################################################################
package CreativeVoiceFile::BlockSoundDataNew;

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

    $self->{sample_rate} = $self->{_io}->read_u4le();
    $self->{bits_per_sample} = $self->{_io}->read_u1();
    $self->{num_channels} = $self->{_io}->read_u1();
    $self->{codec} = $self->{_io}->read_u2le();
    $self->{reserved} = $self->{_io}->read_bytes(4);
    $self->{wave} = $self->{_io}->read_bytes_full();
}

sub sample_rate {
    my ($self) = @_;
    return $self->{sample_rate};
}

sub bits_per_sample {
    my ($self) = @_;
    return $self->{bits_per_sample};
}

sub num_channels {
    my ($self) = @_;
    return $self->{num_channels};
}

sub codec {
    my ($self) = @_;
    return $self->{codec};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub wave {
    my ($self) = @_;
    return $self->{wave};
}

########################################################################
package CreativeVoiceFile::Block;

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

    $self->{block_type} = $self->{_io}->read_u1();
    if ($self->block_type() != $CreativeVoiceFile::BLOCK_TYPES_TERMINATOR) {
        $self->{body_size1} = $self->{_io}->read_u2le();
    }
    if ($self->block_type() != $CreativeVoiceFile::BLOCK_TYPES_TERMINATOR) {
        $self->{body_size2} = $self->{_io}->read_u1();
    }
    if ($self->block_type() != $CreativeVoiceFile::BLOCK_TYPES_TERMINATOR) {
        my $_on = $self->block_type();
        if ($_on == $CreativeVoiceFile::BLOCK_TYPES_SOUND_DATA_NEW) {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->body_size());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = CreativeVoiceFile::BlockSoundDataNew->new($io__raw_body, $self, $self->{_root});
        }
        elsif ($_on == $CreativeVoiceFile::BLOCK_TYPES_REPEAT_START) {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->body_size());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = CreativeVoiceFile::BlockRepeatStart->new($io__raw_body, $self, $self->{_root});
        }
        elsif ($_on == $CreativeVoiceFile::BLOCK_TYPES_MARKER) {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->body_size());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = CreativeVoiceFile::BlockMarker->new($io__raw_body, $self, $self->{_root});
        }
        elsif ($_on == $CreativeVoiceFile::BLOCK_TYPES_SOUND_DATA) {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->body_size());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = CreativeVoiceFile::BlockSoundData->new($io__raw_body, $self, $self->{_root});
        }
        elsif ($_on == $CreativeVoiceFile::BLOCK_TYPES_EXTRA_INFO) {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->body_size());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = CreativeVoiceFile::BlockExtraInfo->new($io__raw_body, $self, $self->{_root});
        }
        elsif ($_on == $CreativeVoiceFile::BLOCK_TYPES_SILENCE) {
            $self->{_raw_body} = $self->{_io}->read_bytes($self->body_size());
            my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
            $self->{body} = CreativeVoiceFile::BlockSilence->new($io__raw_body, $self, $self->{_root});
        }
        else {
            $self->{body} = $self->{_io}->read_bytes($self->body_size());
        }
    }
}

sub body_size {
    my ($self) = @_;
    return $self->{body_size} if ($self->{body_size});
    if ($self->block_type() != $CreativeVoiceFile::BLOCK_TYPES_TERMINATOR) {
        $self->{body_size} = ($self->body_size1() + ($self->body_size2() << 16));
    }
    return $self->{body_size};
}

sub block_type {
    my ($self) = @_;
    return $self->{block_type};
}

sub body_size1 {
    my ($self) = @_;
    return $self->{body_size1};
}

sub body_size2 {
    my ($self) = @_;
    return $self->{body_size2};
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
package CreativeVoiceFile::BlockRepeatStart;

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

    $self->{repeat_count_1} = $self->{_io}->read_u2le();
}

sub repeat_count_1 {
    my ($self) = @_;
    return $self->{repeat_count_1};
}

########################################################################
package CreativeVoiceFile::BlockSoundData;

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

    $self->{freq_div} = $self->{_io}->read_u1();
    $self->{codec} = $self->{_io}->read_u1();
    $self->{wave} = $self->{_io}->read_bytes_full();
}

sub sample_rate {
    my ($self) = @_;
    return $self->{sample_rate} if ($self->{sample_rate});
    $self->{sample_rate} = (1000000.0 / (256 - $self->freq_div()));
    return $self->{sample_rate};
}

sub freq_div {
    my ($self) = @_;
    return $self->{freq_div};
}

sub codec {
    my ($self) = @_;
    return $self->{codec};
}

sub wave {
    my ($self) = @_;
    return $self->{wave};
}

########################################################################
package CreativeVoiceFile::BlockExtraInfo;

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

    $self->{freq_div} = $self->{_io}->read_u2le();
    $self->{codec} = $self->{_io}->read_u1();
    $self->{num_channels_1} = $self->{_io}->read_u1();
}

sub num_channels {
    my ($self) = @_;
    return $self->{num_channels} if ($self->{num_channels});
    $self->{num_channels} = ($self->num_channels_1() + 1);
    return $self->{num_channels};
}

sub sample_rate {
    my ($self) = @_;
    return $self->{sample_rate} if ($self->{sample_rate});
    $self->{sample_rate} = (256000000.0 / ($self->num_channels() * (65536 - $self->freq_div())));
    return $self->{sample_rate};
}

sub freq_div {
    my ($self) = @_;
    return $self->{freq_div};
}

sub codec {
    my ($self) = @_;
    return $self->{codec};
}

sub num_channels_1 {
    my ($self) = @_;
    return $self->{num_channels_1};
}

1;
