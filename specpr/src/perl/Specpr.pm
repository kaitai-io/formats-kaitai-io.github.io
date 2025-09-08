# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Specpr;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $RECORD_TYPE_DATA_INITIAL = 0;
our $RECORD_TYPE_TEXT_INITIAL = 1;
our $RECORD_TYPE_DATA_CONTINUATION = 2;
our $RECORD_TYPE_TEXT_CONTINUATION = 3;

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

    $self->{records} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{records}}, Specpr::Record->new($self->{_io}, $self, $self->{_root});
    }
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

########################################################################
package Specpr::CoarseTimestamp;

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

    $self->{scaled_seconds} = $self->{_io}->read_s4be();
}

sub seconds {
    my ($self) = @_;
    return $self->{seconds} if ($self->{seconds});
    $self->{seconds} = $self->scaled_seconds() * 24000;
    return $self->{seconds};
}

sub scaled_seconds {
    my ($self) = @_;
    return $self->{scaled_seconds};
}

########################################################################
package Specpr::DataContinuation;

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

    $self->{cdata} = [];
    my $n_cdata = 383;
    for (my $i = 0; $i < $n_cdata; $i++) {
        push @{$self->{cdata}}, $self->{_io}->read_f4be();
    }
}

sub cdata {
    my ($self) = @_;
    return $self->{cdata};
}

########################################################################
package Specpr::DataInitial;

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

    $self->{ids} = Specpr::Identifiers->new($self->{_io}, $self, $self->{_root});
    $self->{iscta} = Specpr::CoarseTimestamp->new($self->{_io}, $self, $self->{_root});
    $self->{isctb} = Specpr::CoarseTimestamp->new($self->{_io}, $self, $self->{_root});
    $self->{jdatea} = $self->{_io}->read_s4be();
    $self->{jdateb} = $self->{_io}->read_s4be();
    $self->{istb} = Specpr::CoarseTimestamp->new($self->{_io}, $self, $self->{_root});
    $self->{isra} = $self->{_io}->read_s4be();
    $self->{isdec} = $self->{_io}->read_s4be();
    $self->{itchan} = $self->{_io}->read_s4be();
    $self->{irmas} = $self->{_io}->read_s4be();
    $self->{revs} = $self->{_io}->read_s4be();
    $self->{iband} = [];
    my $n_iband = 2;
    for (my $i = 0; $i < $n_iband; $i++) {
        push @{$self->{iband}}, $self->{_io}->read_s4be();
    }
    $self->{irwav} = $self->{_io}->read_s4be();
    $self->{irespt} = $self->{_io}->read_s4be();
    $self->{irecno} = $self->{_io}->read_s4be();
    $self->{itpntr} = $self->{_io}->read_s4be();
    $self->{ihist} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(60), 32));
    $self->{mhist} = [];
    my $n_mhist = 4;
    for (my $i = 0; $i < $n_mhist; $i++) {
        push @{$self->{mhist}}, Encode::decode("ASCII", $self->{_io}->read_bytes(74));
    }
    $self->{nruns} = $self->{_io}->read_s4be();
    $self->{siangl} = Specpr::IllumAngle->new($self->{_io}, $self, $self->{_root});
    $self->{seangl} = Specpr::IllumAngle->new($self->{_io}, $self, $self->{_root});
    $self->{sphase} = $self->{_io}->read_s4be();
    $self->{iwtrns} = $self->{_io}->read_s4be();
    $self->{itimch} = $self->{_io}->read_s4be();
    $self->{xnrm} = $self->{_io}->read_f4be();
    $self->{scatim} = $self->{_io}->read_f4be();
    $self->{timint} = $self->{_io}->read_f4be();
    $self->{tempd} = $self->{_io}->read_f4be();
    $self->{data} = [];
    my $n_data = 256;
    for (my $i = 0; $i < $n_data; $i++) {
        push @{$self->{data}}, $self->{_io}->read_f4be();
    }
}

sub phase_angle_arcsec {
    my ($self) = @_;
    return $self->{phase_angle_arcsec} if ($self->{phase_angle_arcsec});
    $self->{phase_angle_arcsec} = $self->sphase() / 1500;
    return $self->{phase_angle_arcsec};
}

sub ids {
    my ($self) = @_;
    return $self->{ids};
}

sub iscta {
    my ($self) = @_;
    return $self->{iscta};
}

sub isctb {
    my ($self) = @_;
    return $self->{isctb};
}

sub jdatea {
    my ($self) = @_;
    return $self->{jdatea};
}

sub jdateb {
    my ($self) = @_;
    return $self->{jdateb};
}

sub istb {
    my ($self) = @_;
    return $self->{istb};
}

sub isra {
    my ($self) = @_;
    return $self->{isra};
}

sub isdec {
    my ($self) = @_;
    return $self->{isdec};
}

sub itchan {
    my ($self) = @_;
    return $self->{itchan};
}

sub irmas {
    my ($self) = @_;
    return $self->{irmas};
}

sub revs {
    my ($self) = @_;
    return $self->{revs};
}

sub iband {
    my ($self) = @_;
    return $self->{iband};
}

sub irwav {
    my ($self) = @_;
    return $self->{irwav};
}

sub irespt {
    my ($self) = @_;
    return $self->{irespt};
}

sub irecno {
    my ($self) = @_;
    return $self->{irecno};
}

sub itpntr {
    my ($self) = @_;
    return $self->{itpntr};
}

sub ihist {
    my ($self) = @_;
    return $self->{ihist};
}

sub mhist {
    my ($self) = @_;
    return $self->{mhist};
}

sub nruns {
    my ($self) = @_;
    return $self->{nruns};
}

sub siangl {
    my ($self) = @_;
    return $self->{siangl};
}

sub seangl {
    my ($self) = @_;
    return $self->{seangl};
}

sub sphase {
    my ($self) = @_;
    return $self->{sphase};
}

sub iwtrns {
    my ($self) = @_;
    return $self->{iwtrns};
}

sub itimch {
    my ($self) = @_;
    return $self->{itimch};
}

sub xnrm {
    my ($self) = @_;
    return $self->{xnrm};
}

sub scatim {
    my ($self) = @_;
    return $self->{scatim};
}

sub timint {
    my ($self) = @_;
    return $self->{timint};
}

sub tempd {
    my ($self) = @_;
    return $self->{tempd};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Specpr::Icflag;

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

    $self->{reserved} = $self->{_io}->read_bits_int_be(26);
    $self->{isctb_type} = $self->{_io}->read_bits_int_be(1);
    $self->{iscta_type} = $self->{_io}->read_bits_int_be(1);
    $self->{coordinate_mode} = $self->{_io}->read_bits_int_be(1);
    $self->{errors} = $self->{_io}->read_bits_int_be(1);
    $self->{text} = $self->{_io}->read_bits_int_be(1);
    $self->{continuation} = $self->{_io}->read_bits_int_be(1);
}

sub type {
    my ($self) = @_;
    return $self->{type} if ($self->{type});
    $self->{type} = $self->text() * 1 + $self->continuation() * 2;
    return $self->{type};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub isctb_type {
    my ($self) = @_;
    return $self->{isctb_type};
}

sub iscta_type {
    my ($self) = @_;
    return $self->{iscta_type};
}

sub coordinate_mode {
    my ($self) = @_;
    return $self->{coordinate_mode};
}

sub errors {
    my ($self) = @_;
    return $self->{errors};
}

sub text {
    my ($self) = @_;
    return $self->{text};
}

sub continuation {
    my ($self) = @_;
    return $self->{continuation};
}

########################################################################
package Specpr::Identifiers;

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

    $self->{ititle} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(40), 32));
    $self->{usernm} = Encode::decode("ASCII", $self->{_io}->read_bytes(8));
}

sub ititle {
    my ($self) = @_;
    return $self->{ititle};
}

sub usernm {
    my ($self) = @_;
    return $self->{usernm};
}

########################################################################
package Specpr::IllumAngle;

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

    $self->{angl} = $self->{_io}->read_s4be();
}

sub degrees_total {
    my ($self) = @_;
    return $self->{degrees_total} if ($self->{degrees_total});
    $self->{degrees_total} = int($self->minutes_total() / 60);
    return $self->{degrees_total};
}

sub minutes_total {
    my ($self) = @_;
    return $self->{minutes_total} if ($self->{minutes_total});
    $self->{minutes_total} = int($self->seconds_total() / 60);
    return $self->{minutes_total};
}

sub seconds_total {
    my ($self) = @_;
    return $self->{seconds_total} if ($self->{seconds_total});
    $self->{seconds_total} = int($self->angl() / 6000);
    return $self->{seconds_total};
}

sub angl {
    my ($self) = @_;
    return $self->{angl};
}

########################################################################
package Specpr::Record;

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

    $self->{icflag} = Specpr::Icflag->new($self->{_io}, $self, $self->{_root});
    my $_on = $self->icflag()->type();
    if ($_on == $Specpr::RECORD_TYPE_DATA_CONTINUATION) {
        $self->{_raw_content} = $self->{_io}->read_bytes(1536 - 4);
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = Specpr::DataContinuation->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $Specpr::RECORD_TYPE_DATA_INITIAL) {
        $self->{_raw_content} = $self->{_io}->read_bytes(1536 - 4);
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = Specpr::DataInitial->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $Specpr::RECORD_TYPE_TEXT_CONTINUATION) {
        $self->{_raw_content} = $self->{_io}->read_bytes(1536 - 4);
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = Specpr::TextContinuation->new($io__raw_content, $self, $self->{_root});
    }
    elsif ($_on == $Specpr::RECORD_TYPE_TEXT_INITIAL) {
        $self->{_raw_content} = $self->{_io}->read_bytes(1536 - 4);
        my $io__raw_content = IO::KaitaiStruct::Stream->new($self->{_raw_content});
        $self->{content} = Specpr::TextInitial->new($io__raw_content, $self, $self->{_root});
    }
    else {
        $self->{content} = $self->{_io}->read_bytes(1536 - 4);
    }
}

sub icflag {
    my ($self) = @_;
    return $self->{icflag};
}

sub content {
    my ($self) = @_;
    return $self->{content};
}

sub _raw_content {
    my ($self) = @_;
    return $self->{_raw_content};
}

########################################################################
package Specpr::TextContinuation;

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

    $self->{tdata} = Encode::decode("ASCII", $self->{_io}->read_bytes(1532));
}

sub tdata {
    my ($self) = @_;
    return $self->{tdata};
}

########################################################################
package Specpr::TextInitial;

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

    $self->{ids} = Specpr::Identifiers->new($self->{_io}, $self, $self->{_root});
    $self->{itxtpt} = $self->{_io}->read_u4be();
    $self->{itxtch} = $self->{_io}->read_s4be();
    $self->{itext} = Encode::decode("ASCII", $self->{_io}->read_bytes(1476));
}

sub ids {
    my ($self) = @_;
    return $self->{ids};
}

sub itxtpt {
    my ($self) = @_;
    return $self->{itxtpt};
}

sub itxtch {
    my ($self) = @_;
    return $self->{itxtch};
}

sub itext {
    my ($self) = @_;
    return $self->{itext};
}

1;
