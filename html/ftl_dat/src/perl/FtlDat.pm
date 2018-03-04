# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package FtlDat;

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

    $self->{num_files} = $self->{_io}->read_u4le();
    $self->{files} = ();
    my $n_files = $self->num_files();
    for (my $i = 0; $i < $n_files; $i++) {
        $self->{files}[$i] = FtlDat::File->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_files {
    my ($self) = @_;
    return $self->{num_files};
}

sub files {
    my ($self) = @_;
    return $self->{files};
}

########################################################################
package FtlDat::File;

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

    $self->{meta_ofs} = $self->{_io}->read_u4le();
}

sub meta {
    my ($self) = @_;
    return $self->{meta} if ($self->{meta});
    if ($self->meta_ofs() != 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->meta_ofs());
        $self->{meta} = FtlDat::Meta->new($self->{_io}, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{meta};
}

sub meta_ofs {
    my ($self) = @_;
    return $self->{meta_ofs};
}

########################################################################
package FtlDat::Meta;

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

    $self->{file_size} = $self->{_io}->read_u4le();
    $self->{filename_size} = $self->{_io}->read_u4le();
    $self->{filename} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->filename_size()));
    $self->{body} = $self->{_io}->read_bytes($self->file_size());
}

sub file_size {
    my ($self) = @_;
    return $self->{file_size};
}

sub filename_size {
    my ($self) = @_;
    return $self->{filename_size};
}

sub filename {
    my ($self) = @_;
    return $self->{filename};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

1;
