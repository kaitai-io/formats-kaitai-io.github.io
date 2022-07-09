# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package FalloutDat;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COMPRESSION_NONE = 32;
our $COMPRESSION_LZSS = 64;

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

    $self->{folder_count} = $self->{_io}->read_u4be();
    $self->{unknown1} = $self->{_io}->read_u4be();
    $self->{unknown2} = $self->{_io}->read_u4be();
    $self->{timestamp} = $self->{_io}->read_u4be();
    $self->{folder_names} = ();
    my $n_folder_names = $self->folder_count();
    for (my $i = 0; $i < $n_folder_names; $i++) {
        push @{$self->{folder_names}}, FalloutDat::Pstr->new($self->{_io}, $self, $self->{_root});
    }
    $self->{folders} = ();
    my $n_folders = $self->folder_count();
    for (my $i = 0; $i < $n_folders; $i++) {
        push @{$self->{folders}}, FalloutDat::Folder->new($self->{_io}, $self, $self->{_root});
    }
}

sub folder_count {
    my ($self) = @_;
    return $self->{folder_count};
}

sub unknown1 {
    my ($self) = @_;
    return $self->{unknown1};
}

sub unknown2 {
    my ($self) = @_;
    return $self->{unknown2};
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub folder_names {
    my ($self) = @_;
    return $self->{folder_names};
}

sub folders {
    my ($self) = @_;
    return $self->{folders};
}

########################################################################
package FalloutDat::Pstr;

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

    $self->{size} = $self->{_io}->read_u1();
    $self->{str} = Encode::decode("ASCII", $self->{_io}->read_bytes($self->size()));
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub str {
    my ($self) = @_;
    return $self->{str};
}

########################################################################
package FalloutDat::Folder;

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

    $self->{file_count} = $self->{_io}->read_u4be();
    $self->{unknown} = $self->{_io}->read_u4be();
    $self->{flags} = $self->{_io}->read_u4be();
    $self->{timestamp} = $self->{_io}->read_u4be();
    $self->{files} = ();
    my $n_files = $self->file_count();
    for (my $i = 0; $i < $n_files; $i++) {
        push @{$self->{files}}, FalloutDat::File->new($self->{_io}, $self, $self->{_root});
    }
}

sub file_count {
    my ($self) = @_;
    return $self->{file_count};
}

sub unknown {
    my ($self) = @_;
    return $self->{unknown};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub files {
    my ($self) = @_;
    return $self->{files};
}

########################################################################
package FalloutDat::File;

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

    $self->{name} = FalloutDat::Pstr->new($self->{_io}, $self, $self->{_root});
    $self->{flags} = $self->{_io}->read_u4be();
    $self->{offset} = $self->{_io}->read_u4be();
    $self->{size_unpacked} = $self->{_io}->read_u4be();
    $self->{size_packed} = $self->{_io}->read_u4be();
}

sub contents {
    my ($self) = @_;
    return $self->{contents} if ($self->{contents});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->offset());
    $self->{contents} = $io->read_bytes(($self->flags() == $FalloutDat::COMPRESSION_NONE ? $self->size_unpacked() : $self->size_packed()));
    $io->seek($_pos);
    return $self->{contents};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub size_unpacked {
    my ($self) = @_;
    return $self->{size_unpacked};
}

sub size_packed {
    my ($self) = @_;
    return $self->{size_packed};
}

1;
