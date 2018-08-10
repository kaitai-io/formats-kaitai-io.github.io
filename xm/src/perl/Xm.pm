# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package Xm;

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

    $self->{preheader} = Xm::Preheader->new($self->{_io}, $self, $self->{_root});
    $self->{_raw_header} = $self->{_io}->read_bytes(($self->preheader()->header_size() - 4));
    my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
    $self->{header} = Xm::Header->new($io__raw_header, $self, $self->{_root});
    $self->{patterns} = ();
    my $n_patterns = $self->header()->number_of_patterns();
    for (my $i = 0; $i < $n_patterns; $i++) {
        $self->{patterns}[$i] = Xm::Pattern->new($self->{_io}, $self, $self->{_root});
    }
    $self->{instruments} = ();
    my $n_instruments = $self->header()->number_of_instruments();
    for (my $i = 0; $i < $n_instruments; $i++) {
        $self->{instruments}[$i] = Xm::Instrument->new($self->{_io}, $self, $self->{_root});
    }
}

sub preheader {
    my ($self) = @_;
    return $self->{preheader};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub patterns {
    my ($self) = @_;
    return $self->{patterns};
}

sub instruments {
    my ($self) = @_;
    return $self->{instruments};
}

sub _raw_header {
    my ($self) = @_;
    return $self->{_raw_header};
}

########################################################################
package Xm::Preheader;

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

    $self->{signature0} = $self->{_io}->ensure_fixed_contents(pack('C*', (69, 120, 116, 101, 110, 100, 101, 100, 32, 77, 111, 100, 117, 108, 101, 58, 32)));
    $self->{module_name} = Encode::decode("utf-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(20), 0, 0));
    $self->{signature1} = $self->{_io}->ensure_fixed_contents(pack('C*', (26)));
    $self->{tracker_name} = Encode::decode("utf-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(20), 0, 0));
    $self->{version_number} = Xm::Preheader::Version->new($self->{_io}, $self, $self->{_root});
    $self->{header_size} = $self->{_io}->read_u4le();
}

sub signature0 {
    my ($self) = @_;
    return $self->{signature0};
}

sub module_name {
    my ($self) = @_;
    return $self->{module_name};
}

sub signature1 {
    my ($self) = @_;
    return $self->{signature1};
}

sub tracker_name {
    my ($self) = @_;
    return $self->{tracker_name};
}

sub version_number {
    my ($self) = @_;
    return $self->{version_number};
}

sub header_size {
    my ($self) = @_;
    return $self->{header_size};
}

########################################################################
package Xm::Preheader::Version;

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

    $self->{minor} = $self->{_io}->read_u1();
    $self->{major} = $self->{_io}->read_u1();
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = (($self->major() << 8) | $self->minor());
    return $self->{value};
}

sub minor {
    my ($self) = @_;
    return $self->{minor};
}

sub major {
    my ($self) = @_;
    return $self->{major};
}

########################################################################
package Xm::Pattern;

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

    $self->{header} = Xm::Pattern::Header->new($self->{_io}, $self, $self->{_root});
    $self->{packed_data} = $self->{_io}->read_bytes($self->header()->main()->packed_pattern_data_size());
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub packed_data {
    my ($self) = @_;
    return $self->{packed_data};
}

########################################################################
package Xm::Pattern::Header;

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

    $self->{header_length} = $self->{_io}->read_u4le();
    $self->{_raw_main} = $self->{_io}->read_bytes(($self->header_length() - 4));
    my $io__raw_main = IO::KaitaiStruct::Stream->new($self->{_raw_main});
    $self->{main} = Xm::Pattern::Header::HeaderMain->new($io__raw_main, $self, $self->{_root});
}

sub header_length {
    my ($self) = @_;
    return $self->{header_length};
}

sub main {
    my ($self) = @_;
    return $self->{main};
}

sub _raw_main {
    my ($self) = @_;
    return $self->{_raw_main};
}

########################################################################
package Xm::Pattern::Header::HeaderMain;

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

    $self->{packing_type} = $self->{_io}->read_u1();
    my $_on = $self->_root()->preheader()->version_number()->value();
    if ($_on == 258) {
        $self->{number_of_rows_raw} = $self->{_io}->read_u1();
    }
    else {
        $self->{number_of_rows_raw} = $self->{_io}->read_u2le();
    }
    $self->{packed_pattern_data_size} = $self->{_io}->read_u2le();
}

sub number_of_rows {
    my ($self) = @_;
    return $self->{number_of_rows} if ($self->{number_of_rows});
    $self->{number_of_rows} = ($self->number_of_rows_raw() + ($self->_root()->preheader()->version_number()->value() == 258 ? 1 : 0));
    return $self->{number_of_rows};
}

sub packing_type {
    my ($self) = @_;
    return $self->{packing_type};
}

sub number_of_rows_raw {
    my ($self) = @_;
    return $self->{number_of_rows_raw};
}

sub packed_pattern_data_size {
    my ($self) = @_;
    return $self->{packed_pattern_data_size};
}

########################################################################
package Xm::Flags;

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

    $self->{reserved} = $self->{_io}->read_bits_int(15);
    $self->{freq_table_type} = $self->{_io}->read_bits_int(1);
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub freq_table_type {
    my ($self) = @_;
    return $self->{freq_table_type};
}

########################################################################
package Xm::Header;

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

    $self->{song_length} = $self->{_io}->read_u2le();
    $self->{restart_position} = $self->{_io}->read_u2le();
    $self->{number_of_channels} = $self->{_io}->read_u2le();
    $self->{number_of_patterns} = $self->{_io}->read_u2le();
    $self->{number_of_instruments} = $self->{_io}->read_u2le();
    $self->{flags} = Xm::Flags->new($self->{_io}, $self, $self->{_root});
    $self->{default_tempo} = $self->{_io}->read_u2le();
    $self->{default_bpm} = $self->{_io}->read_u2le();
    $self->{pattern_order_table} = ();
    my $n_pattern_order_table = 256;
    for (my $i = 0; $i < $n_pattern_order_table; $i++) {
        $self->{pattern_order_table}[$i] = $self->{_io}->read_u1();
    }
}

sub song_length {
    my ($self) = @_;
    return $self->{song_length};
}

sub restart_position {
    my ($self) = @_;
    return $self->{restart_position};
}

sub number_of_channels {
    my ($self) = @_;
    return $self->{number_of_channels};
}

sub number_of_patterns {
    my ($self) = @_;
    return $self->{number_of_patterns};
}

sub number_of_instruments {
    my ($self) = @_;
    return $self->{number_of_instruments};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub default_tempo {
    my ($self) = @_;
    return $self->{default_tempo};
}

sub default_bpm {
    my ($self) = @_;
    return $self->{default_bpm};
}

sub pattern_order_table {
    my ($self) = @_;
    return $self->{pattern_order_table};
}

########################################################################
package Xm::Instrument;

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

    $self->{header_size} = $self->{_io}->read_u4le();
    $self->{_raw_header} = $self->{_io}->read_bytes(($self->header_size() - 4));
    my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
    $self->{header} = Xm::Instrument::Header->new($io__raw_header, $self, $self->{_root});
    $self->{samples_headers} = ();
    my $n_samples_headers = $self->header()->number_of_samples();
    for (my $i = 0; $i < $n_samples_headers; $i++) {
        $self->{samples_headers}[$i] = Xm::Instrument::SampleHeader->new($self->{_io}, $self, $self->{_root});
    }
    $self->{samples} = ();
    my $n_samples = $self->header()->number_of_samples();
    for (my $i = 0; $i < $n_samples; $i++) {
        $self->{samples}[$i] = Xm::Instrument::SamplesData->new($self->{_io}, $self, $self->{_root});
    }
}

sub header_size {
    my ($self) = @_;
    return $self->{header_size};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub samples_headers {
    my ($self) = @_;
    return $self->{samples_headers};
}

sub samples {
    my ($self) = @_;
    return $self->{samples};
}

sub _raw_header {
    my ($self) = @_;
    return $self->{_raw_header};
}

########################################################################
package Xm::Instrument::Header;

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

    $self->{name} = Encode::decode("utf-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(22), 0, 0));
    $self->{type} = $self->{_io}->read_u1();
    $self->{number_of_samples} = $self->{_io}->read_u2le();
    if ($self->number_of_samples() > 0) {
        $self->{extra_header} = Xm::Instrument::ExtraHeader->new($self->{_io}, $self, $self->{_root});
    }
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub number_of_samples {
    my ($self) = @_;
    return $self->{number_of_samples};
}

sub extra_header {
    my ($self) = @_;
    return $self->{extra_header};
}

########################################################################
package Xm::Instrument::ExtraHeader;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TYPE_TRUE = 0;
our $TYPE_SUSTAIN = 1;
our $TYPE_LOOP = 2;

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

    $self->{sample_header_size} = $self->{_io}->read_u4le();
    $self->{sample_number_for_all_notes} = ();
    my $n_sample_number_for_all_notes = 96;
    for (my $i = 0; $i < $n_sample_number_for_all_notes; $i++) {
        $self->{sample_number_for_all_notes}[$i] = $self->{_io}->read_u1();
    }
    $self->{points_for_volume_envelope} = ();
    my $n_points_for_volume_envelope = 12;
    for (my $i = 0; $i < $n_points_for_volume_envelope; $i++) {
        $self->{points_for_volume_envelope}[$i] = Xm::Instrument::ExtraHeader::EnvelopePoint->new($self->{_io}, $self, $self->{_root});
    }
    $self->{points_for_panning_envelope} = ();
    my $n_points_for_panning_envelope = 12;
    for (my $i = 0; $i < $n_points_for_panning_envelope; $i++) {
        $self->{points_for_panning_envelope}[$i] = Xm::Instrument::ExtraHeader::EnvelopePoint->new($self->{_io}, $self, $self->{_root});
    }
    $self->{number_of_volume_points} = $self->{_io}->read_u1();
    $self->{number_of_panning_points} = $self->{_io}->read_u1();
    $self->{volume_sustain_point} = $self->{_io}->read_u1();
    $self->{volume_loop_start_point} = $self->{_io}->read_u1();
    $self->{volume_loop_end_point} = $self->{_io}->read_u1();
    $self->{panning_sustain_point} = $self->{_io}->read_u1();
    $self->{panning_loop_start_point} = $self->{_io}->read_u1();
    $self->{panning_loop_end_point} = $self->{_io}->read_u1();
    $self->{volume_type} = $self->{_io}->read_u1();
    $self->{panning_type} = $self->{_io}->read_u1();
    $self->{vibrato_type} = $self->{_io}->read_u1();
    $self->{vibrato_sweep} = $self->{_io}->read_u1();
    $self->{vibrato_depth} = $self->{_io}->read_u1();
    $self->{vibrato_rate} = $self->{_io}->read_u1();
    $self->{volume_fadeout} = $self->{_io}->read_u2le();
    $self->{reserved} = $self->{_io}->read_u2le();
}

sub sample_header_size {
    my ($self) = @_;
    return $self->{sample_header_size};
}

sub sample_number_for_all_notes {
    my ($self) = @_;
    return $self->{sample_number_for_all_notes};
}

sub points_for_volume_envelope {
    my ($self) = @_;
    return $self->{points_for_volume_envelope};
}

sub points_for_panning_envelope {
    my ($self) = @_;
    return $self->{points_for_panning_envelope};
}

sub number_of_volume_points {
    my ($self) = @_;
    return $self->{number_of_volume_points};
}

sub number_of_panning_points {
    my ($self) = @_;
    return $self->{number_of_panning_points};
}

sub volume_sustain_point {
    my ($self) = @_;
    return $self->{volume_sustain_point};
}

sub volume_loop_start_point {
    my ($self) = @_;
    return $self->{volume_loop_start_point};
}

sub volume_loop_end_point {
    my ($self) = @_;
    return $self->{volume_loop_end_point};
}

sub panning_sustain_point {
    my ($self) = @_;
    return $self->{panning_sustain_point};
}

sub panning_loop_start_point {
    my ($self) = @_;
    return $self->{panning_loop_start_point};
}

sub panning_loop_end_point {
    my ($self) = @_;
    return $self->{panning_loop_end_point};
}

sub volume_type {
    my ($self) = @_;
    return $self->{volume_type};
}

sub panning_type {
    my ($self) = @_;
    return $self->{panning_type};
}

sub vibrato_type {
    my ($self) = @_;
    return $self->{vibrato_type};
}

sub vibrato_sweep {
    my ($self) = @_;
    return $self->{vibrato_sweep};
}

sub vibrato_depth {
    my ($self) = @_;
    return $self->{vibrato_depth};
}

sub vibrato_rate {
    my ($self) = @_;
    return $self->{vibrato_rate};
}

sub volume_fadeout {
    my ($self) = @_;
    return $self->{volume_fadeout};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package Xm::Instrument::ExtraHeader::EnvelopePoint;

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

    $self->{x} = $self->{_io}->read_u2le();
    $self->{y} = $self->{_io}->read_u2le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package Xm::Instrument::SamplesData;

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

    $self->{samples_data} = ();
    my $n_samples_data = @{$self->_parent()->samples_headers()}[$self->index()]->sample_length();
    for (my $i = 0; $i < $n_samples_data; $i++) {
        my $_on = @{$self->_parent()->samples_headers()}[$self->index()]->type()->is_sample_data_16_bit();
        if ($_on == 1) {
            $self->{samples_data}[$i] = $self->{_io}->read_u2le();
        }
        elsif ($_on == 0) {
            $self->{samples_data}[$i] = $self->{_io}->read_u1();
        }
    }
}

sub samples_data {
    my ($self) = @_;
    return $self->{samples_data};
}

sub index {
    my ($self) = @_;
    return $self->{index};
}

########################################################################
package Xm::Instrument::SampleHeader;

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

    $self->{sample_length} = $self->{_io}->read_u4le();
    $self->{sample_loop_start} = $self->{_io}->read_u4le();
    $self->{sample_loop_length} = $self->{_io}->read_u4le();
    $self->{volume} = $self->{_io}->read_u1();
    $self->{fine_tune} = $self->{_io}->read_s1();
    $self->{type} = Xm::Instrument::SampleHeader::LoopType->new($self->{_io}, $self, $self->{_root});
    $self->{panning} = $self->{_io}->read_u1();
    $self->{relative_note_number} = $self->{_io}->read_s1();
    $self->{reserved} = $self->{_io}->read_u1();
    $self->{name} = Encode::decode("utf-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(22), 0, 0));
}

sub sample_length {
    my ($self) = @_;
    return $self->{sample_length};
}

sub sample_loop_start {
    my ($self) = @_;
    return $self->{sample_loop_start};
}

sub sample_loop_length {
    my ($self) = @_;
    return $self->{sample_loop_length};
}

sub volume {
    my ($self) = @_;
    return $self->{volume};
}

sub fine_tune {
    my ($self) = @_;
    return $self->{fine_tune};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub panning {
    my ($self) = @_;
    return $self->{panning};
}

sub relative_note_number {
    my ($self) = @_;
    return $self->{relative_note_number};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

########################################################################
package Xm::Instrument::SampleHeader::LoopType;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $LOOP_TYPE_NONE = 0;
our $LOOP_TYPE_FORWARD = 1;
our $LOOP_TYPE_PING_PONG = 2;

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

    $self->{reserved0} = $self->{_io}->read_bits_int(3);
    $self->{is_sample_data_16_bit} = $self->{_io}->read_bits_int(1);
    $self->{reserved1} = $self->{_io}->read_bits_int(2);
    $self->{loop_type} = $self->{_io}->read_bits_int(2);
}

sub reserved0 {
    my ($self) = @_;
    return $self->{reserved0};
}

sub is_sample_data_16_bit {
    my ($self) = @_;
    return $self->{is_sample_data_16_bit};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub loop_type {
    my ($self) = @_;
    return $self->{loop_type};
}

1;
