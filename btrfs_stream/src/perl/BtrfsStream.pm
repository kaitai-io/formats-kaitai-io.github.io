# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package BtrfsStream;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COMMAND_UNSPEC = 0;
our $COMMAND_SUBVOL = 1;
our $COMMAND_SNAPSHOT = 2;
our $COMMAND_MKFILE = 3;
our $COMMAND_MKDIR = 4;
our $COMMAND_MKNOD = 5;
our $COMMAND_MKFIFO = 6;
our $COMMAND_MKSOCK = 7;
our $COMMAND_SYMLINK = 8;
our $COMMAND_RENAME = 9;
our $COMMAND_LINK = 10;
our $COMMAND_UNLINK = 11;
our $COMMAND_RMDIR = 12;
our $COMMAND_SET_XATTR = 13;
our $COMMAND_REMOVE_XATTR = 14;
our $COMMAND_WRITE = 15;
our $COMMAND_CLONE = 16;
our $COMMAND_TRUNCATE = 17;
our $COMMAND_CHMOD = 18;
our $COMMAND_CHOWN = 19;
our $COMMAND_UTIMES = 20;
our $COMMAND_END = 21;
our $COMMAND_UPDATE_EXTENT = 22;

our $ATTRIBUTE_UNSPEC = 0;
our $ATTRIBUTE_UUID = 1;
our $ATTRIBUTE_CTRANSID = 2;
our $ATTRIBUTE_INO = 3;
our $ATTRIBUTE_SIZE = 4;
our $ATTRIBUTE_MODE = 5;
our $ATTRIBUTE_UID = 6;
our $ATTRIBUTE_GID = 7;
our $ATTRIBUTE_RDEV = 8;
our $ATTRIBUTE_CTIME = 9;
our $ATTRIBUTE_MTIME = 10;
our $ATTRIBUTE_ATIME = 11;
our $ATTRIBUTE_OTIME = 12;
our $ATTRIBUTE_XATTR_NAME = 13;
our $ATTRIBUTE_XATTR_DATA = 14;
our $ATTRIBUTE_PATH = 15;
our $ATTRIBUTE_PATH_TO = 16;
our $ATTRIBUTE_PATH_LINK = 17;
our $ATTRIBUTE_FILE_OFFSET = 18;
our $ATTRIBUTE_DATA = 19;
our $ATTRIBUTE_CLONE_UUID = 20;
our $ATTRIBUTE_CLONE_CTRANSID = 21;
our $ATTRIBUTE_CLONE_PATH = 22;
our $ATTRIBUTE_CLONE_OFFSET = 23;
our $ATTRIBUTE_CLONE_LEN = 24;

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

    $self->{header} = BtrfsStream::SendStreamHeader->new($self->{_io}, $self, $self->{_root});
    $self->{commands} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{commands}}, BtrfsStream::SendCommand->new($self->{_io}, $self, $self->{_root});
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub commands {
    my ($self) = @_;
    return $self->{commands};
}

########################################################################
package BtrfsStream::SendStreamHeader;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (98, 116, 114, 102, 115, 45, 115, 116, 114, 101, 97, 109, 0)));
    $self->{version} = $self->{_io}->read_u4le();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

########################################################################
package BtrfsStream::SendCommand;

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

    $self->{len_data} = $self->{_io}->read_u4le();
    $self->{type} = $self->{_io}->read_u2le();
    $self->{checksum} = $self->{_io}->read_bytes(4);
    $self->{_raw_data} = $self->{_io}->read_bytes($self->len_data());
    my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
    $self->{data} = BtrfsStream::SendCommand::Tlvs->new($io__raw_data, $self, $self->{_root});
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub _raw_data {
    my ($self) = @_;
    return $self->{_raw_data};
}

########################################################################
package BtrfsStream::SendCommand::Tlv;

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

    $self->{type} = $self->{_io}->read_u2le();
    $self->{length} = $self->{_io}->read_u2le();
    my $_on = $self->type();
    if ($_on == $ATTRIBUTE_SIZE) {
        $self->{value} = $self->{_io}->read_u8le();
    }
    elsif ($_on == $ATTRIBUTE_OTIME) {
        $self->{_raw_value} = $self->{_io}->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = BtrfsStream::SendCommand::Timespec->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on == $ATTRIBUTE_MODE) {
        $self->{value} = $self->{_io}->read_u8le();
    }
    elsif ($_on == $ATTRIBUTE_UUID) {
        $self->{_raw_value} = $self->{_io}->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = BtrfsStream::SendCommand::Uuid->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on == $ATTRIBUTE_CLONE_UUID) {
        $self->{_raw_value} = $self->{_io}->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = BtrfsStream::SendCommand::Uuid->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on == $ATTRIBUTE_ATIME) {
        $self->{_raw_value} = $self->{_io}->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = BtrfsStream::SendCommand::Timespec->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on == $ATTRIBUTE_GID) {
        $self->{value} = $self->{_io}->read_u8le();
    }
    elsif ($_on == $ATTRIBUTE_UID) {
        $self->{value} = $self->{_io}->read_u8le();
    }
    elsif ($_on == $ATTRIBUTE_CLONE_CTRANSID) {
        $self->{value} = $self->{_io}->read_u8le();
    }
    elsif ($_on == $ATTRIBUTE_PATH_TO) {
        $self->{_raw_value} = $self->{_io}->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = BtrfsStream::SendCommand::String->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on == $ATTRIBUTE_CTRANSID) {
        $self->{value} = $self->{_io}->read_u8le();
    }
    elsif ($_on == $ATTRIBUTE_CLONE_LEN) {
        $self->{value} = $self->{_io}->read_u8le();
    }
    elsif ($_on == $ATTRIBUTE_MTIME) {
        $self->{_raw_value} = $self->{_io}->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = BtrfsStream::SendCommand::Timespec->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on == $ATTRIBUTE_FILE_OFFSET) {
        $self->{value} = $self->{_io}->read_u8le();
    }
    elsif ($_on == $ATTRIBUTE_PATH_LINK) {
        $self->{_raw_value} = $self->{_io}->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = BtrfsStream::SendCommand::String->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on == $ATTRIBUTE_RDEV) {
        $self->{value} = $self->{_io}->read_u8le();
    }
    elsif ($_on == $ATTRIBUTE_CTIME) {
        $self->{_raw_value} = $self->{_io}->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = BtrfsStream::SendCommand::Timespec->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on == $ATTRIBUTE_CLONE_PATH) {
        $self->{_raw_value} = $self->{_io}->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = BtrfsStream::SendCommand::String->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on == $ATTRIBUTE_XATTR_NAME) {
        $self->{_raw_value} = $self->{_io}->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = BtrfsStream::SendCommand::String->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on == $ATTRIBUTE_PATH) {
        $self->{_raw_value} = $self->{_io}->read_bytes($self->length());
        my $io__raw_value = IO::KaitaiStruct::Stream->new($self->{_raw_value});
        $self->{value} = BtrfsStream::SendCommand::String->new($io__raw_value, $self, $self->{_root});
    }
    elsif ($_on == $ATTRIBUTE_CLONE_OFFSET) {
        $self->{value} = $self->{_io}->read_u8le();
    }
    else {
        $self->{value} = $self->{_io}->read_bytes($self->length());
    }
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub _raw_value {
    my ($self) = @_;
    return $self->{_raw_value};
}

########################################################################
package BtrfsStream::SendCommand::Uuid;

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

    $self->{uuid} = $self->{_io}->read_bytes(16);
}

sub uuid {
    my ($self) = @_;
    return $self->{uuid};
}

########################################################################
package BtrfsStream::SendCommand::Tlvs;

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

    $self->{tlv} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{tlv}}, BtrfsStream::SendCommand::Tlv->new($self->{_io}, $self, $self->{_root});
    }
}

sub tlv {
    my ($self) = @_;
    return $self->{tlv};
}

########################################################################
package BtrfsStream::SendCommand::String;

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

    $self->{string} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
}

sub string {
    my ($self) = @_;
    return $self->{string};
}

########################################################################
package BtrfsStream::SendCommand::Timespec;

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

    $self->{ts_sec} = $self->{_io}->read_s8le();
    $self->{ts_nsec} = $self->{_io}->read_s4le();
}

sub ts_sec {
    my ($self) = @_;
    return $self->{ts_sec};
}

sub ts_nsec {
    my ($self) = @_;
    return $self->{ts_nsec};
}

1;
