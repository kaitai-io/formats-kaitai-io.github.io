# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package AndroidImg;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (65, 78, 68, 82, 79, 73, 68, 33)));
    $self->{kernel} = AndroidImg::Load->new($self->{_io}, $self, $self->{_root});
    $self->{ramdisk} = AndroidImg::Load->new($self->{_io}, $self, $self->{_root});
    $self->{second} = AndroidImg::Load->new($self->{_io}, $self, $self->{_root});
    $self->{tags_load} = $self->{_io}->read_u4le();
    $self->{page_size} = $self->{_io}->read_u4le();
    $self->{header_version} = $self->{_io}->read_u4le();
    $self->{os_version} = AndroidImg::OsVersion->new($self->{_io}, $self, $self->{_root});
    $self->{name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(16), 0, 0));
    $self->{cmdline} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(512), 0, 0));
    $self->{sha} = $self->{_io}->read_bytes(32);
    $self->{extra_cmdline} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(1024), 0, 0));
    if ($self->header_version() > 0) {
        $self->{recovery_dtbo} = AndroidImg::SizeOffset->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->header_version() > 0) {
        $self->{boot_header_size} = $self->{_io}->read_u4le();
    }
    if ($self->header_version() > 1) {
        $self->{dtb} = AndroidImg::LoadLong->new($self->{_io}, $self, $self->{_root});
    }
}

sub kernel_img {
    my ($self) = @_;
    return $self->{kernel_img} if ($self->{kernel_img});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->page_size());
    $self->{kernel_img} = $self->{_io}->read_bytes($self->kernel()->size());
    $self->{_io}->seek($_pos);
    return $self->{kernel_img};
}

sub tags_offset {
    my ($self) = @_;
    return $self->{tags_offset} if ($self->{tags_offset});
    $self->{tags_offset} = ($self->tags_load() - $self->base());
    return $self->{tags_offset};
}

sub ramdisk_offset {
    my ($self) = @_;
    return $self->{ramdisk_offset} if ($self->{ramdisk_offset});
    $self->{ramdisk_offset} = ($self->ramdisk()->addr() > 0 ? ($self->ramdisk()->addr() - $self->base()) : 0);
    return $self->{ramdisk_offset};
}

sub second_offset {
    my ($self) = @_;
    return $self->{second_offset} if ($self->{second_offset});
    $self->{second_offset} = ($self->second()->addr() > 0 ? ($self->second()->addr() - $self->base()) : 0);
    return $self->{second_offset};
}

sub kernel_offset {
    my ($self) = @_;
    return $self->{kernel_offset} if ($self->{kernel_offset});
    $self->{kernel_offset} = ($self->kernel()->addr() - $self->base());
    return $self->{kernel_offset};
}

sub dtb_offset {
    my ($self) = @_;
    return $self->{dtb_offset} if ($self->{dtb_offset});
    if ($self->header_version() > 1) {
        $self->{dtb_offset} = ($self->dtb()->addr() > 0 ? ($self->dtb()->addr() - $self->base()) : 0);
    }
    return $self->{dtb_offset};
}

sub dtb_img {
    my ($self) = @_;
    return $self->{dtb_img} if ($self->{dtb_img});
    if ( (($self->header_version() > 1) && ($self->dtb()->size() > 0)) ) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek((int((((((($self->page_size() + $self->kernel()->size()) + $self->ramdisk()->size()) + $self->second()->size()) + $self->recovery_dtbo()->size()) + $self->page_size()) - 1) / $self->page_size()) * $self->page_size()));
        $self->{dtb_img} = $self->{_io}->read_bytes($self->dtb()->size());
        $self->{_io}->seek($_pos);
    }
    return $self->{dtb_img};
}

sub ramdisk_img {
    my ($self) = @_;
    return $self->{ramdisk_img} if ($self->{ramdisk_img});
    if ($self->ramdisk()->size() > 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek((int(((($self->page_size() + $self->kernel()->size()) + $self->page_size()) - 1) / $self->page_size()) * $self->page_size()));
        $self->{ramdisk_img} = $self->{_io}->read_bytes($self->ramdisk()->size());
        $self->{_io}->seek($_pos);
    }
    return $self->{ramdisk_img};
}

sub recovery_dtbo_img {
    my ($self) = @_;
    return $self->{recovery_dtbo_img} if ($self->{recovery_dtbo_img});
    if ( (($self->header_version() > 0) && ($self->recovery_dtbo()->size() > 0)) ) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->recovery_dtbo()->offset());
        $self->{recovery_dtbo_img} = $self->{_io}->read_bytes($self->recovery_dtbo()->size());
        $self->{_io}->seek($_pos);
    }
    return $self->{recovery_dtbo_img};
}

sub second_img {
    my ($self) = @_;
    return $self->{second_img} if ($self->{second_img});
    if ($self->second()->size() > 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek((int((((($self->page_size() + $self->kernel()->size()) + $self->ramdisk()->size()) + $self->page_size()) - 1) / $self->page_size()) * $self->page_size()));
        $self->{second_img} = $self->{_io}->read_bytes($self->second()->size());
        $self->{_io}->seek($_pos);
    }
    return $self->{second_img};
}

sub base {
    my ($self) = @_;
    return $self->{base} if ($self->{base});
    $self->{base} = ($self->kernel()->addr() - 32768);
    return $self->{base};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub kernel {
    my ($self) = @_;
    return $self->{kernel};
}

sub ramdisk {
    my ($self) = @_;
    return $self->{ramdisk};
}

sub second {
    my ($self) = @_;
    return $self->{second};
}

sub tags_load {
    my ($self) = @_;
    return $self->{tags_load};
}

sub page_size {
    my ($self) = @_;
    return $self->{page_size};
}

sub header_version {
    my ($self) = @_;
    return $self->{header_version};
}

sub os_version {
    my ($self) = @_;
    return $self->{os_version};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub cmdline {
    my ($self) = @_;
    return $self->{cmdline};
}

sub sha {
    my ($self) = @_;
    return $self->{sha};
}

sub extra_cmdline {
    my ($self) = @_;
    return $self->{extra_cmdline};
}

sub recovery_dtbo {
    my ($self) = @_;
    return $self->{recovery_dtbo};
}

sub boot_header_size {
    my ($self) = @_;
    return $self->{boot_header_size};
}

sub dtb {
    my ($self) = @_;
    return $self->{dtb};
}

########################################################################
package AndroidImg::Load;

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

    $self->{size} = $self->{_io}->read_u4le();
    $self->{addr} = $self->{_io}->read_u4le();
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub addr {
    my ($self) = @_;
    return $self->{addr};
}

########################################################################
package AndroidImg::LoadLong;

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

    $self->{size} = $self->{_io}->read_u4le();
    $self->{addr} = $self->{_io}->read_u8le();
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub addr {
    my ($self) = @_;
    return $self->{addr};
}

########################################################################
package AndroidImg::SizeOffset;

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

    $self->{size} = $self->{_io}->read_u4le();
    $self->{offset} = $self->{_io}->read_u8le();
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

########################################################################
package AndroidImg::OsVersion;

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

    $self->{version} = $self->{_io}->read_u4le();
}

sub month {
    my ($self) = @_;
    return $self->{month} if ($self->{month});
    $self->{month} = ($self->version() & 15);
    return $self->{month};
}

sub patch {
    my ($self) = @_;
    return $self->{patch} if ($self->{patch});
    $self->{patch} = (($self->version() >> 11) & 127);
    return $self->{patch};
}

sub year {
    my ($self) = @_;
    return $self->{year} if ($self->{year});
    $self->{year} = ((($self->version() >> 4) & 127) + 2000);
    return $self->{year};
}

sub major {
    my ($self) = @_;
    return $self->{major} if ($self->{major});
    $self->{major} = (($self->version() >> 25) & 127);
    return $self->{major};
}

sub minor {
    my ($self) = @_;
    return $self->{minor} if ($self->{minor});
    $self->{minor} = (($self->version() >> 18) & 127);
    return $self->{minor};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

1;
