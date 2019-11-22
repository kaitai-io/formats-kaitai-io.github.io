# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;
use Compress::Zlib;

########################################################################
package Fallout2Dat;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COMPRESSION_NONE = 0;
our $COMPRESSION_ZLIB = 1;

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

}

sub footer {
    my ($self) = @_;
    return $self->{footer} if ($self->{footer});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->_io()->size() - 8));
    $self->{footer} = Fallout2Dat::Footer->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{footer};
}

sub index {
    my ($self) = @_;
    return $self->{index} if ($self->{index});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek((($self->_io()->size() - 8) - $self->footer()->index_size()));
    $self->{index} = Fallout2Dat::Index->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{index};
}

########################################################################
package Fallout2Dat::Pstr;

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
package Fallout2Dat::Footer;

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

    $self->{index_size} = $self->{_io}->read_u4le();
    $self->{file_size} = $self->{_io}->read_u4le();
}

sub index_size {
    my ($self) = @_;
    return $self->{index_size};
}

sub file_size {
    my ($self) = @_;
    return $self->{file_size};
}

########################################################################
package Fallout2Dat::Index;

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

    $self->{file_count} = $self->{_io}->read_u4le();
    $self->{files} = ();
    my $n_files = $self->file_count();
    for (my $i = 0; $i < $n_files; $i++) {
        $self->{files}[$i] = Fallout2Dat::File->new($self->{_io}, $self, $self->{_root});
    }
}

sub file_count {
    my ($self) = @_;
    return $self->{file_count};
}

sub files {
    my ($self) = @_;
    return $self->{files};
}

########################################################################
package Fallout2Dat::File;

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

    $self->{name} = Fallout2Dat::Pstr->new($self->{_io}, $self, $self->{_root});
    $self->{flags} = $self->{_io}->read_u1();
    $self->{size_unpacked} = $self->{_io}->read_u4le();
    $self->{size_packed} = $self->{_io}->read_u4le();
    $self->{offset} = $self->{_io}->read_u4le();
}

sub contents {
    my ($self) = @_;
    return $self->{contents} if ($self->{contents});
    if ($self->flags() == $COMPRESSION_ZLIB) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->offset());
        $self->{_raw_contents} = $io->read_bytes($self->size_packed());
        $self->{contents} = Compress::Zlib::uncompress($self->{_raw_contents});
        $io->seek($_pos);
    }
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

sub size_unpacked {
    my ($self) = @_;
    return $self->{size_unpacked};
}

sub size_packed {
    my ($self) = @_;
    return $self->{size_packed};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

sub _raw_contents {
    my ($self) = @_;
    return $self->{_raw_contents};
}

1;
