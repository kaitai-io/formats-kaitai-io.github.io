# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package NtMdt;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $ADC_MODE_HEIGHT = 0;
our $ADC_MODE_DFL = 1;
our $ADC_MODE_LATERAL_F = 2;
our $ADC_MODE_BIAS_V = 3;
our $ADC_MODE_CURRENT = 4;
our $ADC_MODE_FB_OUT = 5;
our $ADC_MODE_MAG = 6;
our $ADC_MODE_MAG_SIN = 7;
our $ADC_MODE_MAG_COS = 8;
our $ADC_MODE_RMS = 9;
our $ADC_MODE_CALC_MAG = 10;
our $ADC_MODE_PHASE1 = 11;
our $ADC_MODE_PHASE2 = 12;
our $ADC_MODE_CALC_PHASE = 13;
our $ADC_MODE_EX1 = 14;
our $ADC_MODE_EX2 = 15;
our $ADC_MODE_HV_X = 16;
our $ADC_MODE_HV_Y = 17;
our $ADC_MODE_SNAP_BACK = 18;
our $ADC_MODE_FALSE = 255;

our $CONSTS_FRAME_MODE_SIZE = 8;
our $CONSTS_FRAME_HEADER_SIZE = 22;
our $CONSTS_AXIS_SCALES_SIZE = 30;
our $CONSTS_FILE_HEADER_SIZE = 32;
our $CONSTS_SPECTRO_VARS_MIN_SIZE = 38;
our $CONSTS_SCAN_VARS_MIN_SIZE = 77;

our $DATA_TYPE_FLOATFIX = -65544;
our $DATA_TYPE_FLOAT80 = -16138;
our $DATA_TYPE_FLOAT64 = -13320;
our $DATA_TYPE_FLOAT48 = -9990;
our $DATA_TYPE_FLOAT32 = -5892;
our $DATA_TYPE_INT64 = -8;
our $DATA_TYPE_INT32 = -4;
our $DATA_TYPE_INT16 = -2;
our $DATA_TYPE_INT8 = -1;
our $DATA_TYPE_UNKNOWN0 = 0;
our $DATA_TYPE_UINT8 = 1;
our $DATA_TYPE_UINT16 = 2;
our $DATA_TYPE_UINT32 = 4;
our $DATA_TYPE_UINT64 = 8;

our $SPM_MODE_CONSTANT_FORCE = 0;
our $SPM_MODE_CONTACT_CONSTANT_HEIGHT = 1;
our $SPM_MODE_CONTACT_ERROR = 2;
our $SPM_MODE_LATERAL_FORCE = 3;
our $SPM_MODE_FORCE_MODULATION = 4;
our $SPM_MODE_SPREADING_RESISTANCE_IMAGING = 5;
our $SPM_MODE_SEMICONTACT_TOPOGRAPHY = 6;
our $SPM_MODE_SEMICONTACT_ERROR = 7;
our $SPM_MODE_PHASE_CONTRAST = 8;
our $SPM_MODE_AC_MAGNETIC_FORCE = 9;
our $SPM_MODE_DC_MAGNETIC_FORCE = 10;
our $SPM_MODE_ELECTROSTATIC_FORCE = 11;
our $SPM_MODE_CAPACITANCE_CONTRAST = 12;
our $SPM_MODE_KELVIN_PROBE = 13;
our $SPM_MODE_CONSTANT_CURRENT = 14;
our $SPM_MODE_BARRIER_HEIGHT = 15;
our $SPM_MODE_CONSTANT_HEIGHT = 16;
our $SPM_MODE_AFAM = 17;
our $SPM_MODE_CONTACT_EFM = 18;
our $SPM_MODE_SHEAR_FORCE_TOPOGRAPHY = 19;
our $SPM_MODE_SFOM = 20;
our $SPM_MODE_CONTACT_CAPACITANCE = 21;
our $SPM_MODE_SNOM_TRANSMISSION = 22;
our $SPM_MODE_SNOM_REFLECTION = 23;
our $SPM_MODE_SNOM_ALL = 24;
our $SPM_MODE_SNOM = 25;

our $SPM_TECHNIQUE_CONTACT_MODE = 0;
our $SPM_TECHNIQUE_SEMICONTACT_MODE = 1;
our $SPM_TECHNIQUE_TUNNEL_CURRENT = 2;
our $SPM_TECHNIQUE_SNOM = 3;

our $UNIT_RAMAN_SHIFT = -10;
our $UNIT_RESERVED0 = -9;
our $UNIT_RESERVED1 = -8;
our $UNIT_RESERVED2 = -7;
our $UNIT_RESERVED3 = -6;
our $UNIT_METER = -5;
our $UNIT_CENTI_METER = -4;
our $UNIT_MILLI_METER = -3;
our $UNIT_MICRO_METER = -2;
our $UNIT_NANO_METER = -1;
our $UNIT_ANGSTROM = 0;
our $UNIT_NANO_AMPERE = 1;
our $UNIT_VOLT = 2;
our $UNIT_NONE = 3;
our $UNIT_KILO_HERTZ = 4;
our $UNIT_DEGREES = 5;
our $UNIT_PERCENT = 6;
our $UNIT_CELSIUS_DEGREE = 7;
our $UNIT_VOLT_HIGH = 8;
our $UNIT_SECOND = 9;
our $UNIT_MILLI_SECOND = 10;
our $UNIT_MICRO_SECOND = 11;
our $UNIT_NANO_SECOND = 12;
our $UNIT_COUNTS = 13;
our $UNIT_PIXELS = 14;
our $UNIT_RESERVED_SFOM0 = 15;
our $UNIT_RESERVED_SFOM1 = 16;
our $UNIT_RESERVED_SFOM2 = 17;
our $UNIT_RESERVED_SFOM3 = 18;
our $UNIT_RESERVED_SFOM4 = 19;
our $UNIT_AMPERE2 = 20;
our $UNIT_MILLI_AMPERE = 21;
our $UNIT_MICRO_AMPERE = 22;
our $UNIT_NANO_AMPERE2 = 23;
our $UNIT_PICO_AMPERE = 24;
our $UNIT_VOLT2 = 25;
our $UNIT_MILLI_VOLT = 26;
our $UNIT_MICRO_VOLT = 27;
our $UNIT_NANO_VOLT = 28;
our $UNIT_PICO_VOLT = 29;
our $UNIT_NEWTON = 30;
our $UNIT_MILLI_NEWTON = 31;
our $UNIT_MICRO_NEWTON = 32;
our $UNIT_NANO_NEWTON = 33;
our $UNIT_PICO_NEWTON = 34;
our $UNIT_RESERVED_DOS0 = 35;
our $UNIT_RESERVED_DOS1 = 36;
our $UNIT_RESERVED_DOS2 = 37;
our $UNIT_RESERVED_DOS3 = 38;
our $UNIT_RESERVED_DOS4 = 39;

our $XML_PARAM_TYPE_NONE = 0;
our $XML_PARAM_TYPE_LASER_WAVELENGTH = 1;
our $XML_PARAM_TYPE_UNITS = 2;
our $XML_PARAM_TYPE_DATA_ARRAY = 255;

our $XML_SCAN_LOCATION_HLT = 0;
our $XML_SCAN_LOCATION_HLB = 1;
our $XML_SCAN_LOCATION_HRT = 2;
our $XML_SCAN_LOCATION_HRB = 3;
our $XML_SCAN_LOCATION_VLT = 4;
our $XML_SCAN_LOCATION_VLB = 5;
our $XML_SCAN_LOCATION_VRT = 6;
our $XML_SCAN_LOCATION_VRB = 7;

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

    $self->{signature} = $self->{_io}->read_bytes(4);
    $self->{size} = $self->{_io}->read_u4le();
    $self->{reserved0} = $self->{_io}->read_bytes(4);
    $self->{last_frame} = $self->{_io}->read_u2le();
    $self->{reserved1} = $self->{_io}->read_bytes(18);
    $self->{wrond_doc} = $self->{_io}->read_bytes(1);
    $self->{_raw_frames} = $self->{_io}->read_bytes($self->size());
    my $io__raw_frames = IO::KaitaiStruct::Stream->new($self->{_raw_frames});
    $self->{frames} = NtMdt::Framez->new($io__raw_frames, $self, $self->{_root});
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub reserved0 {
    my ($self) = @_;
    return $self->{reserved0};
}

sub last_frame {
    my ($self) = @_;
    return $self->{last_frame};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub wrond_doc {
    my ($self) = @_;
    return $self->{wrond_doc};
}

sub frames {
    my ($self) = @_;
    return $self->{frames};
}

sub _raw_frames {
    my ($self) = @_;
    return $self->{_raw_frames};
}

########################################################################
package NtMdt::Frame;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $FRAME_TYPE_SCANNED = 0;
our $FRAME_TYPE_SPECTROSCOPY = 1;
our $FRAME_TYPE_TEXT = 3;
our $FRAME_TYPE_OLD_MDA = 105;
our $FRAME_TYPE_MDA = 106;
our $FRAME_TYPE_PALETTE = 107;
our $FRAME_TYPE_CURVES_NEW = 190;
our $FRAME_TYPE_CURVES = 201;

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

    $self->{size} = $self->{_io}->read_u4le();
    $self->{_raw_main} = $self->{_io}->read_bytes($self->size() - 4);
    my $io__raw_main = IO::KaitaiStruct::Stream->new($self->{_raw_main});
    $self->{main} = NtMdt::Frame::FrameMain->new($io__raw_main, $self, $self->{_root});
}

sub size {
    my ($self) = @_;
    return $self->{size};
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
package NtMdt::Frame::AxisScale;

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

    $self->{offset} = $self->{_io}->read_f4le();
    $self->{step} = $self->{_io}->read_f4le();
    $self->{unit} = $self->{_io}->read_s2le();
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub step {
    my ($self) = @_;
    return $self->{step};
}

sub unit {
    my ($self) = @_;
    return $self->{unit};
}

########################################################################
package NtMdt::Frame::DateTime;

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

    $self->{date} = NtMdt::Frame::DateTime::Date->new($self->{_io}, $self, $self->{_root});
    $self->{time} = NtMdt::Frame::DateTime::Time->new($self->{_io}, $self, $self->{_root});
}

sub date {
    my ($self) = @_;
    return $self->{date};
}

sub time {
    my ($self) = @_;
    return $self->{time};
}

########################################################################
package NtMdt::Frame::DateTime::Date;

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

    $self->{year} = $self->{_io}->read_u2le();
    $self->{month} = $self->{_io}->read_u2le();
    $self->{day} = $self->{_io}->read_u2le();
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

########################################################################
package NtMdt::Frame::DateTime::Time;

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

    $self->{hour} = $self->{_io}->read_u2le();
    $self->{min} = $self->{_io}->read_u2le();
    $self->{sec} = $self->{_io}->read_u2le();
}

sub hour {
    my ($self) = @_;
    return $self->{hour};
}

sub min {
    my ($self) = @_;
    return $self->{min};
}

sub sec {
    my ($self) = @_;
    return $self->{sec};
}

########################################################################
package NtMdt::Frame::Dots;

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

    $self->{fm_ndots} = $self->{_io}->read_u2le();
    if ($self->fm_ndots() > 0) {
        $self->{coord_header} = NtMdt::Frame::Dots::DotsHeader->new($self->{_io}, $self, $self->{_root});
    }
    $self->{coordinates} = [];
    my $n_coordinates = $self->fm_ndots();
    for (my $i = 0; $i < $n_coordinates; $i++) {
        push @{$self->{coordinates}}, NtMdt::Frame::Dots::DotsData->new($self->{_io}, $self, $self->{_root});
    }
    $self->{data} = [];
    my $n_data = $self->fm_ndots();
    for (my $i = 0; $i < $n_data; $i++) {
        push @{$self->{data}}, NtMdt::Frame::Dots::DataLinez->new($self->{_io}, $self, $self->{_root});
    }
}

sub fm_ndots {
    my ($self) = @_;
    return $self->{fm_ndots};
}

sub coord_header {
    my ($self) = @_;
    return $self->{coord_header};
}

sub coordinates {
    my ($self) = @_;
    return $self->{coordinates};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package NtMdt::Frame::Dots::DataLinez;

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

    $self->{forward} = [];
    my $n_forward = @{$self->_parent()->coordinates()}[$self->index()]->forward_size();
    for (my $i = 0; $i < $n_forward; $i++) {
        push @{$self->{forward}}, $self->{_io}->read_s2le();
    }
    $self->{backward} = [];
    my $n_backward = @{$self->_parent()->coordinates()}[$self->index()]->backward_size();
    for (my $i = 0; $i < $n_backward; $i++) {
        push @{$self->{backward}}, $self->{_io}->read_s2le();
    }
}

sub forward {
    my ($self) = @_;
    return $self->{forward};
}

sub backward {
    my ($self) = @_;
    return $self->{backward};
}

sub index {
    my ($self) = @_;
    return $self->{index};
}

########################################################################
package NtMdt::Frame::Dots::DotsData;

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

    $self->{coord_x} = $self->{_io}->read_f4le();
    $self->{coord_y} = $self->{_io}->read_f4le();
    $self->{forward_size} = $self->{_io}->read_s4le();
    $self->{backward_size} = $self->{_io}->read_s4le();
}

sub coord_x {
    my ($self) = @_;
    return $self->{coord_x};
}

sub coord_y {
    my ($self) = @_;
    return $self->{coord_y};
}

sub forward_size {
    my ($self) = @_;
    return $self->{forward_size};
}

sub backward_size {
    my ($self) = @_;
    return $self->{backward_size};
}

########################################################################
package NtMdt::Frame::Dots::DotsHeader;

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

    $self->{header_size} = $self->{_io}->read_s4le();
    $self->{_raw_header} = $self->{_io}->read_bytes($self->header_size());
    my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
    $self->{header} = NtMdt::Frame::Dots::DotsHeader::Header->new($io__raw_header, $self, $self->{_root});
}

sub header_size {
    my ($self) = @_;
    return $self->{header_size};
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
package NtMdt::Frame::Dots::DotsHeader::Header;

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

    $self->{coord_size} = $self->{_io}->read_s4le();
    $self->{version} = $self->{_io}->read_s4le();
    $self->{xyunits} = $self->{_io}->read_s2le();
}

sub coord_size {
    my ($self) = @_;
    return $self->{coord_size};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub xyunits {
    my ($self) = @_;
    return $self->{xyunits};
}

########################################################################
package NtMdt::Frame::FdCurvesNew;

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

    $self->{block_count} = $self->{_io}->read_u4le();
    $self->{blocks_headers} = [];
    my $n_blocks_headers = $self->block_count();
    for (my $i = 0; $i < $n_blocks_headers; $i++) {
        push @{$self->{blocks_headers}}, NtMdt::Frame::FdCurvesNew::BlockDescr->new($self->{_io}, $self, $self->{_root});
    }
    $self->{blocks_names} = [];
    my $n_blocks_names = $self->block_count();
    for (my $i = 0; $i < $n_blocks_names; $i++) {
        push @{$self->{blocks_names}}, Encode::decode("UTF-8", $self->{_io}->read_bytes(@{$self->blocks_headers()}[$i]->name_len()));
    }
    $self->{blocks_data} = [];
    my $n_blocks_data = $self->block_count();
    for (my $i = 0; $i < $n_blocks_data; $i++) {
        push @{$self->{blocks_data}}, $self->{_io}->read_bytes(@{$self->blocks_headers()}[$i]->len());
    }
}

sub block_count {
    my ($self) = @_;
    return $self->{block_count};
}

sub blocks_headers {
    my ($self) = @_;
    return $self->{blocks_headers};
}

sub blocks_names {
    my ($self) = @_;
    return $self->{blocks_names};
}

sub blocks_data {
    my ($self) = @_;
    return $self->{blocks_data};
}

########################################################################
package NtMdt::Frame::FdCurvesNew::BlockDescr;

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

    $self->{name_len} = $self->{_io}->read_u4le();
    $self->{len} = $self->{_io}->read_u4le();
}

sub name_len {
    my ($self) = @_;
    return $self->{name_len};
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

########################################################################
package NtMdt::Frame::FdMetaData;

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

    $self->{head_size} = $self->{_io}->read_u4le();
    $self->{tot_len} = $self->{_io}->read_u4le();
    $self->{guids} = [];
    my $n_guids = 2;
    for (my $i = 0; $i < $n_guids; $i++) {
        push @{$self->{guids}}, NtMdt::Uuid->new($self->{_io}, $self, $self->{_root});
    }
    $self->{frame_status} = $self->{_io}->read_bytes(4);
    $self->{name_size} = $self->{_io}->read_u4le();
    $self->{comm_size} = $self->{_io}->read_u4le();
    $self->{view_info_size} = $self->{_io}->read_u4le();
    $self->{spec_size} = $self->{_io}->read_u4le();
    $self->{source_info_size} = $self->{_io}->read_u4le();
    $self->{var_size} = $self->{_io}->read_u4le();
    $self->{data_offset} = $self->{_io}->read_u4le();
    $self->{data_size} = $self->{_io}->read_u4le();
    $self->{title} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->name_size()));
    $self->{xml} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->comm_size()));
    $self->{struct_len} = $self->{_io}->read_u4le();
    $self->{array_size} = $self->{_io}->read_u8le();
    $self->{cell_size} = $self->{_io}->read_u4le();
    $self->{n_dimensions} = $self->{_io}->read_u4le();
    $self->{n_mesurands} = $self->{_io}->read_u4le();
    $self->{dimensions} = [];
    my $n_dimensions = $self->n_dimensions();
    for (my $i = 0; $i < $n_dimensions; $i++) {
        push @{$self->{dimensions}}, NtMdt::Frame::FdMetaData::Calibration->new($self->{_io}, $self, $self->{_root});
    }
    $self->{mesurands} = [];
    my $n_mesurands = $self->n_mesurands();
    for (my $i = 0; $i < $n_mesurands; $i++) {
        push @{$self->{mesurands}}, NtMdt::Frame::FdMetaData::Calibration->new($self->{_io}, $self, $self->{_root});
    }
}

sub image {
    my ($self) = @_;
    return $self->{image} if ($self->{image});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->data_offset());
    $self->{_raw_image} = $self->{_io}->read_bytes($self->data_size());
    my $io__raw_image = IO::KaitaiStruct::Stream->new($self->{_raw_image});
    $self->{image} = NtMdt::Frame::FdMetaData::Image->new($io__raw_image, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{image};
}

sub head_size {
    my ($self) = @_;
    return $self->{head_size};
}

sub tot_len {
    my ($self) = @_;
    return $self->{tot_len};
}

sub guids {
    my ($self) = @_;
    return $self->{guids};
}

sub frame_status {
    my ($self) = @_;
    return $self->{frame_status};
}

sub name_size {
    my ($self) = @_;
    return $self->{name_size};
}

sub comm_size {
    my ($self) = @_;
    return $self->{comm_size};
}

sub view_info_size {
    my ($self) = @_;
    return $self->{view_info_size};
}

sub spec_size {
    my ($self) = @_;
    return $self->{spec_size};
}

sub source_info_size {
    my ($self) = @_;
    return $self->{source_info_size};
}

sub var_size {
    my ($self) = @_;
    return $self->{var_size};
}

sub data_offset {
    my ($self) = @_;
    return $self->{data_offset};
}

sub data_size {
    my ($self) = @_;
    return $self->{data_size};
}

sub title {
    my ($self) = @_;
    return $self->{title};
}

sub xml {
    my ($self) = @_;
    return $self->{xml};
}

sub struct_len {
    my ($self) = @_;
    return $self->{struct_len};
}

sub array_size {
    my ($self) = @_;
    return $self->{array_size};
}

sub cell_size {
    my ($self) = @_;
    return $self->{cell_size};
}

sub n_dimensions {
    my ($self) = @_;
    return $self->{n_dimensions};
}

sub n_mesurands {
    my ($self) = @_;
    return $self->{n_mesurands};
}

sub dimensions {
    my ($self) = @_;
    return $self->{dimensions};
}

sub mesurands {
    my ($self) = @_;
    return $self->{mesurands};
}

sub _raw_image {
    my ($self) = @_;
    return $self->{_raw_image};
}

########################################################################
package NtMdt::Frame::FdMetaData::Calibration;

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

    $self->{len_tot} = $self->{_io}->read_u4le();
    $self->{len_struct} = $self->{_io}->read_u4le();
    $self->{len_name} = $self->{_io}->read_u4le();
    $self->{len_comment} = $self->{_io}->read_u4le();
    $self->{len_unit} = $self->{_io}->read_u4le();
    $self->{si_unit} = $self->{_io}->read_u8le();
    $self->{accuracy} = $self->{_io}->read_f8le();
    $self->{function_id_and_dimensions} = $self->{_io}->read_u8le();
    $self->{bias} = $self->{_io}->read_f8le();
    $self->{scale} = $self->{_io}->read_f8le();
    $self->{min_index} = $self->{_io}->read_u8le();
    $self->{max_index} = $self->{_io}->read_u8le();
    $self->{data_type} = $self->{_io}->read_s4le();
    $self->{len_author} = $self->{_io}->read_u4le();
    $self->{name} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_name()));
    $self->{comment} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_comment()));
    $self->{unit} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_unit()));
    $self->{author} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_author()));
}

sub count {
    my ($self) = @_;
    return $self->{count} if ($self->{count});
    $self->{count} = ($self->max_index() - $self->min_index()) + 1;
    return $self->{count};
}

sub len_tot {
    my ($self) = @_;
    return $self->{len_tot};
}

sub len_struct {
    my ($self) = @_;
    return $self->{len_struct};
}

sub len_name {
    my ($self) = @_;
    return $self->{len_name};
}

sub len_comment {
    my ($self) = @_;
    return $self->{len_comment};
}

sub len_unit {
    my ($self) = @_;
    return $self->{len_unit};
}

sub si_unit {
    my ($self) = @_;
    return $self->{si_unit};
}

sub accuracy {
    my ($self) = @_;
    return $self->{accuracy};
}

sub function_id_and_dimensions {
    my ($self) = @_;
    return $self->{function_id_and_dimensions};
}

sub bias {
    my ($self) = @_;
    return $self->{bias};
}

sub scale {
    my ($self) = @_;
    return $self->{scale};
}

sub min_index {
    my ($self) = @_;
    return $self->{min_index};
}

sub max_index {
    my ($self) = @_;
    return $self->{max_index};
}

sub data_type {
    my ($self) = @_;
    return $self->{data_type};
}

sub len_author {
    my ($self) = @_;
    return $self->{len_author};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub comment {
    my ($self) = @_;
    return $self->{comment};
}

sub unit {
    my ($self) = @_;
    return $self->{unit};
}

sub author {
    my ($self) = @_;
    return $self->{author};
}

########################################################################
package NtMdt::Frame::FdMetaData::Image;

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

    $self->{image} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{image}}, NtMdt::Frame::FdMetaData::Image::Vec->new($self->{_io}, $self, $self->{_root});
    }
}

sub image {
    my ($self) = @_;
    return $self->{image};
}

########################################################################
package NtMdt::Frame::FdMetaData::Image::Vec;

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

    $self->{items} = [];
    my $n_items = $self->_parent()->_parent()->n_mesurands();
    for (my $i = 0; $i < $n_items; $i++) {
        my $_on = @{$self->_parent()->_parent()->mesurands()}[$i]->data_type();
        if ($_on == $NtMdt::DATA_TYPE_FLOAT32) {
            push @{$self->{items}}, $self->{_io}->read_f4le();
        }
        elsif ($_on == $NtMdt::DATA_TYPE_FLOAT64) {
            push @{$self->{items}}, $self->{_io}->read_f8le();
        }
        elsif ($_on == $NtMdt::DATA_TYPE_INT16) {
            push @{$self->{items}}, $self->{_io}->read_s2le();
        }
        elsif ($_on == $NtMdt::DATA_TYPE_INT32) {
            push @{$self->{items}}, $self->{_io}->read_s4le();
        }
        elsif ($_on == $NtMdt::DATA_TYPE_INT64) {
            push @{$self->{items}}, $self->{_io}->read_s8le();
        }
        elsif ($_on == $NtMdt::DATA_TYPE_INT8) {
            push @{$self->{items}}, $self->{_io}->read_s1();
        }
        elsif ($_on == $NtMdt::DATA_TYPE_UINT16) {
            push @{$self->{items}}, $self->{_io}->read_u2le();
        }
        elsif ($_on == $NtMdt::DATA_TYPE_UINT32) {
            push @{$self->{items}}, $self->{_io}->read_u4le();
        }
        elsif ($_on == $NtMdt::DATA_TYPE_UINT64) {
            push @{$self->{items}}, $self->{_io}->read_u8le();
        }
        elsif ($_on == $NtMdt::DATA_TYPE_UINT8) {
            push @{$self->{items}}, $self->{_io}->read_u1();
        }
    }
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

########################################################################
package NtMdt::Frame::FdScanned;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $INPUT_SIGNAL_EXTENSION_SLOT = 0;
our $INPUT_SIGNAL_BIAS_V = 1;
our $INPUT_SIGNAL_GROUND = 2;

our $LIFT_MODE_STEP = 0;
our $LIFT_MODE_FINE = 1;
our $LIFT_MODE_SLOPE = 2;

our $MODE_STM = 0;
our $MODE_AFM = 1;
our $MODE_UNKNOWN2 = 2;
our $MODE_UNKNOWN3 = 3;
our $MODE_UNKNOWN4 = 4;

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

    $self->{_raw_vars} = $self->{_io}->read_bytes($self->_parent()->var_size());
    my $io__raw_vars = IO::KaitaiStruct::Stream->new($self->{_raw_vars});
    $self->{vars} = NtMdt::Frame::FdScanned::Vars->new($io__raw_vars, $self, $self->{_root});
    if (0) {
        $self->{orig_format} = $self->{_io}->read_u4le();
    }
    if (0) {
        $self->{tune} = $self->{_io}->read_u4le();
    }
    if (0) {
        $self->{feedback_gain} = $self->{_io}->read_f8le();
    }
    if (0) {
        $self->{dac_scale} = $self->{_io}->read_s4le();
    }
    if (0) {
        $self->{overscan} = $self->{_io}->read_s4le();
    }
    $self->{fm_mode} = $self->{_io}->read_u2le();
    $self->{fm_xres} = $self->{_io}->read_u2le();
    $self->{fm_yres} = $self->{_io}->read_u2le();
    $self->{dots} = NtMdt::Frame::Dots->new($self->{_io}, $self, $self->{_root});
    $self->{image} = [];
    my $n_image = $self->fm_xres() * $self->fm_yres();
    for (my $i = 0; $i < $n_image; $i++) {
        push @{$self->{image}}, $self->{_io}->read_s2le();
    }
    $self->{title} = NtMdt::Title->new($self->{_io}, $self, $self->{_root});
    $self->{xml} = NtMdt::Xml->new($self->{_io}, $self, $self->{_root});
}

sub vars {
    my ($self) = @_;
    return $self->{vars};
}

sub orig_format {
    my ($self) = @_;
    return $self->{orig_format};
}

sub tune {
    my ($self) = @_;
    return $self->{tune};
}

sub feedback_gain {
    my ($self) = @_;
    return $self->{feedback_gain};
}

sub dac_scale {
    my ($self) = @_;
    return $self->{dac_scale};
}

sub overscan {
    my ($self) = @_;
    return $self->{overscan};
}

sub fm_mode {
    my ($self) = @_;
    return $self->{fm_mode};
}

sub fm_xres {
    my ($self) = @_;
    return $self->{fm_xres};
}

sub fm_yres {
    my ($self) = @_;
    return $self->{fm_yres};
}

sub dots {
    my ($self) = @_;
    return $self->{dots};
}

sub image {
    my ($self) = @_;
    return $self->{image};
}

sub title {
    my ($self) = @_;
    return $self->{title};
}

sub xml {
    my ($self) = @_;
    return $self->{xml};
}

sub _raw_vars {
    my ($self) = @_;
    return $self->{_raw_vars};
}

########################################################################
package NtMdt::Frame::FdScanned::Dot;

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

    $self->{x} = $self->{_io}->read_s2le();
    $self->{y} = $self->{_io}->read_s2le();
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
package NtMdt::Frame::FdScanned::ScanDir;

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

    $self->{unkn} = $self->{_io}->read_bits_int_be(4);
    $self->{double_pass} = $self->{_io}->read_bits_int_be(1);
    $self->{bottom} = $self->{_io}->read_bits_int_be(1);
    $self->{left} = $self->{_io}->read_bits_int_be(1);
    $self->{horizontal} = $self->{_io}->read_bits_int_be(1);
}

sub unkn {
    my ($self) = @_;
    return $self->{unkn};
}

sub double_pass {
    my ($self) = @_;
    return $self->{double_pass};
}

sub bottom {
    my ($self) = @_;
    return $self->{bottom};
}

sub left {
    my ($self) = @_;
    return $self->{left};
}

sub horizontal {
    my ($self) = @_;
    return $self->{horizontal};
}

########################################################################
package NtMdt::Frame::FdScanned::Vars;

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

    $self->{x_scale} = NtMdt::Frame::AxisScale->new($self->{_io}, $self, $self->{_root});
    $self->{y_scale} = NtMdt::Frame::AxisScale->new($self->{_io}, $self, $self->{_root});
    $self->{z_scale} = NtMdt::Frame::AxisScale->new($self->{_io}, $self, $self->{_root});
    $self->{channel_index} = $self->{_io}->read_u1();
    $self->{mode} = $self->{_io}->read_u1();
    $self->{xres} = $self->{_io}->read_u2le();
    $self->{yres} = $self->{_io}->read_u2le();
    $self->{ndacq} = $self->{_io}->read_u2le();
    $self->{step_length} = $self->{_io}->read_f4le();
    $self->{adt} = $self->{_io}->read_u2le();
    $self->{adc_gain_amp_log10} = $self->{_io}->read_u1();
    $self->{adc_index} = $self->{_io}->read_u1();
    $self->{input_signal_or_version} = $self->{_io}->read_u1();
    $self->{substr_plane_order_or_pass_num} = $self->{_io}->read_u1();
    $self->{scan_dir} = NtMdt::Frame::FdScanned::ScanDir->new($self->{_io}, $self, $self->{_root});
    $self->{power_of_2} = $self->{_io}->read_u1();
    $self->{velocity} = $self->{_io}->read_f4le();
    $self->{setpoint} = $self->{_io}->read_f4le();
    $self->{bias_voltage} = $self->{_io}->read_f4le();
    $self->{draw} = $self->{_io}->read_u1();
    $self->{reserved} = $self->{_io}->read_u1();
    $self->{xoff} = $self->{_io}->read_s4le();
    $self->{yoff} = $self->{_io}->read_s4le();
    $self->{nl_corr} = $self->{_io}->read_u1();
}

sub x_scale {
    my ($self) = @_;
    return $self->{x_scale};
}

sub y_scale {
    my ($self) = @_;
    return $self->{y_scale};
}

sub z_scale {
    my ($self) = @_;
    return $self->{z_scale};
}

sub channel_index {
    my ($self) = @_;
    return $self->{channel_index};
}

sub mode {
    my ($self) = @_;
    return $self->{mode};
}

sub xres {
    my ($self) = @_;
    return $self->{xres};
}

sub yres {
    my ($self) = @_;
    return $self->{yres};
}

sub ndacq {
    my ($self) = @_;
    return $self->{ndacq};
}

sub step_length {
    my ($self) = @_;
    return $self->{step_length};
}

sub adt {
    my ($self) = @_;
    return $self->{adt};
}

sub adc_gain_amp_log10 {
    my ($self) = @_;
    return $self->{adc_gain_amp_log10};
}

sub adc_index {
    my ($self) = @_;
    return $self->{adc_index};
}

sub input_signal_or_version {
    my ($self) = @_;
    return $self->{input_signal_or_version};
}

sub substr_plane_order_or_pass_num {
    my ($self) = @_;
    return $self->{substr_plane_order_or_pass_num};
}

sub scan_dir {
    my ($self) = @_;
    return $self->{scan_dir};
}

sub power_of_2 {
    my ($self) = @_;
    return $self->{power_of_2};
}

sub velocity {
    my ($self) = @_;
    return $self->{velocity};
}

sub setpoint {
    my ($self) = @_;
    return $self->{setpoint};
}

sub bias_voltage {
    my ($self) = @_;
    return $self->{bias_voltage};
}

sub draw {
    my ($self) = @_;
    return $self->{draw};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub xoff {
    my ($self) = @_;
    return $self->{xoff};
}

sub yoff {
    my ($self) = @_;
    return $self->{yoff};
}

sub nl_corr {
    my ($self) = @_;
    return $self->{nl_corr};
}

########################################################################
package NtMdt::Frame::FdSpectroscopy;

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

    $self->{_raw_vars} = $self->{_io}->read_bytes($self->_parent()->var_size());
    my $io__raw_vars = IO::KaitaiStruct::Stream->new($self->{_raw_vars});
    $self->{vars} = NtMdt::Frame::FdSpectroscopy::Vars->new($io__raw_vars, $self, $self->{_root});
    $self->{fm_mode} = $self->{_io}->read_u2le();
    $self->{fm_xres} = $self->{_io}->read_u2le();
    $self->{fm_yres} = $self->{_io}->read_u2le();
    $self->{dots} = NtMdt::Frame::Dots->new($self->{_io}, $self, $self->{_root});
    $self->{data} = [];
    my $n_data = $self->fm_xres() * $self->fm_yres();
    for (my $i = 0; $i < $n_data; $i++) {
        push @{$self->{data}}, $self->{_io}->read_s2le();
    }
    $self->{title} = NtMdt::Title->new($self->{_io}, $self, $self->{_root});
    $self->{xml} = NtMdt::Xml->new($self->{_io}, $self, $self->{_root});
}

sub vars {
    my ($self) = @_;
    return $self->{vars};
}

sub fm_mode {
    my ($self) = @_;
    return $self->{fm_mode};
}

sub fm_xres {
    my ($self) = @_;
    return $self->{fm_xres};
}

sub fm_yres {
    my ($self) = @_;
    return $self->{fm_yres};
}

sub dots {
    my ($self) = @_;
    return $self->{dots};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub title {
    my ($self) = @_;
    return $self->{title};
}

sub xml {
    my ($self) = @_;
    return $self->{xml};
}

sub _raw_vars {
    my ($self) = @_;
    return $self->{_raw_vars};
}

########################################################################
package NtMdt::Frame::FdSpectroscopy::Vars;

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

    $self->{x_scale} = NtMdt::Frame::AxisScale->new($self->{_io}, $self, $self->{_root});
    $self->{y_scale} = NtMdt::Frame::AxisScale->new($self->{_io}, $self, $self->{_root});
    $self->{z_scale} = NtMdt::Frame::AxisScale->new($self->{_io}, $self, $self->{_root});
    $self->{sp_mode} = $self->{_io}->read_u2le();
    $self->{sp_filter} = $self->{_io}->read_u2le();
    $self->{u_begin} = $self->{_io}->read_f4le();
    $self->{u_end} = $self->{_io}->read_f4le();
    $self->{z_up} = $self->{_io}->read_s2le();
    $self->{z_down} = $self->{_io}->read_s2le();
    $self->{sp_averaging} = $self->{_io}->read_u2le();
    $self->{sp_repeat} = $self->{_io}->read_u1();
    $self->{sp_back} = $self->{_io}->read_u1();
    $self->{sp_4nx} = $self->{_io}->read_s2le();
    $self->{sp_osc} = $self->{_io}->read_u1();
    $self->{sp_n4} = $self->{_io}->read_u1();
    $self->{sp_4x0} = $self->{_io}->read_f4le();
    $self->{sp_4xr} = $self->{_io}->read_f4le();
    $self->{sp_4u} = $self->{_io}->read_s2le();
    $self->{sp_4i} = $self->{_io}->read_s2le();
    $self->{sp_nx} = $self->{_io}->read_s2le();
}

sub x_scale {
    my ($self) = @_;
    return $self->{x_scale};
}

sub y_scale {
    my ($self) = @_;
    return $self->{y_scale};
}

sub z_scale {
    my ($self) = @_;
    return $self->{z_scale};
}

sub sp_mode {
    my ($self) = @_;
    return $self->{sp_mode};
}

sub sp_filter {
    my ($self) = @_;
    return $self->{sp_filter};
}

sub u_begin {
    my ($self) = @_;
    return $self->{u_begin};
}

sub u_end {
    my ($self) = @_;
    return $self->{u_end};
}

sub z_up {
    my ($self) = @_;
    return $self->{z_up};
}

sub z_down {
    my ($self) = @_;
    return $self->{z_down};
}

sub sp_averaging {
    my ($self) = @_;
    return $self->{sp_averaging};
}

sub sp_repeat {
    my ($self) = @_;
    return $self->{sp_repeat};
}

sub sp_back {
    my ($self) = @_;
    return $self->{sp_back};
}

sub sp_4nx {
    my ($self) = @_;
    return $self->{sp_4nx};
}

sub sp_osc {
    my ($self) = @_;
    return $self->{sp_osc};
}

sub sp_n4 {
    my ($self) = @_;
    return $self->{sp_n4};
}

sub sp_4x0 {
    my ($self) = @_;
    return $self->{sp_4x0};
}

sub sp_4xr {
    my ($self) = @_;
    return $self->{sp_4xr};
}

sub sp_4u {
    my ($self) = @_;
    return $self->{sp_4u};
}

sub sp_4i {
    my ($self) = @_;
    return $self->{sp_4i};
}

sub sp_nx {
    my ($self) = @_;
    return $self->{sp_nx};
}

########################################################################
package NtMdt::Frame::FrameMain;

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

    $self->{type} = $self->{_io}->read_u2le();
    $self->{version} = NtMdt::Version->new($self->{_io}, $self, $self->{_root});
    $self->{date_time} = NtMdt::Frame::DateTime->new($self->{_io}, $self, $self->{_root});
    $self->{var_size} = $self->{_io}->read_u2le();
    my $_on = $self->type();
    if ($_on == $NtMdt::Frame::FRAME_TYPE_CURVES) {
        $self->{_raw_frame_data} = $self->{_io}->read_bytes_full();
        my $io__raw_frame_data = IO::KaitaiStruct::Stream->new($self->{_raw_frame_data});
        $self->{frame_data} = NtMdt::Frame::FdSpectroscopy->new($io__raw_frame_data, $self, $self->{_root});
    }
    elsif ($_on == $NtMdt::Frame::FRAME_TYPE_CURVES_NEW) {
        $self->{_raw_frame_data} = $self->{_io}->read_bytes_full();
        my $io__raw_frame_data = IO::KaitaiStruct::Stream->new($self->{_raw_frame_data});
        $self->{frame_data} = NtMdt::Frame::FdCurvesNew->new($io__raw_frame_data, $self, $self->{_root});
    }
    elsif ($_on == $NtMdt::Frame::FRAME_TYPE_MDA) {
        $self->{_raw_frame_data} = $self->{_io}->read_bytes_full();
        my $io__raw_frame_data = IO::KaitaiStruct::Stream->new($self->{_raw_frame_data});
        $self->{frame_data} = NtMdt::Frame::FdMetaData->new($io__raw_frame_data, $self, $self->{_root});
    }
    elsif ($_on == $NtMdt::Frame::FRAME_TYPE_SCANNED) {
        $self->{_raw_frame_data} = $self->{_io}->read_bytes_full();
        my $io__raw_frame_data = IO::KaitaiStruct::Stream->new($self->{_raw_frame_data});
        $self->{frame_data} = NtMdt::Frame::FdScanned->new($io__raw_frame_data, $self, $self->{_root});
    }
    elsif ($_on == $NtMdt::Frame::FRAME_TYPE_SPECTROSCOPY) {
        $self->{_raw_frame_data} = $self->{_io}->read_bytes_full();
        my $io__raw_frame_data = IO::KaitaiStruct::Stream->new($self->{_raw_frame_data});
        $self->{frame_data} = NtMdt::Frame::FdSpectroscopy->new($io__raw_frame_data, $self, $self->{_root});
    }
    else {
        $self->{frame_data} = $self->{_io}->read_bytes_full();
    }
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub date_time {
    my ($self) = @_;
    return $self->{date_time};
}

sub var_size {
    my ($self) = @_;
    return $self->{var_size};
}

sub frame_data {
    my ($self) = @_;
    return $self->{frame_data};
}

sub _raw_frame_data {
    my ($self) = @_;
    return $self->{_raw_frame_data};
}

########################################################################
package NtMdt::Framez;

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

    $self->{frames} = [];
    my $n_frames = $self->_root()->last_frame() + 1;
    for (my $i = 0; $i < $n_frames; $i++) {
        push @{$self->{frames}}, NtMdt::Frame->new($self->{_io}, $self, $self->{_root});
    }
}

sub frames {
    my ($self) = @_;
    return $self->{frames};
}

########################################################################
package NtMdt::Title;

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

    $self->{title_len} = $self->{_io}->read_u4le();
    $self->{title} = Encode::decode("windows-1251", $self->{_io}->read_bytes($self->title_len()));
}

sub title_len {
    my ($self) = @_;
    return $self->{title_len};
}

sub title {
    my ($self) = @_;
    return $self->{title};
}

########################################################################
package NtMdt::Uuid;

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

    $self->{data} = [];
    my $n_data = 16;
    for (my $i = 0; $i < $n_data; $i++) {
        push @{$self->{data}}, $self->{_io}->read_u1();
    }
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package NtMdt::Version;

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

    $self->{minor} = $self->{_io}->read_u1();
    $self->{major} = $self->{_io}->read_u1();
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
package NtMdt::Xml;

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

    $self->{xml_len} = $self->{_io}->read_u4le();
    $self->{xml} = Encode::decode("UTF-16LE", $self->{_io}->read_bytes($self->xml_len()));
}

sub xml_len {
    my ($self) = @_;
    return $self->{xml_len};
}

sub xml {
    my ($self) = @_;
    return $self->{xml};
}

1;
