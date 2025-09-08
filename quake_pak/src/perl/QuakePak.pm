# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package QuakePak;

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
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{ofs_index} = $self->{_io}->read_u4le();
    $self->{len_index} = $self->{_io}->read_u4le();
}

sub index {
    my ($self) = @_;
    return $self->{index} if ($self->{index});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_index());
    $self->{_raw_index} = $self->{_io}->read_bytes($self->len_index());
    my $io__raw_index = IO::KaitaiStruct::Stream->new($self->{_raw_index});
    $self->{index} = QuakePak::IndexStruct->new($io__raw_index, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{index};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub ofs_index {
    my ($self) = @_;
    return $self->{ofs_index};
}

sub len_index {
    my ($self) = @_;
    return $self->{len_index};
}

sub _raw_index {
    my ($self) = @_;
    return $self->{_raw_index};
}

########################################################################
package QuakePak::IndexEntry;

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

    $self->{name} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate(IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(56), 0), 0, 0));
    $self->{ofs} = $self->{_io}->read_u4le();
    $self->{size} = $self->{_io}->read_u4le();
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs());
    $self->{body} = $io->read_bytes($self->size());
    $io->seek($_pos);
    return $self->{body};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub ofs {
    my ($self) = @_;
    return $self->{ofs};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

########################################################################
package QuakePak::IndexStruct;

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

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, QuakePak::IndexEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

1;
