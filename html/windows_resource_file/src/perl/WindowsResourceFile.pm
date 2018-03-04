# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package WindowsResourceFile;

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

    $self->{resources} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{resources}}, WindowsResourceFile::Resource->new($self->{_io}, $self, $self->{_root});
    }
}

sub resources {
    my ($self) = @_;
    return $self->{resources};
}

########################################################################
package WindowsResourceFile::Resource;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $PREDEF_TYPES_CURSOR = 1;
our $PREDEF_TYPES_BITMAP = 2;
our $PREDEF_TYPES_ICON = 3;
our $PREDEF_TYPES_MENU = 4;
our $PREDEF_TYPES_DIALOG = 5;
our $PREDEF_TYPES_STRING = 6;
our $PREDEF_TYPES_FONTDIR = 7;
our $PREDEF_TYPES_FONT = 8;
our $PREDEF_TYPES_ACCELERATOR = 9;
our $PREDEF_TYPES_RCDATA = 10;
our $PREDEF_TYPES_MESSAGETABLE = 11;
our $PREDEF_TYPES_GROUP_CURSOR = 12;
our $PREDEF_TYPES_GROUP_ICON = 14;
our $PREDEF_TYPES_VERSION = 16;
our $PREDEF_TYPES_DLGINCLUDE = 17;
our $PREDEF_TYPES_PLUGPLAY = 19;
our $PREDEF_TYPES_VXD = 20;
our $PREDEF_TYPES_ANICURSOR = 21;
our $PREDEF_TYPES_ANIICON = 22;
our $PREDEF_TYPES_HTML = 23;
our $PREDEF_TYPES_MANIFEST = 24;

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

    $self->{value_size} = $self->{_io}->read_u4le();
    $self->{header_size} = $self->{_io}->read_u4le();
    $self->{type} = WindowsResourceFile::UnicodeOrId->new($self->{_io}, $self, $self->{_root});
    $self->{name} = WindowsResourceFile::UnicodeOrId->new($self->{_io}, $self, $self->{_root});
    $self->{padding1} = $self->{_io}->read_bytes(((4 - $self->_io()->pos()) % 4));
    $self->{format_version} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u2le();
    $self->{language} = $self->{_io}->read_u2le();
    $self->{value_version} = $self->{_io}->read_u4le();
    $self->{characteristics} = $self->{_io}->read_u4le();
    $self->{value} = $self->{_io}->read_bytes($self->value_size());
    $self->{padding2} = $self->{_io}->read_bytes(((4 - $self->_io()->pos()) % 4));
}

sub type_as_predef {
    my ($self) = @_;
    return $self->{type_as_predef} if ($self->{type_as_predef});
    if ( ((!($self->type()->is_string())) && ($self->type()->as_numeric() <= 255)) ) {
        $self->{type_as_predef} = $self->type()->as_numeric();
    }
    return $self->{type_as_predef};
}

sub value_size {
    my ($self) = @_;
    return $self->{value_size};
}

sub header_size {
    my ($self) = @_;
    return $self->{header_size};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub padding1 {
    my ($self) = @_;
    return $self->{padding1};
}

sub format_version {
    my ($self) = @_;
    return $self->{format_version};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub language {
    my ($self) = @_;
    return $self->{language};
}

sub value_version {
    my ($self) = @_;
    return $self->{value_version};
}

sub characteristics {
    my ($self) = @_;
    return $self->{characteristics};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub padding2 {
    my ($self) = @_;
    return $self->{padding2};
}

########################################################################
package WindowsResourceFile::UnicodeOrId;

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

    if ($self->save_pos1() >= 0) {
        $self->{first} = $self->{_io}->read_u2le();
    }
    if (!($self->is_string())) {
        $self->{as_numeric} = $self->{_io}->read_u2le();
    }
    if ($self->is_string()) {
        $self->{rest} = ();
        do {
            $_ = $self->{_io}->read_u2le();
            push @{$self->{rest}}, $_;
        } until ($_ == 0);
    }
    if ( (($self->is_string()) && ($self->save_pos2() >= 0)) ) {
        $self->{noop} = $self->{_io}->read_bytes(0);
    }
}

sub save_pos1 {
    my ($self) = @_;
    return $self->{save_pos1} if ($self->{save_pos1});
    $self->{save_pos1} = $self->_io()->pos();
    return $self->{save_pos1};
}

sub save_pos2 {
    my ($self) = @_;
    return $self->{save_pos2} if ($self->{save_pos2});
    $self->{save_pos2} = $self->_io()->pos();
    return $self->{save_pos2};
}

sub is_string {
    my ($self) = @_;
    return $self->{is_string} if ($self->{is_string});
    $self->{is_string} = $self->first() != 65535;
    return $self->{is_string};
}

sub as_string {
    my ($self) = @_;
    return $self->{as_string} if ($self->{as_string});
    if ($self->is_string()) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->save_pos1());
        $self->{as_string} = Encode::decode("UTF-16LE", $self->{_io}->read_bytes((($self->save_pos2() - $self->save_pos1()) - 2)));
        $self->{_io}->seek($_pos);
    }
    return $self->{as_string};
}

sub first {
    my ($self) = @_;
    return $self->{first};
}

sub as_numeric {
    my ($self) = @_;
    return $self->{as_numeric};
}

sub rest {
    my ($self) = @_;
    return $self->{rest};
}

sub noop {
    my ($self) = @_;
    return $self->{noop};
}

1;
