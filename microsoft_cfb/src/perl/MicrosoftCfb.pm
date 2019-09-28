# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package MicrosoftCfb;

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

    $self->{header} = MicrosoftCfb::CfbHeader->new($self->{_io}, $self, $self->{_root});
}

sub sector_size {
    my ($self) = @_;
    return $self->{sector_size} if ($self->{sector_size});
    $self->{sector_size} = (1 << $self->header()->sector_shift());
    return $self->{sector_size};
}

sub fat {
    my ($self) = @_;
    return $self->{fat} if ($self->{fat});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->sector_size());
    $self->{_raw_fat} = $self->{_io}->read_bytes(($self->header()->size_fat() * $self->sector_size()));
    my $io__raw_fat = IO::KaitaiStruct::Stream->new($self->{_raw_fat});
    $self->{fat} = MicrosoftCfb::FatEntries->new($io__raw_fat, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{fat};
}

sub dir {
    my ($self) = @_;
    return $self->{dir} if ($self->{dir});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek((($self->header()->ofs_dir() + 1) * $self->sector_size()));
    $self->{dir} = MicrosoftCfb::DirEntry->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{dir};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub _raw_fat {
    my ($self) = @_;
    return $self->{_raw_fat};
}

########################################################################
package MicrosoftCfb::CfbHeader;

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

    $self->{signature} = $self->{_io}->ensure_fixed_contents(pack('C*', (208, 207, 17, 224, 161, 177, 26, 225)));
    $self->{clsid} = $self->{_io}->ensure_fixed_contents(pack('C*', (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)));
    $self->{version_minor} = $self->{_io}->read_u2le();
    $self->{version_major} = $self->{_io}->read_u2le();
    $self->{byte_order} = $self->{_io}->ensure_fixed_contents(pack('C*', (254, 255)));
    $self->{sector_shift} = $self->{_io}->read_u2le();
    $self->{mini_sector_shift} = $self->{_io}->read_u2le();
    $self->{reserved1} = $self->{_io}->read_bytes(6);
    $self->{size_dir} = $self->{_io}->read_s4le();
    $self->{size_fat} = $self->{_io}->read_s4le();
    $self->{ofs_dir} = $self->{_io}->read_s4le();
    $self->{transaction_seq} = $self->{_io}->read_s4le();
    $self->{mini_stream_cutoff_size} = $self->{_io}->read_s4le();
    $self->{ofs_mini_fat} = $self->{_io}->read_s4le();
    $self->{size_mini_fat} = $self->{_io}->read_s4le();
    $self->{ofs_difat} = $self->{_io}->read_s4le();
    $self->{size_difat} = $self->{_io}->read_s4le();
    $self->{difat} = ();
    my $n_difat = 109;
    for (my $i = 0; $i < $n_difat; $i++) {
        $self->{difat}[$i] = $self->{_io}->read_s4le();
    }
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub clsid {
    my ($self) = @_;
    return $self->{clsid};
}

sub version_minor {
    my ($self) = @_;
    return $self->{version_minor};
}

sub version_major {
    my ($self) = @_;
    return $self->{version_major};
}

sub byte_order {
    my ($self) = @_;
    return $self->{byte_order};
}

sub sector_shift {
    my ($self) = @_;
    return $self->{sector_shift};
}

sub mini_sector_shift {
    my ($self) = @_;
    return $self->{mini_sector_shift};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub size_dir {
    my ($self) = @_;
    return $self->{size_dir};
}

sub size_fat {
    my ($self) = @_;
    return $self->{size_fat};
}

sub ofs_dir {
    my ($self) = @_;
    return $self->{ofs_dir};
}

sub transaction_seq {
    my ($self) = @_;
    return $self->{transaction_seq};
}

sub mini_stream_cutoff_size {
    my ($self) = @_;
    return $self->{mini_stream_cutoff_size};
}

sub ofs_mini_fat {
    my ($self) = @_;
    return $self->{ofs_mini_fat};
}

sub size_mini_fat {
    my ($self) = @_;
    return $self->{size_mini_fat};
}

sub ofs_difat {
    my ($self) = @_;
    return $self->{ofs_difat};
}

sub size_difat {
    my ($self) = @_;
    return $self->{size_difat};
}

sub difat {
    my ($self) = @_;
    return $self->{difat};
}

########################################################################
package MicrosoftCfb::FatEntries;

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

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, $self->{_io}->read_s4le();
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package MicrosoftCfb::DirEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $OBJ_TYPE_UNKNOWN = 0;
our $OBJ_TYPE_STORAGE = 1;
our $OBJ_TYPE_STREAM = 2;
our $OBJ_TYPE_ROOT_STORAGE = 5;

our $RB_COLOR_RED = 0;
our $RB_COLOR_BLACK = 1;

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

    $self->{name} = Encode::decode("UTF-16LE", $self->{_io}->read_bytes(64));
    $self->{name_len} = $self->{_io}->read_u2le();
    $self->{object_type} = $self->{_io}->read_u1();
    $self->{color_flag} = $self->{_io}->read_u1();
    $self->{left_sibling_id} = $self->{_io}->read_s4le();
    $self->{right_sibling_id} = $self->{_io}->read_s4le();
    $self->{child_id} = $self->{_io}->read_s4le();
    $self->{clsid} = $self->{_io}->read_bytes(16);
    $self->{state} = $self->{_io}->read_u4le();
    $self->{time_create} = $self->{_io}->read_u8le();
    $self->{time_mod} = $self->{_io}->read_u8le();
    $self->{ofs} = $self->{_io}->read_s4le();
    $self->{size} = $self->{_io}->read_u8le();
}

sub mini_stream {
    my ($self) = @_;
    return $self->{mini_stream} if ($self->{mini_stream});
    if ($self->object_type() == $MicrosoftCfb::DirEntry::OBJ_TYPE_ROOT_STORAGE) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek((($self->ofs() + 1) * $self->_root()->sector_size()));
        $self->{mini_stream} = $io->read_bytes($self->size());
        $io->seek($_pos);
    }
    return $self->{mini_stream};
}

sub child {
    my ($self) = @_;
    return $self->{child} if ($self->{child});
    if ($self->child_id() != -1) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek(((($self->_root()->header()->ofs_dir() + 1) * $self->_root()->sector_size()) + ($self->child_id() * 128)));
        $self->{child} = MicrosoftCfb::DirEntry->new($io, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{child};
}

sub left_sibling {
    my ($self) = @_;
    return $self->{left_sibling} if ($self->{left_sibling});
    if ($self->left_sibling_id() != -1) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek(((($self->_root()->header()->ofs_dir() + 1) * $self->_root()->sector_size()) + ($self->left_sibling_id() * 128)));
        $self->{left_sibling} = MicrosoftCfb::DirEntry->new($io, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{left_sibling};
}

sub right_sibling {
    my ($self) = @_;
    return $self->{right_sibling} if ($self->{right_sibling});
    if ($self->right_sibling_id() != -1) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek(((($self->_root()->header()->ofs_dir() + 1) * $self->_root()->sector_size()) + ($self->right_sibling_id() * 128)));
        $self->{right_sibling} = MicrosoftCfb::DirEntry->new($io, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{right_sibling};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub name_len {
    my ($self) = @_;
    return $self->{name_len};
}

sub object_type {
    my ($self) = @_;
    return $self->{object_type};
}

sub color_flag {
    my ($self) = @_;
    return $self->{color_flag};
}

sub left_sibling_id {
    my ($self) = @_;
    return $self->{left_sibling_id};
}

sub right_sibling_id {
    my ($self) = @_;
    return $self->{right_sibling_id};
}

sub child_id {
    my ($self) = @_;
    return $self->{child_id};
}

sub clsid {
    my ($self) = @_;
    return $self->{clsid};
}

sub state {
    my ($self) = @_;
    return $self->{state};
}

sub time_create {
    my ($self) = @_;
    return $self->{time_create};
}

sub time_mod {
    my ($self) = @_;
    return $self->{time_mod};
}

sub ofs {
    my ($self) = @_;
    return $self->{ofs};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

1;
