# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package FasttrackerXmModule;

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

    $self->{preheader} = FasttrackerXmModule::Preheader->new($self->{_io}, $self, $self->{_root});
    $self->{_raw_header} = $self->{_io}->read_bytes(($self->preheader()->header_size() - 4));
    my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
    $self->{header} = FasttrackerXmModule::Header->new($io__raw_header, $self, $self->{_root});
    $self->{patterns} = ();
    my $n_patterns = $self->header()->num_patterns();
    for (my $i = 0; $i < $n_patterns; $i++) {
        push @{$self->{patterns}}, FasttrackerXmModule::Pattern->new($self->{_io}, $self, $self->{_root});
    }
    $self->{instruments} = ();
    my $n_instruments = $self->header()->num_instruments();
    for (my $i = 0; $i < $n_instruments; $i++) {
        push @{$self->{instruments}}, FasttrackerXmModule::Instrument->new($self->{_io}, $self, $self->{_root});
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
package FasttrackerXmModule::Preheader;

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

    $self->{signature0} = $self->{_io}->read_bytes(17);
    $self->{module_name} = Encode::decode("utf-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(20), 0, 0));
    $self->{signature1} = $self->{_io}->read_bytes(1);
    $self->{tracker_name} = Encode::decode("utf-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(20), 0, 0));
    $self->{version_number} = FasttrackerXmModule::Preheader::Version->new($self->{_io}, $self, $self->{_root});
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
package FasttrackerXmModule::Preheader::Version;

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
package FasttrackerXmModule::Pattern;

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

    $self->{header} = FasttrackerXmModule::Pattern::Header->new($self->{_io}, $self, $self->{_root});
    $self->{packed_data} = $self->{_io}->read_bytes($self->header()->main()->len_packed_pattern());
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
package FasttrackerXmModule::Pattern::Header;

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
    $self->{main} = FasttrackerXmModule::Pattern::Header::HeaderMain->new($io__raw_main, $self, $self->{_root});
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
package FasttrackerXmModule::Pattern::Header::HeaderMain;

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
        $self->{num_rows_raw} = $self->{_io}->read_u1();
    }
    else {
        $self->{num_rows_raw} = $self->{_io}->read_u2le();
    }
    $self->{len_packed_pattern} = $self->{_io}->read_u2le();
}

sub num_rows {
    my ($self) = @_;
    return $self->{num_rows} if ($self->{num_rows});
    $self->{num_rows} = ($self->num_rows_raw() + ($self->_root()->preheader()->version_number()->value() == 258 ? 1 : 0));
    return $self->{num_rows};
}

sub packing_type {
    my ($self) = @_;
    return $self->{packing_type};
}

sub num_rows_raw {
    my ($self) = @_;
    return $self->{num_rows_raw};
}

sub len_packed_pattern {
    my ($self) = @_;
    return $self->{len_packed_pattern};
}

########################################################################
package FasttrackerXmModule::Flags;

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

    $self->{reserved} = $self->{_io}->read_bits_int_be(15);
    $self->{freq_table_type} = $self->{_io}->read_bits_int_be(1);
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
package FasttrackerXmModule::Header;

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
    $self->{num_channels} = $self->{_io}->read_u2le();
    $self->{num_patterns} = $self->{_io}->read_u2le();
    $self->{num_instruments} = $self->{_io}->read_u2le();
    $self->{flags} = FasttrackerXmModule::Flags->new($self->{_io}, $self, $self->{_root});
    $self->{default_tempo} = $self->{_io}->read_u2le();
    $self->{default_bpm} = $self->{_io}->read_u2le();
    $self->{pattern_order_table} = ();
    my $n_pattern_order_table = 256;
    for (my $i = 0; $i < $n_pattern_order_table; $i++) {
        push @{$self->{pattern_order_table}}, $self->{_io}->read_u1();
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

sub num_channels {
    my ($self) = @_;
    return $self->{num_channels};
}

sub num_patterns {
    my ($self) = @_;
    return $self->{num_patterns};
}

sub num_instruments {
    my ($self) = @_;
    return $self->{num_instruments};
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
package FasttrackerXmModule::Instrument;

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
    $self->{header} = FasttrackerXmModule::Instrument::Header->new($io__raw_header, $self, $self->{_root});
    $self->{samples_headers} = ();
    my $n_samples_headers = $self->header()->num_samples();
    for (my $i = 0; $i < $n_samples_headers; $i++) {
        push @{$self->{samples_headers}}, FasttrackerXmModule::Instrument::SampleHeader->new($self->{_io}, $self, $self->{_root});
    }
    $self->{samples} = ();
    my $n_samples = $self->header()->num_samples();
    for (my $i = 0; $i < $n_samples; $i++) {
        push @{$self->{samples}}, FasttrackerXmModule::Instrument::SamplesData->new($self->{_io}, $self, $self->{_root});
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
package FasttrackerXmModule::Instrument::Header;

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
    $self->{num_samples} = $self->{_io}->read_u2le();
    if ($self->num_samples() > 0) {
        $self->{extra_header} = FasttrackerXmModule::Instrument::ExtraHeader->new($self->{_io}, $self, $self->{_root});
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

sub num_samples {
    my ($self) = @_;
    return $self->{num_samples};
}

sub extra_header {
    my ($self) = @_;
    return $self->{extra_header};
}

########################################################################
package FasttrackerXmModule::Instrument::ExtraHeader;

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

    $self->{len_sample_header} = $self->{_io}->read_u4le();
    $self->{idx_sample_per_note} = ();
    my $n_idx_sample_per_note = 96;
    for (my $i = 0; $i < $n_idx_sample_per_note; $i++) {
        push @{$self->{idx_sample_per_note}}, $self->{_io}->read_u1();
    }
    $self->{volume_points} = ();
    my $n_volume_points = 12;
    for (my $i = 0; $i < $n_volume_points; $i++) {
        push @{$self->{volume_points}}, FasttrackerXmModule::Instrument::ExtraHeader::EnvelopePoint->new($self->{_io}, $self, $self->{_root});
    }
    $self->{panning_points} = ();
    my $n_panning_points = 12;
    for (my $i = 0; $i < $n_panning_points; $i++) {
        push @{$self->{panning_points}}, FasttrackerXmModule::Instrument::ExtraHeader::EnvelopePoint->new($self->{_io}, $self, $self->{_root});
    }
    $self->{num_volume_points} = $self->{_io}->read_u1();
    $self->{num_panning_points} = $self->{_io}->read_u1();
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

sub len_sample_header {
    my ($self) = @_;
    return $self->{len_sample_header};
}

sub idx_sample_per_note {
    my ($self) = @_;
    return $self->{idx_sample_per_note};
}

sub volume_points {
    my ($self) = @_;
    return $self->{volume_points};
}

sub panning_points {
    my ($self) = @_;
    return $self->{panning_points};
}

sub num_volume_points {
    my ($self) = @_;
    return $self->{num_volume_points};
}

sub num_panning_points {
    my ($self) = @_;
    return $self->{num_panning_points};
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
package FasttrackerXmModule::Instrument::ExtraHeader::EnvelopePoint;

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
package FasttrackerXmModule::Instrument::SamplesData;

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

    $self->{data} = $self->{_io}->read_bytes(($self->header()->sample_length() * ($self->header()->type()->is_sample_data_16_bit() ? 2 : 1)));
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

########################################################################
package FasttrackerXmModule::Instrument::SampleHeader;

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
    $self->{type} = FasttrackerXmModule::Instrument::SampleHeader::LoopType->new($self->{_io}, $self, $self->{_root});
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
package FasttrackerXmModule::Instrument::SampleHeader::LoopType;

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

    $self->{reserved0} = $self->{_io}->read_bits_int_be(3);
    $self->{is_sample_data_16_bit} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved1} = $self->{_io}->read_bits_int_be(2);
    $self->{loop_type} = $self->{_io}->read_bits_int_be(2);
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
