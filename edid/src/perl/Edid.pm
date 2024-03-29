# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Edid;

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

    $self->{magic} = $self->{_io}->read_bytes(8);
    $self->{mfg_bytes} = $self->{_io}->read_u2be();
    $self->{product_code} = $self->{_io}->read_u2le();
    $self->{serial} = $self->{_io}->read_u4le();
    $self->{mfg_week} = $self->{_io}->read_u1();
    $self->{mfg_year_mod} = $self->{_io}->read_u1();
    $self->{edid_version_major} = $self->{_io}->read_u1();
    $self->{edid_version_minor} = $self->{_io}->read_u1();
    $self->{input_flags} = $self->{_io}->read_u1();
    $self->{screen_size_h} = $self->{_io}->read_u1();
    $self->{screen_size_v} = $self->{_io}->read_u1();
    $self->{gamma_mod} = $self->{_io}->read_u1();
    $self->{features_flags} = $self->{_io}->read_u1();
    $self->{chromacity} = Edid::ChromacityInfo->new($self->{_io}, $self, $self->{_root});
    $self->{est_timings} = Edid::EstTimingsInfo->new($self->{_io}, $self, $self->{_root});
    $self->{_raw_std_timings} = ();
    $self->{std_timings} = ();
    my $n_std_timings = 8;
    for (my $i = 0; $i < $n_std_timings; $i++) {
        push @{$self->{_raw_std_timings}}, $self->{_io}->read_bytes(2);
        my $io__raw_std_timings = IO::KaitaiStruct::Stream->new($self->{_raw_std_timings}[$i]);
        push @{$self->{std_timings}}, Edid::StdTiming->new($io__raw_std_timings, $self, $self->{_root});
    }
}

sub mfg_year {
    my ($self) = @_;
    return $self->{mfg_year} if ($self->{mfg_year});
    $self->{mfg_year} = ($self->mfg_year_mod() + 1990);
    return $self->{mfg_year};
}

sub mfg_id_ch1 {
    my ($self) = @_;
    return $self->{mfg_id_ch1} if ($self->{mfg_id_ch1});
    $self->{mfg_id_ch1} = (($self->mfg_bytes() & 31744) >> 10);
    return $self->{mfg_id_ch1};
}

sub mfg_id_ch3 {
    my ($self) = @_;
    return $self->{mfg_id_ch3} if ($self->{mfg_id_ch3});
    $self->{mfg_id_ch3} = ($self->mfg_bytes() & 31);
    return $self->{mfg_id_ch3};
}

sub gamma {
    my ($self) = @_;
    return $self->{gamma} if ($self->{gamma});
    if ($self->gamma_mod() != 255) {
        $self->{gamma} = (($self->gamma_mod() + 100) / 100.0);
    }
    return $self->{gamma};
}

sub mfg_str {
    my ($self) = @_;
    return $self->{mfg_str} if ($self->{mfg_str});
    $self->{mfg_str} = Encode::decode("ASCII", pack('C*', (($self->mfg_id_ch1() + 64), ($self->mfg_id_ch2() + 64), ($self->mfg_id_ch3() + 64))));
    return $self->{mfg_str};
}

sub mfg_id_ch2 {
    my ($self) = @_;
    return $self->{mfg_id_ch2} if ($self->{mfg_id_ch2});
    $self->{mfg_id_ch2} = (($self->mfg_bytes() & 992) >> 5);
    return $self->{mfg_id_ch2};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub mfg_bytes {
    my ($self) = @_;
    return $self->{mfg_bytes};
}

sub product_code {
    my ($self) = @_;
    return $self->{product_code};
}

sub serial {
    my ($self) = @_;
    return $self->{serial};
}

sub mfg_week {
    my ($self) = @_;
    return $self->{mfg_week};
}

sub mfg_year_mod {
    my ($self) = @_;
    return $self->{mfg_year_mod};
}

sub edid_version_major {
    my ($self) = @_;
    return $self->{edid_version_major};
}

sub edid_version_minor {
    my ($self) = @_;
    return $self->{edid_version_minor};
}

sub input_flags {
    my ($self) = @_;
    return $self->{input_flags};
}

sub screen_size_h {
    my ($self) = @_;
    return $self->{screen_size_h};
}

sub screen_size_v {
    my ($self) = @_;
    return $self->{screen_size_v};
}

sub gamma_mod {
    my ($self) = @_;
    return $self->{gamma_mod};
}

sub features_flags {
    my ($self) = @_;
    return $self->{features_flags};
}

sub chromacity {
    my ($self) = @_;
    return $self->{chromacity};
}

sub est_timings {
    my ($self) = @_;
    return $self->{est_timings};
}

sub std_timings {
    my ($self) = @_;
    return $self->{std_timings};
}

sub _raw_std_timings {
    my ($self) = @_;
    return $self->{_raw_std_timings};
}

########################################################################
package Edid::ChromacityInfo;

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

    $self->{red_x_1_0} = $self->{_io}->read_bits_int_be(2);
    $self->{red_y_1_0} = $self->{_io}->read_bits_int_be(2);
    $self->{green_x_1_0} = $self->{_io}->read_bits_int_be(2);
    $self->{green_y_1_0} = $self->{_io}->read_bits_int_be(2);
    $self->{blue_x_1_0} = $self->{_io}->read_bits_int_be(2);
    $self->{blue_y_1_0} = $self->{_io}->read_bits_int_be(2);
    $self->{white_x_1_0} = $self->{_io}->read_bits_int_be(2);
    $self->{white_y_1_0} = $self->{_io}->read_bits_int_be(2);
    $self->{_io}->align_to_byte();
    $self->{red_x_9_2} = $self->{_io}->read_u1();
    $self->{red_y_9_2} = $self->{_io}->read_u1();
    $self->{green_x_9_2} = $self->{_io}->read_u1();
    $self->{green_y_9_2} = $self->{_io}->read_u1();
    $self->{blue_x_9_2} = $self->{_io}->read_u1();
    $self->{blue_y_9_2} = $self->{_io}->read_u1();
    $self->{white_x_9_2} = $self->{_io}->read_u1();
    $self->{white_y_9_2} = $self->{_io}->read_u1();
}

sub green_x_int {
    my ($self) = @_;
    return $self->{green_x_int} if ($self->{green_x_int});
    $self->{green_x_int} = (($self->green_x_9_2() << 2) | $self->green_x_1_0());
    return $self->{green_x_int};
}

sub red_y {
    my ($self) = @_;
    return $self->{red_y} if ($self->{red_y});
    $self->{red_y} = ($self->red_y_int() / 1024.0);
    return $self->{red_y};
}

sub green_y_int {
    my ($self) = @_;
    return $self->{green_y_int} if ($self->{green_y_int});
    $self->{green_y_int} = (($self->green_y_9_2() << 2) | $self->green_y_1_0());
    return $self->{green_y_int};
}

sub white_y {
    my ($self) = @_;
    return $self->{white_y} if ($self->{white_y});
    $self->{white_y} = ($self->white_y_int() / 1024.0);
    return $self->{white_y};
}

sub red_x {
    my ($self) = @_;
    return $self->{red_x} if ($self->{red_x});
    $self->{red_x} = ($self->red_x_int() / 1024.0);
    return $self->{red_x};
}

sub white_x {
    my ($self) = @_;
    return $self->{white_x} if ($self->{white_x});
    $self->{white_x} = ($self->white_x_int() / 1024.0);
    return $self->{white_x};
}

sub blue_x {
    my ($self) = @_;
    return $self->{blue_x} if ($self->{blue_x});
    $self->{blue_x} = ($self->blue_x_int() / 1024.0);
    return $self->{blue_x};
}

sub white_x_int {
    my ($self) = @_;
    return $self->{white_x_int} if ($self->{white_x_int});
    $self->{white_x_int} = (($self->white_x_9_2() << 2) | $self->white_x_1_0());
    return $self->{white_x_int};
}

sub white_y_int {
    my ($self) = @_;
    return $self->{white_y_int} if ($self->{white_y_int});
    $self->{white_y_int} = (($self->white_y_9_2() << 2) | $self->white_y_1_0());
    return $self->{white_y_int};
}

sub green_x {
    my ($self) = @_;
    return $self->{green_x} if ($self->{green_x});
    $self->{green_x} = ($self->green_x_int() / 1024.0);
    return $self->{green_x};
}

sub red_x_int {
    my ($self) = @_;
    return $self->{red_x_int} if ($self->{red_x_int});
    $self->{red_x_int} = (($self->red_x_9_2() << 2) | $self->red_x_1_0());
    return $self->{red_x_int};
}

sub red_y_int {
    my ($self) = @_;
    return $self->{red_y_int} if ($self->{red_y_int});
    $self->{red_y_int} = (($self->red_y_9_2() << 2) | $self->red_y_1_0());
    return $self->{red_y_int};
}

sub blue_x_int {
    my ($self) = @_;
    return $self->{blue_x_int} if ($self->{blue_x_int});
    $self->{blue_x_int} = (($self->blue_x_9_2() << 2) | $self->blue_x_1_0());
    return $self->{blue_x_int};
}

sub blue_y {
    my ($self) = @_;
    return $self->{blue_y} if ($self->{blue_y});
    $self->{blue_y} = ($self->blue_y_int() / 1024.0);
    return $self->{blue_y};
}

sub green_y {
    my ($self) = @_;
    return $self->{green_y} if ($self->{green_y});
    $self->{green_y} = ($self->green_y_int() / 1024.0);
    return $self->{green_y};
}

sub blue_y_int {
    my ($self) = @_;
    return $self->{blue_y_int} if ($self->{blue_y_int});
    $self->{blue_y_int} = (($self->blue_y_9_2() << 2) | $self->blue_y_1_0());
    return $self->{blue_y_int};
}

sub red_x_1_0 {
    my ($self) = @_;
    return $self->{red_x_1_0};
}

sub red_y_1_0 {
    my ($self) = @_;
    return $self->{red_y_1_0};
}

sub green_x_1_0 {
    my ($self) = @_;
    return $self->{green_x_1_0};
}

sub green_y_1_0 {
    my ($self) = @_;
    return $self->{green_y_1_0};
}

sub blue_x_1_0 {
    my ($self) = @_;
    return $self->{blue_x_1_0};
}

sub blue_y_1_0 {
    my ($self) = @_;
    return $self->{blue_y_1_0};
}

sub white_x_1_0 {
    my ($self) = @_;
    return $self->{white_x_1_0};
}

sub white_y_1_0 {
    my ($self) = @_;
    return $self->{white_y_1_0};
}

sub red_x_9_2 {
    my ($self) = @_;
    return $self->{red_x_9_2};
}

sub red_y_9_2 {
    my ($self) = @_;
    return $self->{red_y_9_2};
}

sub green_x_9_2 {
    my ($self) = @_;
    return $self->{green_x_9_2};
}

sub green_y_9_2 {
    my ($self) = @_;
    return $self->{green_y_9_2};
}

sub blue_x_9_2 {
    my ($self) = @_;
    return $self->{blue_x_9_2};
}

sub blue_y_9_2 {
    my ($self) = @_;
    return $self->{blue_y_9_2};
}

sub white_x_9_2 {
    my ($self) = @_;
    return $self->{white_x_9_2};
}

sub white_y_9_2 {
    my ($self) = @_;
    return $self->{white_y_9_2};
}

########################################################################
package Edid::EstTimingsInfo;

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

    $self->{can_720x400px_70hz} = $self->{_io}->read_bits_int_be(1);
    $self->{can_720x400px_88hz} = $self->{_io}->read_bits_int_be(1);
    $self->{can_640x480px_60hz} = $self->{_io}->read_bits_int_be(1);
    $self->{can_640x480px_67hz} = $self->{_io}->read_bits_int_be(1);
    $self->{can_640x480px_72hz} = $self->{_io}->read_bits_int_be(1);
    $self->{can_640x480px_75hz} = $self->{_io}->read_bits_int_be(1);
    $self->{can_800x600px_56hz} = $self->{_io}->read_bits_int_be(1);
    $self->{can_800x600px_60hz} = $self->{_io}->read_bits_int_be(1);
    $self->{can_800x600px_72hz} = $self->{_io}->read_bits_int_be(1);
    $self->{can_800x600px_75hz} = $self->{_io}->read_bits_int_be(1);
    $self->{can_832x624px_75hz} = $self->{_io}->read_bits_int_be(1);
    $self->{can_1024x768px_87hz_i} = $self->{_io}->read_bits_int_be(1);
    $self->{can_1024x768px_60hz} = $self->{_io}->read_bits_int_be(1);
    $self->{can_1024x768px_70hz} = $self->{_io}->read_bits_int_be(1);
    $self->{can_1024x768px_75hz} = $self->{_io}->read_bits_int_be(1);
    $self->{can_1280x1024px_75hz} = $self->{_io}->read_bits_int_be(1);
    $self->{can_1152x870px_75hz} = $self->{_io}->read_bits_int_be(1);
    $self->{reserved} = $self->{_io}->read_bits_int_be(7);
}

sub can_720x400px_70hz {
    my ($self) = @_;
    return $self->{can_720x400px_70hz};
}

sub can_720x400px_88hz {
    my ($self) = @_;
    return $self->{can_720x400px_88hz};
}

sub can_640x480px_60hz {
    my ($self) = @_;
    return $self->{can_640x480px_60hz};
}

sub can_640x480px_67hz {
    my ($self) = @_;
    return $self->{can_640x480px_67hz};
}

sub can_640x480px_72hz {
    my ($self) = @_;
    return $self->{can_640x480px_72hz};
}

sub can_640x480px_75hz {
    my ($self) = @_;
    return $self->{can_640x480px_75hz};
}

sub can_800x600px_56hz {
    my ($self) = @_;
    return $self->{can_800x600px_56hz};
}

sub can_800x600px_60hz {
    my ($self) = @_;
    return $self->{can_800x600px_60hz};
}

sub can_800x600px_72hz {
    my ($self) = @_;
    return $self->{can_800x600px_72hz};
}

sub can_800x600px_75hz {
    my ($self) = @_;
    return $self->{can_800x600px_75hz};
}

sub can_832x624px_75hz {
    my ($self) = @_;
    return $self->{can_832x624px_75hz};
}

sub can_1024x768px_87hz_i {
    my ($self) = @_;
    return $self->{can_1024x768px_87hz_i};
}

sub can_1024x768px_60hz {
    my ($self) = @_;
    return $self->{can_1024x768px_60hz};
}

sub can_1024x768px_70hz {
    my ($self) = @_;
    return $self->{can_1024x768px_70hz};
}

sub can_1024x768px_75hz {
    my ($self) = @_;
    return $self->{can_1024x768px_75hz};
}

sub can_1280x1024px_75hz {
    my ($self) = @_;
    return $self->{can_1280x1024px_75hz};
}

sub can_1152x870px_75hz {
    my ($self) = @_;
    return $self->{can_1152x870px_75hz};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package Edid::StdTiming;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $ASPECT_RATIOS_RATIO_16_10 = 0;
our $ASPECT_RATIOS_RATIO_4_3 = 1;
our $ASPECT_RATIOS_RATIO_5_4 = 2;
our $ASPECT_RATIOS_RATIO_16_9 = 3;

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

    $self->{horiz_active_pixels_mod} = $self->{_io}->read_u1();
    $self->{aspect_ratio} = $self->{_io}->read_bits_int_be(2);
    $self->{refresh_rate_mod} = $self->{_io}->read_bits_int_be(6);
}

sub bytes_lookahead {
    my ($self) = @_;
    return $self->{bytes_lookahead} if ($self->{bytes_lookahead});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{bytes_lookahead} = $self->{_io}->read_bytes(2);
    $self->{_io}->seek($_pos);
    return $self->{bytes_lookahead};
}

sub is_used {
    my ($self) = @_;
    return $self->{is_used} if ($self->{is_used});
    $self->{is_used} = $self->bytes_lookahead() ne pack('C*', (1, 1));
    return $self->{is_used};
}

sub horiz_active_pixels {
    my ($self) = @_;
    return $self->{horiz_active_pixels} if ($self->{horiz_active_pixels});
    if ($self->is_used()) {
        $self->{horiz_active_pixels} = (($self->horiz_active_pixels_mod() + 31) * 8);
    }
    return $self->{horiz_active_pixels};
}

sub refresh_rate {
    my ($self) = @_;
    return $self->{refresh_rate} if ($self->{refresh_rate});
    if ($self->is_used()) {
        $self->{refresh_rate} = ($self->refresh_rate_mod() + 60);
    }
    return $self->{refresh_rate};
}

sub horiz_active_pixels_mod {
    my ($self) = @_;
    return $self->{horiz_active_pixels_mod};
}

sub aspect_ratio {
    my ($self) = @_;
    return $self->{aspect_ratio};
}

sub refresh_rate_mod {
    my ($self) = @_;
    return $self->{refresh_rate_mod};
}

1;
