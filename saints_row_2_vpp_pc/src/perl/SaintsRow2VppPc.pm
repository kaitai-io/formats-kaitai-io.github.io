# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package SaintsRow2VppPc;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (206, 10, 137, 81, 4)));
    $self->{pad1} = $self->{_io}->read_bytes(335);
    $self->{num_files} = $self->{_io}->read_s4le();
    $self->{container_size} = $self->{_io}->read_s4le();
    $self->{len_offsets} = $self->{_io}->read_s4le();
    $self->{len_filenames} = $self->{_io}->read_s4le();
    $self->{len_extensions} = $self->{_io}->read_s4le();
    $self->{smth5} = $self->{_io}->read_s4le();
    $self->{smth6} = $self->{_io}->read_s4le();
    $self->{smth7} = $self->{_io}->read_s4le();
    $self->{smth8} = $self->{_io}->read_s4le();
    $self->{smth9} = $self->{_io}->read_s4le();
}

sub filenames {
    my ($self) = @_;
    return $self->{filenames} if ($self->{filenames});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_filenames());
    $self->{_raw_filenames} = $self->{_io}->read_bytes($self->len_filenames());
    my $io__raw_filenames = IO::KaitaiStruct::Stream->new($self->{_raw_filenames});
    $self->{filenames} = SaintsRow2VppPc::Strings->new($io__raw_filenames, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{filenames};
}

sub ofs_extensions {
    my ($self) = @_;
    return $self->{ofs_extensions} if ($self->{ofs_extensions});
    $self->{ofs_extensions} = ((($self->ofs_filenames() + $self->len_filenames()) & 4294965248) + 2048);
    return $self->{ofs_extensions};
}

sub files {
    my ($self) = @_;
    return $self->{files} if ($self->{files});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(2048);
    $self->{_raw_files} = $self->{_io}->read_bytes($self->len_offsets());
    my $io__raw_files = IO::KaitaiStruct::Stream->new($self->{_raw_files});
    $self->{files} = SaintsRow2VppPc::Offsets->new($io__raw_files, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{files};
}

sub data_start {
    my ($self) = @_;
    return $self->{data_start} if ($self->{data_start});
    $self->{data_start} = ((($self->ofs_extensions() + $self->len_extensions()) & 4294965248) + 2048);
    return $self->{data_start};
}

sub extensions {
    my ($self) = @_;
    return $self->{extensions} if ($self->{extensions});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_extensions());
    $self->{_raw_extensions} = $self->{_io}->read_bytes($self->len_extensions());
    my $io__raw_extensions = IO::KaitaiStruct::Stream->new($self->{_raw_extensions});
    $self->{extensions} = SaintsRow2VppPc::Strings->new($io__raw_extensions, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{extensions};
}

sub ofs_filenames {
    my ($self) = @_;
    return $self->{ofs_filenames} if ($self->{ofs_filenames});
    $self->{ofs_filenames} = (((2048 + $self->len_offsets()) & 4294965248) + 2048);
    return $self->{ofs_filenames};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub pad1 {
    my ($self) = @_;
    return $self->{pad1};
}

sub num_files {
    my ($self) = @_;
    return $self->{num_files};
}

sub container_size {
    my ($self) = @_;
    return $self->{container_size};
}

sub len_offsets {
    my ($self) = @_;
    return $self->{len_offsets};
}

sub len_filenames {
    my ($self) = @_;
    return $self->{len_filenames};
}

sub len_extensions {
    my ($self) = @_;
    return $self->{len_extensions};
}

sub smth5 {
    my ($self) = @_;
    return $self->{smth5};
}

sub smth6 {
    my ($self) = @_;
    return $self->{smth6};
}

sub smth7 {
    my ($self) = @_;
    return $self->{smth7};
}

sub smth8 {
    my ($self) = @_;
    return $self->{smth8};
}

sub smth9 {
    my ($self) = @_;
    return $self->{smth9};
}

sub _raw_filenames {
    my ($self) = @_;
    return $self->{_raw_filenames};
}

sub _raw_files {
    my ($self) = @_;
    return $self->{_raw_files};
}

sub _raw_extensions {
    my ($self) = @_;
    return $self->{_raw_extensions};
}

########################################################################
package SaintsRow2VppPc::Offsets;

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
        push @{$self->{entries}}, SaintsRow2VppPc::Offsets::Offset->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package SaintsRow2VppPc::Offsets::Offset;

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

    $self->{name_ofs} = $self->{_io}->read_u4le();
    $self->{ext_ofs} = $self->{_io}->read_u4le();
    $self->{smth2} = $self->{_io}->read_s4le();
    $self->{ofs_body} = $self->{_io}->read_s4le();
    $self->{len_body} = $self->{_io}->read_s4le();
    $self->{always_minus_1} = $self->{_io}->read_s4le();
    $self->{always_zero} = $self->{_io}->read_s4le();
}

sub filename {
    my ($self) = @_;
    return $self->{filename} if ($self->{filename});
    my $io = $self->_root()->filenames()->_io();
    my $_pos = $io->pos();
    $io->seek($self->name_ofs());
    $self->{filename} = Encode::decode("UTF-8", $io->read_bytes_term(0, 0, 1, 1));
    $io->seek($_pos);
    return $self->{filename};
}

sub ext {
    my ($self) = @_;
    return $self->{ext} if ($self->{ext});
    my $io = $self->_root()->extensions()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ext_ofs());
    $self->{ext} = Encode::decode("UTF-8", $io->read_bytes_term(0, 0, 1, 1));
    $io->seek($_pos);
    return $self->{ext};
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek(($self->_root()->data_start() + $self->ofs_body()));
    $self->{body} = $io->read_bytes($self->len_body());
    $io->seek($_pos);
    return $self->{body};
}

sub name_ofs {
    my ($self) = @_;
    return $self->{name_ofs};
}

sub ext_ofs {
    my ($self) = @_;
    return $self->{ext_ofs};
}

sub smth2 {
    my ($self) = @_;
    return $self->{smth2};
}

sub ofs_body {
    my ($self) = @_;
    return $self->{ofs_body};
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body};
}

sub always_minus_1 {
    my ($self) = @_;
    return $self->{always_minus_1};
}

sub always_zero {
    my ($self) = @_;
    return $self->{always_zero};
}

########################################################################
package SaintsRow2VppPc::Strings;

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
        push @{$self->{entries}}, Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

1;
