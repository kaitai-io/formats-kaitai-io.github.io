# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;
use DosDatetime;

########################################################################
package Lzh;

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
        push @{$self->{entries}}, Lzh::Record->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Lzh::Record;

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

    $self->{header_len} = $self->{_io}->read_u1();
    if ($self->header_len() > 0) {
        $self->{file_record} = Lzh::FileRecord->new($self->{_io}, $self, $self->{_root});
    }
}

sub header_len {
    my ($self) = @_;
    return $self->{header_len};
}

sub file_record {
    my ($self) = @_;
    return $self->{file_record};
}

########################################################################
package Lzh::FileRecord;

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

    $self->{_raw_header} = $self->{_io}->read_bytes(($self->_parent()->header_len() - 1));
    my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
    $self->{header} = Lzh::Header->new($io__raw_header, $self, $self->{_root});
    if ($self->header()->header1()->lha_level() == 0) {
        $self->{file_uncompr_crc16} = $self->{_io}->read_u2le();
    }
    $self->{body} = $self->{_io}->read_bytes($self->header()->header1()->file_size_compr());
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub file_uncompr_crc16 {
    my ($self) = @_;
    return $self->{file_uncompr_crc16};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_header {
    my ($self) = @_;
    return $self->{_raw_header};
}

########################################################################
package Lzh::Header;

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

    $self->{header1} = Lzh::Header1->new($self->{_io}, $self, $self->{_root});
    if ($self->header1()->lha_level() == 0) {
        $self->{filename_len} = $self->{_io}->read_u1();
    }
    if ($self->header1()->lha_level() == 0) {
        $self->{filename} = Encode::decode("ASCII", $self->{_io}->read_bytes($self->filename_len()));
    }
    if ($self->header1()->lha_level() == 2) {
        $self->{file_uncompr_crc16} = $self->{_io}->read_u2le();
    }
    if ($self->header1()->lha_level() == 2) {
        $self->{os} = $self->{_io}->read_u1();
    }
    if ($self->header1()->lha_level() == 2) {
        $self->{ext_header_size} = $self->{_io}->read_u2le();
    }
}

sub header1 {
    my ($self) = @_;
    return $self->{header1};
}

sub filename_len {
    my ($self) = @_;
    return $self->{filename_len};
}

sub filename {
    my ($self) = @_;
    return $self->{filename};
}

sub file_uncompr_crc16 {
    my ($self) = @_;
    return $self->{file_uncompr_crc16};
}

sub os {
    my ($self) = @_;
    return $self->{os};
}

sub ext_header_size {
    my ($self) = @_;
    return $self->{ext_header_size};
}

########################################################################
package Lzh::Header1;

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

    $self->{header_checksum} = $self->{_io}->read_u1();
    $self->{method_id} = Encode::decode("ASCII", $self->{_io}->read_bytes(5));
    $self->{file_size_compr} = $self->{_io}->read_u4le();
    $self->{file_size_uncompr} = $self->{_io}->read_u4le();
    $self->{_raw_file_timestamp} = $self->{_io}->read_bytes(4);
    my $io__raw_file_timestamp = IO::KaitaiStruct::Stream->new($self->{_raw_file_timestamp});
    $self->{file_timestamp} = DosDatetime->new($io__raw_file_timestamp);
    $self->{attr} = $self->{_io}->read_u1();
    $self->{lha_level} = $self->{_io}->read_u1();
}

sub header_checksum {
    my ($self) = @_;
    return $self->{header_checksum};
}

sub method_id {
    my ($self) = @_;
    return $self->{method_id};
}

sub file_size_compr {
    my ($self) = @_;
    return $self->{file_size_compr};
}

sub file_size_uncompr {
    my ($self) = @_;
    return $self->{file_size_uncompr};
}

sub file_timestamp {
    my ($self) = @_;
    return $self->{file_timestamp};
}

sub attr {
    my ($self) = @_;
    return $self->{attr};
}

sub lha_level {
    my ($self) = @_;
    return $self->{lha_level};
}

sub _raw_file_timestamp {
    my ($self) = @_;
    return $self->{_raw_file_timestamp};
}

1;
