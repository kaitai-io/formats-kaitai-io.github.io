# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use DosDatetime;

########################################################################
package Rar;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $BLOCK_TYPES_MARKER = 114;
our $BLOCK_TYPES_ARCHIVE_HEADER = 115;
our $BLOCK_TYPES_FILE_HEADER = 116;
our $BLOCK_TYPES_OLD_STYLE_COMMENT_HEADER = 117;
our $BLOCK_TYPES_OLD_STYLE_AUTHENTICITY_INFO_76 = 118;
our $BLOCK_TYPES_OLD_STYLE_SUBBLOCK = 119;
our $BLOCK_TYPES_OLD_STYLE_RECOVERY_RECORD = 120;
our $BLOCK_TYPES_OLD_STYLE_AUTHENTICITY_INFO_79 = 121;
our $BLOCK_TYPES_SUBBLOCK = 122;
our $BLOCK_TYPES_TERMINATOR = 123;

our $METHODS_STORE = 48;
our $METHODS_FASTEST = 49;
our $METHODS_FAST = 50;
our $METHODS_NORMAL = 51;
our $METHODS_GOOD = 52;
our $METHODS_BEST = 53;

our $OSES_MS_DOS = 0;
our $OSES_OS_2 = 1;
our $OSES_WINDOWS = 2;
our $OSES_UNIX = 3;
our $OSES_MAC_OS = 4;
our $OSES_BEOS = 5;

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

    $self->{magic} = Rar::MagicSignature->new($self->{_io}, $self, $self->{_root});
    $self->{blocks} = [];
    while (!$self->{_io}->is_eof()) {
        my $_on = $self->magic()->version();
        if ($_on == 0) {
            push @{$self->{blocks}}, Rar::Block->new($self->{_io}, $self, $self->{_root});
        }
        elsif ($_on == 1) {
            push @{$self->{blocks}}, Rar::BlockV5->new($self->{_io}, $self, $self->{_root});
        }
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub blocks {
    my ($self) = @_;
    return $self->{blocks};
}

########################################################################
package Rar::Block;

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

    $self->{crc16} = $self->{_io}->read_u2le();
    $self->{block_type} = $self->{_io}->read_u1();
    $self->{flags} = $self->{_io}->read_u2le();
    $self->{block_size} = $self->{_io}->read_u2le();
    if ($self->has_add()) {
        $self->{add_size} = $self->{_io}->read_u4le();
    }
    my $_on = $self->block_type();
    if ($_on == $Rar::BLOCK_TYPES_FILE_HEADER) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->body_size());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Rar::BlockFileHeader->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->body_size());
    }
    if ($self->has_add()) {
        $self->{add_body} = $self->{_io}->read_bytes($self->add_size());
    }
}

sub body_size {
    my ($self) = @_;
    return $self->{body_size} if ($self->{body_size});
    $self->{body_size} = $self->block_size() - $self->header_size();
    return $self->{body_size};
}

sub has_add {
    my ($self) = @_;
    return $self->{has_add} if ($self->{has_add});
    $self->{has_add} = ($self->flags() & 32768) != 0;
    return $self->{has_add};
}

sub header_size {
    my ($self) = @_;
    return $self->{header_size} if ($self->{header_size});
    $self->{header_size} = ($self->has_add() ? 11 : 7);
    return $self->{header_size};
}

sub crc16 {
    my ($self) = @_;
    return $self->{crc16};
}

sub block_type {
    my ($self) = @_;
    return $self->{block_type};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub block_size {
    my ($self) = @_;
    return $self->{block_size};
}

sub add_size {
    my ($self) = @_;
    return $self->{add_size};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub add_body {
    my ($self) = @_;
    return $self->{add_body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package Rar::BlockFileHeader;

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

    $self->{low_unp_size} = $self->{_io}->read_u4le();
    $self->{host_os} = $self->{_io}->read_u1();
    $self->{file_crc32} = $self->{_io}->read_u4le();
    $self->{_raw_file_time} = $self->{_io}->read_bytes(4);
    my $io__raw_file_time = IO::KaitaiStruct::Stream->new($self->{_raw_file_time});
    $self->{file_time} = DosDatetime->new($io__raw_file_time);
    $self->{rar_version} = $self->{_io}->read_u1();
    $self->{method} = $self->{_io}->read_u1();
    $self->{name_size} = $self->{_io}->read_u2le();
    $self->{attr} = $self->{_io}->read_u4le();
    if (($self->_parent()->flags() & 256) != 0) {
        $self->{high_pack_size} = $self->{_io}->read_u4le();
    }
    $self->{file_name} = $self->{_io}->read_bytes($self->name_size());
    if (($self->_parent()->flags() & 1024) != 0) {
        $self->{salt} = $self->{_io}->read_u8le();
    }
}

sub low_unp_size {
    my ($self) = @_;
    return $self->{low_unp_size};
}

sub host_os {
    my ($self) = @_;
    return $self->{host_os};
}

sub file_crc32 {
    my ($self) = @_;
    return $self->{file_crc32};
}

sub file_time {
    my ($self) = @_;
    return $self->{file_time};
}

sub rar_version {
    my ($self) = @_;
    return $self->{rar_version};
}

sub method {
    my ($self) = @_;
    return $self->{method};
}

sub name_size {
    my ($self) = @_;
    return $self->{name_size};
}

sub attr {
    my ($self) = @_;
    return $self->{attr};
}

sub high_pack_size {
    my ($self) = @_;
    return $self->{high_pack_size};
}

sub file_name {
    my ($self) = @_;
    return $self->{file_name};
}

sub salt {
    my ($self) = @_;
    return $self->{salt};
}

sub _raw_file_time {
    my ($self) = @_;
    return $self->{_raw_file_time};
}

########################################################################
package Rar::BlockV5;

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

}

########################################################################
package Rar::MagicSignature;

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

    $self->{magic1} = $self->{_io}->read_bytes(6);
    $self->{version} = $self->{_io}->read_u1();
    if ($self->version() == 1) {
        $self->{magic3} = $self->{_io}->read_bytes(1);
    }
}

sub magic1 {
    my ($self) = @_;
    return $self->{magic1};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub magic3 {
    my ($self) = @_;
    return $self->{magic3};
}

1;
