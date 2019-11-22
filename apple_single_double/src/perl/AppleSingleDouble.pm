# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;

########################################################################
package AppleSingleDouble;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $FILE_TYPE_APPLE_SINGLE = 333312;
our $FILE_TYPE_APPLE_DOUBLE = 333319;

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

    $self->{magic} = $self->{_io}->read_u4be();
    $self->{version} = $self->{_io}->read_u4be();
    $self->{reserved} = $self->{_io}->read_bytes(16);
    $self->{num_entries} = $self->{_io}->read_u2be();
    $self->{entries} = ();
    my $n_entries = $self->num_entries();
    for (my $i = 0; $i < $n_entries; $i++) {
        $self->{entries}[$i] = AppleSingleDouble::Entry->new($self->{_io}, $self, $self->{_root});
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub num_entries {
    my ($self) = @_;
    return $self->{num_entries};
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package AppleSingleDouble::Entry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TYPES_DATA_FORK = 1;
our $TYPES_RESOURCE_FORK = 2;
our $TYPES_REAL_NAME = 3;
our $TYPES_COMMENT = 4;
our $TYPES_ICON_BW = 5;
our $TYPES_ICON_COLOR = 6;
our $TYPES_FILE_DATES_INFO = 8;
our $TYPES_FINDER_INFO = 9;
our $TYPES_MACINTOSH_FILE_INFO = 10;
our $TYPES_PRODOS_FILE_INFO = 11;
our $TYPES_MSDOS_FILE_INFO = 12;
our $TYPES_AFP_SHORT_NAME = 13;
our $TYPES_AFP_FILE_INFO = 14;
our $TYPES_AFP_DIRECTORY_ID = 15;

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

    $self->{type} = $self->{_io}->read_u4be();
    $self->{ofs_body} = $self->{_io}->read_u4be();
    $self->{len_body} = $self->{_io}->read_u4be();
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_body());
    my $_on = $self->type();
    if ($_on == $TYPES_FINDER_INFO) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = AppleSingleDouble::FinderInfo->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->len_body());
    }
    $self->{_io}->seek($_pos);
    return $self->{body};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub ofs_body {
    my ($self) = @_;
    return $self->{ofs_body};
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package AppleSingleDouble::FinderInfo;

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

    $self->{file_type} = $self->{_io}->read_bytes(4);
    $self->{file_creator} = $self->{_io}->read_bytes(4);
    $self->{flags} = $self->{_io}->read_u2be();
    $self->{location} = AppleSingleDouble::Point->new($self->{_io}, $self, $self->{_root});
    $self->{folder_id} = $self->{_io}->read_u2be();
}

sub file_type {
    my ($self) = @_;
    return $self->{file_type};
}

sub file_creator {
    my ($self) = @_;
    return $self->{file_creator};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub location {
    my ($self) = @_;
    return $self->{location};
}

sub folder_id {
    my ($self) = @_;
    return $self->{folder_id};
}

########################################################################
package AppleSingleDouble::Point;

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

    $self->{x} = $self->{_io}->read_u2be();
    $self->{y} = $self->{_io}->read_u2be();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

1;
