# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
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

    $self->{ofs_meta} = $self->{_io}->read_u4le();
}

sub meta {
    my ($self) = @_;
    return $self->{meta} if ($self->{meta});
    if ($self->ofs_meta() != 0) {
        my $_pos = $self->{_io}->pos();
        $self->{_io}->seek($self->ofs_meta());
        $self->{meta} = FtlDat::Meta->new($self->{_io}, $self, $self->{_root});
        $self->{_io}->seek($_pos);
    }
    return $self->{meta};
}

sub ofs_meta {
    my ($self) = @_;
    return $self->{ofs_meta};
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

    $self->{len_file} = $self->{_io}->read_u4le();
    $self->{len_filename} = $self->{_io}->read_u4le();
    $self->{filename} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_filename()));
    $self->{body} = $self->{_io}->read_bytes($self->len_file());
}

sub len_file {
    my ($self) = @_;
    return $self->{len_file};
}

sub len_filename {
    my ($self) = @_;
    return $self->{len_filename};
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
